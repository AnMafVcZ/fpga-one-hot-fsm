SRC = src/top.v src/fsm_onehot.v src/clk_div.v src/seg7_dec.v
TB  = tb/tb_top.v

sim:
	verilator --cc --exe --build -Wall $(SRC) $(TB) sim_main.cpp -o sim
	./sim

clean:
	rm -rf obj_dir sim *.vcd
