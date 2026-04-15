module Top_Design (

// input & output ports



);



// internal connections 



REG_FILE U_regfile (
.rst(),
.clk(),
.data(),
.wr(),
.rd(),
.reg0(),    // connected to encoder
.reg1(),    // connected to encoder
.reg2()     // connected to serializer
);


ENCODER U_encoder (
.rst(),
.clk(),
.data(),
.reg0(),                // connected to register file
.reg1(),                // connected to register file
.encoded_out()          // connected to serializer
); 

SERIALIZER U_serializer (
.clk(),
.rst(),
.reg2(),                 // connected to register file
.ser_in(),               // connected to encoder
.ser_out()
); 


endmodule

