class ubus_scb_predictor extends uvm_component;
    // UVM Factory //
    `uvm_component_utils(ubus_scb_predictor)

    // Analysis ports for input and output transactions
    // Master Monitor의 트랜잭션을 받기 위한 임포트
    uvm_analysis_imp #(packet, ubus_scb_predictor) master_export; 
    
    // Checker로 예상 트랜잭션(정답)을 보내기 위한 포트
    uvm_analysis_port #(packet) pred_port;

    // 💡 Slave Sequencer 핸들: Sequencer의 메모리 모델을 참조하기 위함.
    slave_sequencer slave_sequencer; 

    // Constructor
    function new(string name, uvm_component parent);
        super.new(name, parent);
        master_export = new("master_export", this);
        pred_port = new("pred_port", this);
    endfunction

    // Component Creation & Configuration
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        
        // 💡 Slave Sequencer 핸들을 config_db에서 가져옵니다. 
        // Test 파일에서 이 핸들을 설정해 주어야 합니다.
        if(!uvm_config_db#(slave_sequencer)::get(this,"*","slave_sequencer_handle", slv_sqr)) begin
            `uvm_fatal("NO_SQC", "Failed to get slave_sequencer handle from config_db")
        end
    endfunction

    // -------------------------------------------------------------
    // TLM Callback: Master Monitor로부터 트랜잭션 수신
    // -------------------------------------------------------------
    virtual function void write(packet tr);
        // 들어온 트랜잭션은 Predictor의 예측 로직을 통과합니다.
        if (tr.write) begin
            // Write: 메모리 모델 업데이트 (상태 변화)
            predict_write(tr);
        end
        if (tr.read) begin
            // Read: 메모리 모델에서 정답을 읽어와 Checker로 전송 (정답 예측)
            packet predicted_tr = predict_read(tr);
            pred_port.write(predicted_tr);
        end
    endfunction

    // -------------------------------------------------------------
    // Prediction Logic: Write (상태 모델 업데이트)
    // -------------------------------------------------------------
    protected function void predict_write(packet master_tr);
        `uvm_info("PREDICTOR", $sformatf("Write prediction: updating memory at 0x%h, size %0d", 
                                        master_tr.addr, master_tr.size), UVM_LOW)
        
        // 💡 Slave Sequencer의 m_mem 메모리를 업데이트합니다.
        for (int i = 0; i < master_tr.size; i++) begin
            int unsigned addr = master_tr.addr + i;
            slv_sqr.m_mem[addr] = master_tr.data[i];
        end
    endfunction

    // -------------------------------------------------------------
    // Prediction Logic: Read (정답 생성)
    // -------------------------------------------------------------
    protected function packet predict_read(packet master_tr);
        packet predicted_tr;
        
        predicted_tr = packet::type_id::create("predicted_tr");
        predicted_tr.copy(master_tr);
        
        // Read 트랜잭션의 데이터 배열을 초기화합니다.
        predicted_tr.data = new[master_tr.size];
        
        // 💡 Slave Sequencer의 m_mem 메모리에서 예상 데이터를 읽어옵니다.
        for (int i = 0; i < master_tr.size; i++) begin
            int unsigned addr = master_tr.addr + i;
            
            if (slv_sqr.m_mem.exists(addr)) begin
                // 메모리에 존재하는 경우: 저장된 값이 정답입니다.
                predicted_tr.data[i] = slv_sqr.m_mem[addr];
            end else begin
                // 메모리에 존재하지 않는 경우 (초기화되지 않은 Read): 
                // 해당 주소에 대한 Write가 없었다면 0 또는 기본값(UBus 초기값)으로 가정합니다.
                // 여기서는 0으로 가정합니다.
                predicted_tr.data[i] = 8'h00; 
            end
        end
        
        `uvm_info("PREDICTOR", $sformatf("Read prediction complete: Addr 0x%h, Data %p", 
                                        predicted_tr.addr, predicted_tr.data), UVM_LOW)
        return predicted_tr;
    endfunction

endclass