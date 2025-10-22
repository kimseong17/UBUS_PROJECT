
class my3_vip_master_environment extends uvm_env;

    packet tr;
    master_agent m_agent;

    `uvm_component_utils(my3_vip_master_environment) // object와 다르게 계층적임 , 테스트벤치의 구조적 component , phase관리 가능
    function new(string name = "my3_vip_master_environment" , uvm_component parent=null);

        super.new(name,parent);
    endfunction: new

    function void build_phase(uvm_phase phase); // 함수이름과 phase 이름이 매칭되어 자동 호출
        super.build_phase(phase);
        tr = packet::type_id::create("tr",this);
	m_agent = master_agent::type_id::create("m_agent",this);
    endfunction

endclass
