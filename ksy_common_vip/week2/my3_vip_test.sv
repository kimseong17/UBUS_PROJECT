class my3_vip_test extends uvm_test;

    `uvm_component_utils(my3_vip_test)

    my3_vip_environment env; // 저장할 변수

    function new(string name = "my3_vip_test", uvm_component parent = null);
        super.new(name, parent);
	//`uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
	//`uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
        env = my3_vip_environment::type_id::create("env", this); //객체가 생성될 때 build_phase 자동 호출
    endfunction


    function void start_of_simulation_phase(uvm_phase phase); //시뮬레이션 시작전 UVM이 자동호출
        super.start_of_simulation_phase(phase); //부모 phase class의 기본 동작 수행
	uvm_root::get().print_topology(); // 최상위 객체 아래에 계층적 구조를 tree 형태로 출력
	uvm_factory::get().print(); //사용자 등록 class 출력
	//`uvm_info("TRACE", $sformatf("%m"),UVM_HIGH);
       
	//dynamic array 내부 class에서 설정 - success
        if (env != null && env.tr != null) begin
	    //env.tr.wait_state = new[4];
            for(int i=0;i<4; i++) begin 
	    	env.tr.randomize();
            	env.tr.print(); 
					
		`uvm_info("UBUS_TRANS", $sformatf("addr=%0h read=%0b write=%0b size=%0d data=%0p wait=%p error=%0b",
            	env.tr.addr, env.tr.read, env.tr.write,
            	env.tr.size, env.tr.data, env.tr.wait_state, env.tr.error), UVM_HIGH);		
	    end
	end else begin
		`uvm_error("NULL", "env.tr is null! Check build_phase")
	end    
	
       //dynamic array test에서 설정 - error
       /*if (env != null && env.tr != null) begin
		env.tr.randomize() with { size inside {[0:3]}; };
		env.tr.wait_state = new[env.tr.size];

		env.tr.randomize() with { size == env.tr.size;    	
		};

		env.tr.print(); 
		`uvm_info("TR_VAL", $sformatf("addr=%0h read=%0b write=%0b size=%0d data=%0h wait=%p error=%0b",
            	env.tr.addr, env.tr.read, env.tr.write,
            	env.tr.size, env.tr.data, env.tr.wait_state, env.tr.error), UVM_HIGH);		end  */
	
       /* if (env != null) begin
            if (env.tr != null) begin
                env.tr.randomize();
                `uvm_info("TR_VAL", $sformatf("addr=%0h read=%0b write=%0b size=%0d data=%0h wait=%p error=%0b",
            env.tr.addr, env.tr.read, env.tr.write,
            env.tr.size, env.tr.data, env.tr.wait_state, env.tr.error), UVM_HIGH)
            end else begin
                `uvm_error("TR_NULL", "env.tr is null! Check build_phase")
            end
        end  */
    endfunction 

endclass
