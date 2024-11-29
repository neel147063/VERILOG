`timescale 1ns / 1ps
module FIFO_RAM(input clk,reset,read,write,[3:0]datain,
                output reg full,empty,reg [3:0]dataout);
    parameter size=8;
    reg[3:0] mem[0:size-1];
    reg [3:0]head,tail,count;
    always @(posedge clk or posedge reset)begin
        if(reset)begin
            head=0;
            tail=0;
            full=0;
            count=0;
            empty=1;
        end
        else begin
            if(write==1 && !full)begin
                    mem[head]=datain;
                    head=(head+1)%size;
                    count=count+1;              
                end
            if(read==1 && !empty)begin
                    dataout=mem[tail];
                    tail=tail+1;
                    count=count-1;
                end
         end 
         full=(count==size);
         empty=(count==0);                
     end
endmodule
