
class my3_vip_environment extends uvm_env;

    packet tr;

    `uvm_component_utils(my3_vip_environment) // object와 다르게 계층적임 , 테스트벤치의 구조적 component , phase관리 가능

    function new(string name = "my3_vip_environment" , uvm_component parent=null);

        super.new(name,parent);
    endfunction: new

    function void build_phase(uvm_phase phase); // 함수이름과 phase 이름이 매칭되어 자동 호출
        super.build_phase(phase);
        tr = packet::type_id::create("tr",this);

    endfunction

endclass
