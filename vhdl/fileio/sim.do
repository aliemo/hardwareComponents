#add required waveforms
add wave -position end  sim:/fileio/i_a
add wave -position end  sim:/fileio/i_b
add wave -position 0    sim:/fileio/i_c
add wave -position end  sim:/fileio/clk
add wave -position end  sim:/fileio/endoffile

#vcd waveform
vcd file fileio.vcd
vcd add *

#run simulation
run 2000ps

#stop simulation
quit -sim
