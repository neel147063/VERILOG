`timescale 1ns / 1ps
module LIFO_RAM(input wr_en,re_en,reset,clk,[3:0]datain,output reg full,empty,reg [3:0] dataout);
    reg [3:0]head,tail,count;
    parameter size=8;
    reg[3:0] mem[0:size-1];
    always @(posedge clk or posedge reset)
    if(reset)begin
        full=0;
        empty=1;
        head=0;
        tail=0;
        count=0;
    end
    else begin
        if(wr_en && !full)begin
            mem[head]=datain;
            head=(head+1)%size;
            tail=(tail+1)%size;
            count=count+1;
        end
        else if(re_en && !empty) begin
            tail=(tail-1)%size;
            dataout=mem[tail];
            count=count-1;
        end
        full=(count==size);
        empty=(count==0);
    end

endmodule
