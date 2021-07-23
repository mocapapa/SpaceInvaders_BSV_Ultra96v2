module mixer(
	     input signed [7:0]   ch0, ch1, ch2, ch3,
	     input 		  son0, son1, son2, son3,
	     output signed [15:0] mout,
	     output  	  soundon
	     );

   wire signed [15:0] 		  tmp1;
   reg signed [15:0] 		  tmp2;
   
   function [15:0] signext (
			    input [7:0] in
			    );
      begin
         signext = {{9{in[7]^1'b1}},in[6:0]};
      end
   endfunction

   assign soundon = son0 | son1 | son2 | son3;
   assign tmp1 = signext(ch0) + signext(ch1) + signext(ch2) + signext(ch3);
   
   // 9bit clipping

   always @* begin
      if (tmp1 >= 256) tmp2 = 255;
      else if (tmp1 <= -257) tmp2 = -256;
      else tmp2 = tmp1;
   end

   assign mout = tmp2 << 6;

endmodule
