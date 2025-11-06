class packet extends uvm_sequence_item;
           
    rand bit [15:0] addr;
    rand bit read;
    rand bit write;
    rand bit [1:0] size;
    rand bit [7:0] data[];
    rand bit wait_state[];
    //rand bit wait_state;
    rand bit error;

    function new(string name = "packet");
        super.new(name);
      //  `uvm_info("TRACE",$sformatf("%m"), UVM_HIGH);  // 계층정보
    endfunction: new

    /*function void post_randomize();
    // size가 랜덤으로 결정된 이후 자동으로 호출됨
                 wait_state = new[size];
                 foreach (wait_state[i]) begin
                          wait_state[i] = $urandom_range(0,8);
                 end
    endfunction */
    constraint c_wait_state { wait_state.size() inside{[0:2]};}
    constraint c_data { data.size() inside{[0:8]};}



    // 메크로 세트 , UVM 클래스 등록 + 자동화
    `uvm_object_utils_begin(packet)  // UVM Factory에 class 등록 + 필드 자동화 (동적)
        `uvm_field_int(addr, UVM_DEFAULT) // 맴버를 UVM 시스템에 등록 => 자동화 , copy compare print etc 가능하게 해줌
        `uvm_field_int(read, UVM_DEFAULT)
        `uvm_field_int(write, UVM_DEFAULT)
        `uvm_field_int(size, UVM_DEFAULT)
        `uvm_field_array_int(data, UVM_DEFAULT)
        `uvm_field_int(error, UVM_DEFAULT)
        `uvm_field_array_int(wait_state, UVM_DEFAULT)
        //`uvm_field_int(wait_state, UVM_DEFAULT)
    `uvm_object_utils_end


endclass: packet

