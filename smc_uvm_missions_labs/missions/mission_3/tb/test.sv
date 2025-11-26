class test;

    environment	    env;
    
    function new(virtual apb_interface apb_if);
	env = new(apb_if);
    endfunction

    task run();
	env.run();
    endtask

endclass
