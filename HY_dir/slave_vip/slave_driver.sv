class slave_driver extends uvm_driver #(ubus_transfer);
    `uvm_component_utils(slave_driver)
    
    virtual ubus_if vif;
    
    // ========================================
    // WAIT 신호 제어 파라미터
    // ========================================
    int wait_cycles_min = 0;
    int wait_cycles_max = 5;
    int wait_probability = 100;
    bit wait_enable = 1;
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
        `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    endfunction: new
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual ubus_if)::get(this, "", "vif", vif)) begin
            `uvm_fatal("NOVIF", "virtual interface not set for this driver instance")
        end
        
        `uvm_info("SLV_DRV", 
            $sformatf("WAIT Config: enable=%0d, prob=%0d%%, cycles=[%0d:%0d]",
                wait_enable, wait_probability, wait_cycles_min, wait_cycles_max), 
            UVM_MEDIUM)
    endfunction: build_phase
    
    // ========================================
    // fork-join으로 병렬 처리
    // ========================================
    task run_phase(uvm_phase phase);
        fork
            // Process 1: WAIT 신호 모니터링
            monitor_and_generate_wait();
            
            // Process 2: 트랜잭션 처리
            handle_transactions();
        join
    endtask: run_phase
    
    // ========================================
    // Process 1: WAIT 신호 모니터링
    // ========================================
    virtual protected task monitor_and_generate_wait();
        forever begin
            @(posedge vif.clk);  // ← clk로 수정
            
            // Master 요청 감지 (read 또는 write 신호)
            if (vif.read || vif.write) begin  // ← ubus_ 접두사 제거
                
                if (wait_enable && $urandom_range(100) < wait_probability) begin
                    int wait_cycles = $urandom_range(wait_cycles_min, wait_cycles_max);
                    
                    `uvm_info("SLV_DRV", 
                        $sformatf("Generating WAIT: %0d cycles for %s at addr=0x%0h", 
                            wait_cycles,
                            vif.write ? "WRITE" : "READ",
                            vif.addr),  // ← ubus_addr → addr
                        UVM_MEDIUM)
                    
                    // WAIT 신호 발생
                    repeat(wait_cycles) begin
                        vif.wait_state <= 1'b1;  // ← ubus_wait → wait_state
                        @(posedge vif.clk);
                    end
                    
                    vif.wait_state <= 1'b0;
                end
            end
        end
    endtask: monitor_and_generate_wait
    
    // ========================================
    // Process 2: 트랜잭션 처리
    // ========================================
    virtual protected task handle_transactions();
        forever begin
            ubus_transfer rsp;
            seq_item_port.get_next_item(rsp);
            
            if (rsp.read) begin
                drive_read_response(rsp);
            end else if (rsp.write) begin
                drive_write_response(rsp);
            end
            
            seq_item_port.item_done(rsp);
        end
    endtask: handle_transactions
    
    // READ 응답 구동
    virtual protected task drive_read_response(ubus_transfer rsp);
        `uvm_info("SLV_DRV", "Processing READ transaction", UVM_LOW)
        
        for (int i=0; i<rsp.size; i++) begin
            vif.wait_state <= 1'b0;  // 준비 완료
            vif.data <= rsp.data[i];
            vif.bip  <= (i == rsp.size - 1) ? 0 : 1;
            @(posedge vif.clk);
        end
        
        // 신호 해제
        vif.data <= 'z;
        vif.bip  <= 'z;
    endtask: drive_read_response
    
    // WRITE 응답 구동
    virtual protected task drive_write_response(ubus_transfer rsp);
        `uvm_info("SLV_DRV", "Processing WRITE transaction", UVM_LOW)
        
        vif.wait_state <= 1'b0;  // 준비 완료
        vif.error      <= rsp.error;
        @(posedge vif.clk);
        
        // 신호 해제
        vif.error <= 'z;
    endtask: drive_write_response

endclass: slave_driver
                    
