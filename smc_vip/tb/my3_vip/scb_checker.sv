class ubus_scb_checker extends uvm_component;
    `uvm_component_utils(ubus_scb_checker)

    // ------------------------------------------
    // TLM Ports and FIFOs
    // ------------------------------------------

    // Predictor로부터 예상 Read TR를 받는 Analysis FIFO
    uvm_tlm_analysis_fifo #(packet) predicted_fifo;
    
    // Master Monitor로부터 실제 TR를 받는 Analysis FIFO
    uvm_tlm_analysis_fifo #(packet) actual_fifo;
    
    // ------------------------------------------
    // Constructor
    // ------------------------------------------
    function new(string name = "ubus_scb_checker", uvm_component parent = null);
        super.new(name, parent);
        predicted_fifo = new("predicted_fifo", this);
        actual_fifo = new("actual_fifo", this);
    endfunction

    // ------------------------------------------
    // Simulation Execution (주 비교 로직)
    // ------------------------------------------
    task run_phase(uvm_phase phase);
        packet expected_tr; 
        packet actual_tr;   

        forever begin
            // 1. Predicted TR가 도착할 때까지 대기
            predicted_fifo.get(expected_tr); 
            
            // 2. 해당 Predicted TR와 일치하는 Actual TR가 도착할 때까지 대기
            actual_fifo.get(actual_tr); 

            // Predictor는 Read 요청에 대한 예상 응답만 보냅니다.
            if (actual_tr.read == 1'b1) begin 
                compare_read_data(actual_tr, expected_tr); 
            end else begin
                `uvm_warning(get_full_name(), "Received unexpected TR type or order from Monitor/Predictor.")
            end
        end
    endtask

    // ------------------------------------------
    // Comparison Logic
    // ------------------------------------------
    function void compare_read_data(packet actual, packet expected);
        string comparison_msg;
        
        // 1. 기본 트랜잭션 정보 일치 확인 (Read/Write 플래그, 주소, 크기)
        if (actual.addr != expected.addr || actual.size != expected.size || actual.read != expected.read) begin
             `uvm_error(get_full_name(), 
                 $sformatf("Mismatch in basic fields! Actual: %s Expected: %s", actual.sprint(), expected.sprint()))
             return;
        end
        
        // 2. Read 데이터 비교 (핵심 검증)
        if (actual.data.size() != expected.data.size()) begin
            `uvm_error(get_full_name(), 
                 $sformatf("Data array size mismatch! Actual: %0d Expected: %0d", actual.data.size(), expected.data.size()))
            return;
        end
        
        // UVM의 compare() 함수를 사용하여 데이터 배열을 비교합니다.
        if (actual.data.compare(expected.data) == 0) begin
            // 💡 데이터 불일치
            comparison_msg = $sformatf("READ FAILURE: Data Mismatch @ Addr 0x%0h. \n Actual Data: %p \n Predicted Data: %p",
                                      actual.addr, actual.data, expected.data);
            `uvm_error("DATA_FAIL", comparison_msg)
        end else begin
            // 💡 데이터 일치 (검증 성공)
            comparison_msg = $sformatf("READ SUCCESS: Data matched @ Addr 0x%0h. Data: %p",
                                      actual.addr, actual.data);
            `uvm_info("READ_PASS", comparison_msg, UVM_LOW)
        end
    endfunction
    
endclass