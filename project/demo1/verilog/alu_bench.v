module alu_bench;
    reg [4:0] OpCode;
    reg [1:0] funct;
    reg [15:0] Rs;
    reg [15:0] Rt;
    reg [15:0] Pc;
    reg [7:0] Imm;
    reg [15:0] Out;
    
    reg [15:0]sImm5;
    reg [15:0]zImm5;
    reg [15:0]Imm8; 
    
    wire [15:0] res;
    
    reg newVal;
    reg i;
    reg [16:0] extraAdd;
    
    alu DUT(.OpCode(OpCode), .funct(funct), .Rs(Rs), .Rt(Rt), .Pc(Pc), .Imm(Imm), .res(res));
    
    initial begin  
    
        //newVal = 0;
        //#10;
        //newVal = 1;
        //OpCode = 5'b;
        //funct = $random;
        //Out = ;
        //#10;
        //if(res != Out) 
        //    $display ("ERRORCHECK OpCode : %b  funct : %b  Rs: %d  Rt : %d  Pc : %x  Imm : %d  Expected : %d  Got : %d", OpCode, funct, Rs, Rt, Pc, Imm, Out, res);
        
        newVal = 0;
        #10;
        newVal = 1;
        OpCode = 5'b01000; //subi
        funct = $random;
        Out = sImm5 - Rs;
        #10;
        if(res != Out) 
            $display ("ERRORCHECK OpCode : %b  funct : %b  Rs: %d  Rt : %d  Pc : %x  Imm : %d  Expected : %d  Got : %d", OpCode, funct, Rs, Rt, Pc, Imm, Out, res);

        newVal = 0;
        #10;
        newVal = 1;
        OpCode = 5'b01001; //addi
        funct = $random;
        Out = sImm5 + Rs;
        #10;
        if(res != Out) 
            $display ("ERRORCHECK OpCode : %b  funct : %b  Rs: %d  Rt : %d  Pc : %x  Imm : %d  Expected : %d  Got : %d", OpCode, funct, Rs, Rt, Pc, Imm, Out, res);

        newVal = 0;
        #10;
        newVal = 1;
        OpCode = 5'b01010; //andni
        funct = $random;
        Out = Rs & ~zImm5 ;
        #10;
        if(res != Out) 
            $display ("ERRORCHECK OpCode : %b  funct : %b  Rs: %d  Rt : %d  Pc : %x  Imm : %d  Expected : %d  Got : %d", OpCode, funct, Rs, Rt, Pc, Imm, Out, res);
          
        newVal = 0;
        #10;
        newVal = 1;
        OpCode = 5'b01011; //xori
        funct = $random;
        Out = Rs ^ zImm5;
        #10;
        if(res != Out) 
            $display ("ERRORCHECK OpCode : %b  funct : %b  Rs: %d  Rt : %d  Pc : %x  Imm : %d  Expected : %d  Got : %d", OpCode, funct, Rs, Rt, Pc, Imm, Out, res);
        
        newVal = 0;
        #10;
        newVal = 1;
        OpCode = 5'b10100; //roli
        funct = $random;
        Out = (Rs << Imm[3:0]) | (Rs >> (16 - Imm[3:0]));
        #10;
        if(res != Out) 
            $display ("ERRORCHECK OpCode : %b  funct : %b  Rs: %d  Rt : %d  Pc : %x  Imm : %d  Expected : %d  Got : %d", OpCode, funct, Rs, Rt, Pc, Imm, Out, res);
        
        newVal = 0;
        #10;
        newVal = 1;
        OpCode = 5'b10101; //slli
        funct = $random;
        Out = Rs << Imm[3:0];
        #10;
        if(res != Out) 
            $display ("ERRORCHECK OpCode : %b  funct : %b  Rs: %d  Rt : %d  Pc : %x  Imm : %d  Expected : %d  Got : %d", OpCode, funct, Rs, Rt, Pc, Imm, Out, res);
        
        newVal = 0;
        #10;
        newVal = 1;
        OpCode = 5'b10110; //rori
        funct = $random;
        Out = {Rs, Rs} >> Imm[3:0];
        #10;
        if(res != Out) 
            $display ("ERRORCHECK OpCode : %b  funct : %b  Rs: %d  Rt : %d  Pc : %x  Imm : %d  Expected : %d  Got : %d", OpCode, funct, Rs, Rt, Pc, Imm, Out, res);
        
        newVal = 0;
        #10;
        newVal = 1;
        OpCode = 5'b10111; //srli
        funct = $random;
        Out = Rs >> Imm[3:0];
        #10;
        if(res != Out) 
            $display ("ERRORCHECK OpCode : %b  funct : %b  Rs: %d  Rt : %d  Pc : %x  Imm : %d  Expected : %d  Got : %d", OpCode, funct, Rs, Rt, Pc, Imm, Out, res);
        
        newVal = 0;
        #10;
        newVal = 1;
        OpCode = 5'b10000; //st
        funct = $random;
        Out = Rs + sImm5;
        #10;
        if(res != Out) 
            $display ("ERRORCHECK OpCode : %b  funct : %b  Rs: %d  Rt : %d  Pc : %x  Imm : %d  Expected : %d  Got : %d", OpCode, funct, Rs, Rt, Pc, Imm, Out, res);
        
        newVal = 0;
        #10;
        newVal = 1;
        OpCode = 5'b10001; //ld
        funct = $random;
        Out = Rs + sImm5;
        #10;
        if(res != Out) 
            $display ("ERRORCHECK OpCode : %b  funct : %b  Rs: %d  Rt : %d  Pc : %x  Imm : %d  Expected : %d  Got : %d", OpCode, funct, Rs, Rt, Pc, Imm, Out, res);
        
        newVal = 0;
        #10;
        newVal = 1; 
        OpCode = 5'b10011; //stu
        funct = $random;
        Out = Rs + sImm5;
        #10;
        if(res != Out) 
            $display ("ERRORCHECK OpCode : %b  funct : %b  Rs: %d  Rt : %d  Pc : %x  Imm : %d  Expected : %d  Got : %d", OpCode, funct, Rs, Rt, Pc, Imm, Out, res);
        
        newVal = 0;
        #10;
        newVal = 1;
        OpCode = 5'b11001; //btr
        funct = $random;
        Out = {Rs[0],Rs[1],Rs[2],Rs[3],Rs[4],Rs[5],Rs[6],Rs[7],Rs[8],Rs[9],Rs[10],Rs[11],Rs[12],Rs[13],Rs[14],Rs[15]};
        #10;
        if(res != Out) 
            $display ("ERRORCHECK OpCode : %b  funct : %b  Rs: %d  Rt : %d  Pc : %x  Imm : %d  Expected : %d  Got : %d", OpCode, funct, Rs, Rt, Pc, Imm, Out, res);
        
        newVal = 0;
        #10;
        newVal = 1;
        OpCode = 5'b11011; //add
        funct = 2'b00;
        Out = Rs + Rt;
        #10;
        if(res != Out) 
            $display ("ERRORCHECK OpCode : %b  funct : %b  Rs: %d  Rt : %d  Pc : %x  Imm : %d  Expected : %d  Got : %d", OpCode, funct, Rs, Rt, Pc, Imm, Out, res);
        
        newVal = 0;
        #10;
        newVal = 1;
        OpCode = 5'b11011; //sub
        funct = 2'b01;
        Out = Rs + Rt;
        #10;
        if(res != Out) 
            $display ("ERRORCHECK OpCode : %b  funct : %b  Rs: %d  Rt : %d  Pc : %x  Imm : %d  Expected : %d  Got : %d", OpCode, funct, Rs, Rt, Pc, Imm, Out, res);
        
        newVal = 0;
        #10;
        newVal = 1;
        OpCode = 5'b11011; //xor
        funct = 2'b10;
        Out = Rs ^ Rt;
        #10;
        if(res != Out) 
            $display ("ERRORCHECK OpCode : %b  funct : %b  Rs: %d  Rt : %d  Pc : %x  Imm : %d  Expected : %d  Got : %d", OpCode, funct, Rs, Rt, Pc, Imm, Out, res);
        
        newVal = 0;
        #10;
        newVal = 1;
        OpCode = 5'b11011; //andn
        funct = 2'b11;
        Out = Rs & ~Rt;
        #10;
        if(res != Out) 
            $display ("ERRORCHECK OpCode : %b  funct : %b  Rs: %d  Rt : %d  Pc : %x  Imm : %d  Expected : %d  Got : %d", OpCode, funct, Rs, Rt, Pc, Imm, Out, res);
        
        newVal = 0;
        #10;
        newVal = 1;
        OpCode = 5'b11010; //rol
        funct = 2'b00;
        Out = (Rs << (Rt[3:0])) | (Rs >> (16 - Rt[3:0]));
        #10;
        if(res != Out) 
            $display ("ERRORCHECK OpCode : %b  funct : %b  Rs: %d  Rt : %d  Pc : %x  Imm : %d  Expected : %d  Got : %d", OpCode, funct, Rs, Rt, Pc, Imm, Out, res);
        
        newVal = 0;
        #10;
        newVal = 1;
        OpCode = 5'b11010; //sll
        funct = 2'b01;
        Out = Rs << Rt[3:0];
        #10;
        if(res != Out) 
            $display ("ERRORCHECK OpCode : %b  funct : %b  Rs: %d  Rt : %d  Pc : %x  Imm : %d  Expected : %d  Got : %d", OpCode, funct, Rs, Rt, Pc, Imm, Out, res);
        
        newVal = 0;
        #10;
        newVal = 1;
        OpCode = 5'b11010; //ror
        funct = 2'b10;
        Out = {Rs,Rs} >> Rt[3:0];
        #10;
        if(res != Out) 
            $display ("ERRORCHECK OpCode : %b  funct : %b  Rs: %d  Rt : %d  Pc : %x  Imm : %d  Expected : %d  Got : %d", OpCode, funct, Rs, Rt, Pc, Imm, Out, res);
        
        newVal = 0;
        #10;
        newVal = 1;
        OpCode = 5'b11010; //srl
        funct = 2'b11;
        Out = Rs >> Rt[3:0];
        #10;
        if(res != Out) 
            $display ("ERRORCHECK OpCode : %b  funct : %b  Rs: %d  Rt : %d  Pc : %x  Imm : %d  Expected : %d  Got : %d", OpCode, funct, Rs, Rt, Pc, Imm, Out, res);
        
        newVal = 0;
        #10;
        newVal = 1;
        OpCode = 5'b11100; //SEQ
        funct = $random;
        Out = (Rs == Rt) ? 16'd1 : 16'd0;
        #10;
        if(res != Out) 
            $display ("ERRORCHECK OpCode : %b  funct : %b  Rs: %d  Rt : %d  Pc : %x  Imm : %d  Expected : %d  Got : %d", OpCode, funct, Rs, Rt, Pc, Imm, Out, res);
        
        newVal = 0;
        #10;
        newVal = 1; 
        OpCode = 5'b11101; //SLT
        funct = $random;
        Out = (Rs < Rt) ? 16'd1 : 16'd0;
        #10;
        if(res != Out) 
            $display ("ERRORCHECK OpCode : %b  funct : %b  Rs: %d  Rt : %d  Pc : %x  Imm : %d  Expected : %d  Got : %d", OpCode, funct, Rs, Rt, Pc, Imm, Out, res);
        
        newVal = 0;
        #10;
        newVal = 1; //SLE
        OpCode = 5'b11110;
        funct = $random;
        Out = (Rs <= Rt) ? 16'd1 : 16'd0;
        #10;
        if(res != Out) 
            $display ("ERRORCHECK OpCode : %b  funct : %b  Rs: %d  Rt : %d  Pc : %x  Imm : %d  Expected : %d  Got : %d", OpCode, funct, Rs, Rt, Pc, Imm, Out, res);
        
        newVal = 0;
        #10;
        newVal = 1;
        OpCode = 5'b11111; //SCO
        funct = $random;
        extraAdd = Rs + Rt;
        Out = {{15{1'b0}}, extraAdd[1]};
        #10;
        if(res != Out) 
            $display ("ERRORCHECK OpCode : %b  funct : %b  Rs: %d  Rt : %d  Pc : %x  Imm : %d  Expected : %d  Got : %d", OpCode, funct, Rs, Rt, Pc, Imm, Out, res);
        
        newVal = 0;
        #10;
        newVal = 1;
        OpCode = 5'b01100; //bnez
        funct = $random;
        Out = (Rs != 0) ? 16'd1 : 16'd0;
        #10;
        if(res != Out) 
            $display ("ERRORCHECK OpCode : %b  funct : %b  Rs: %d  Rt : %d  Pc : %x  Imm : %d  Expected : %d  Got : %d", OpCode, funct, Rs, Rt, Pc, Imm, Out, res);
        
        newVal = 0;
        #10;
        newVal = 1;
        OpCode = 5'b01101;
        funct = $random; //beqz
        Out = (Rs == 0) ? 16'd1 : 16'd0;
        #10;
        if(res != Out) 
            $display ("ERRORCHECK OpCode : %b  funct : %b  Rs: %d  Rt : %d  Pc : %x  Imm : %d  Expected : %d  Got : %d", OpCode, funct, Rs, Rt, Pc, Imm, Out, res);
        
        newVal = 0;
        #10;
        newVal = 1;
        OpCode = 5'b01110;
        funct = $random; //bltz
        Out = (Rs < 0) ? 16'd1 : 16'd0;
        #10;
        if(res != Out) 
            $display ("ERRORCHECK OpCode : %b  funct : %b  Rs: %d  Rt : %d  Pc : %x  Imm : %d  Expected : %d  Got : %d", OpCode, funct, Rs, Rt, Pc, Imm, Out, res);
        
        newVal = 0;
        #10;
        newVal = 1;
        OpCode = 5'b01111; //bgez
        funct = $random;
        Out = (Rs >= 0) ? 16'd1 : 16'd0;
        #10;
        if(res != Out) 
            $display ("ERRORCHECK OpCode : %b  funct : %b  Rs: %d  Rt : %d  Pc : %x  Imm : %d  Expected : %d  Got : %d", OpCode, funct, Rs, Rt, Pc, Imm, Out, res);
        
        newVal = 0;
        #10;
        newVal = 1;
        OpCode = 5'b11000; //lbi
        funct = $random;
        Out = Imm8;
        #10;
        if(res != Out) 
            $display ("ERRORCHECK OpCode : %b  funct : %b  Rs: %d  Rt : %d  Pc : %x  Imm : %d  Expected : %d  Got : %d", OpCode, funct, Rs, Rt, Pc, Imm, Out, res);
        
        newVal = 0;
        #10;
        newVal = 1;
        OpCode = 5'b10010; //slbi
        funct = $random;
        Out = {Rs,Imm};
        #10;
        if(res != Out) 
            $display ("ERRORCHECK OpCode : %b  funct : %b  Rs: %d  Rt : %d  Pc : %x  Imm : %d  Expected : %d  Got : %d", OpCode, funct, Rs, Rt, Pc, Imm, Out, res);
        
        newVal = 0;
        #10;
        newVal = 1;
        OpCode = 5'b00110;
        funct = $random;
        Out = Pc;
        #10;
        if(res != Out) 
            $display ("ERRORCHECK OpCode : %b  funct : %b  Rs: %d  Rt : %d  Pc : %x  Imm : %d  Expected : %d  Got : %d", OpCode, funct, Rs, Rt, Pc, Imm, Out, res);
        
        newVal = 0;
        #10;
        newVal = 1;
        OpCode = 5'b00111;
        funct = $random;
        Out = Pc;
        #10;
        if(res != Out) 
            $display ("ERRORCHECK OpCode : %b  funct : %b  Rs: %d  Rt : %d  Pc : %x  Imm : %d  Expected : %d  Got : %d", OpCode, funct, Rs, Rt, Pc, Imm, Out, res);
        
        #10;
        $stop;
   end
    
    always@(posedge newVal) begin
        Rs = $random;
        Rt = $random;
        Pc = $random;
        Imm = $random;
        sImm5 = {{11{Imm[4]}},Imm[4:0]};
        zImm5 = {{11{1'b0}}, Imm[4:0]};
        Imm8 = {{8{Imm[7]}},Imm};
    end
        
    
endmodule