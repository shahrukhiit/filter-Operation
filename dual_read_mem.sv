module dual_read_mem (
    input               clk,           // Clock signal
	input               resetn_i,
    input               we,            // Write enable signal
    input      [14:0]    write_addr,    // Write address (8 bits to address 256 cells)
    input      [31:0]   write_data,    // Data to be written (32 bits)
    input      [14:0]    read_addr_a,   // Read address for port A
    input      [14:0]    read_addr_b,   // Read address for port B
    output reg [31:0]   read_data_a,   // Data read from port A (32 bits)
    output reg [31:0]   read_data_b    // Data read from port B (32 bits)
);

    // 256x32-bit memory array
    reg [31:0] memory_array [255:0];
	integer i;

    // Write operation
    always @(posedge clk) begin
	    if (~resetn_i)begin
	memory_array[0] <=0 ;
	memory_array[1] <=1 ;
	memory_array[2] <=2 ;
	memory_array[3] <=3 ;
	memory_array[4] <=4 ;
	memory_array[5] <=5 ;
	memory_array[6] <=6 ;
	memory_array[7] <=7 ;
	memory_array[8] <=8 ;
	memory_array[9] <=9 ;
	memory_array[10] <=10 ;
	memory_array[11] <=11 ;
	memory_array[12] <=12 ;
	memory_array[13] <=13 ;
	memory_array[14] <=14 ;
	memory_array[15] <=15 ;
	memory_array[16] <=16 ;
	memory_array[17] <=17 ;
	memory_array[18] <=18 ;
	memory_array[19] <=19 ;
	memory_array[20] <=20 ;
	memory_array[21] <=21 ;
	memory_array[22] <=22 ;
	memory_array[23] <=23 ;
	memory_array[24] <=24 ;
	memory_array[25] <=25 ;
	memory_array[26] <=26 ;
	memory_array[27] <=27 ;
	memory_array[28] <=28 ;
	memory_array[29] <=29 ;
	memory_array[30] <=30 ;
	memory_array[31] <=31 ;
	memory_array[32] <=32 ;
	memory_array[33] <=33 ;
	memory_array[34] <=34 ;
	memory_array[35] <=35 ;
	memory_array[36] <=36 ;
	memory_array[37] <=37 ;
	memory_array[38] <=38 ;
	memory_array[39] <=39 ;
	memory_array[40] <=40 ;
	memory_array[41] <=41 ;
	memory_array[42] <=42 ;
	memory_array[43] <=43 ;
	memory_array[44] <=44 ;
	memory_array[45] <=45 ;
	memory_array[46] <=46 ;
	memory_array[47] <=47 ;
	memory_array[48] <=48 ;
	memory_array[49] <=49 ;
	memory_array[50] <=50 ;
	memory_array[51] <=51 ;
	memory_array[52] <=52 ;
	memory_array[53] <=53 ;
	memory_array[54] <=54 ;
	memory_array[55] <=55 ;
	memory_array[56] <=56 ;
	memory_array[57] <=57 ;
	memory_array[58] <=58 ;
	memory_array[59] <=59 ;
	memory_array[60] <=60 ;
	memory_array[61] <=61 ;
	memory_array[62] <=62 ;
	memory_array[63] <=63 ;
	memory_array[64] <=64 ;
	memory_array[65] <=65 ;
	memory_array[66] <=66 ;
	memory_array[67] <=67 ;
	memory_array[68] <=68 ;
	memory_array[69] <=69 ;
	memory_array[70] <=70 ;
	memory_array[71] <=71 ;
	memory_array[72] <=72 ;
	memory_array[73] <=73 ;
	memory_array[74] <=74 ;
	memory_array[75] <=75 ;
	memory_array[76] <=76 ;
	memory_array[77] <=77 ;
	memory_array[78] <=78 ;
	memory_array[79] <=79 ;
	memory_array[80] <=80 ;
	memory_array[81] <=81 ;
	memory_array[82] <=82 ;
	memory_array[83] <=83 ;
	memory_array[84] <=84 ;
	memory_array[85] <=85 ;
	memory_array[86] <=86 ;
	memory_array[87] <=87 ;
	memory_array[88] <=88 ;
	memory_array[89] <=89 ;
	memory_array[90] <=90 ;
	memory_array[91] <=91 ;
	memory_array[92] <=92 ;
	memory_array[93] <=93 ;
	memory_array[94] <=94 ;
	memory_array[95] <=95 ;
	memory_array[96] <=96 ;
	memory_array[97] <=97 ;
	memory_array[98] <=98 ;
	memory_array[99] <=99 ;
	memory_array[100] <=100 ;
	memory_array[101] <=101 ;
	memory_array[102] <=102 ;
	memory_array[103] <=103 ;
	memory_array[104] <=104 ;
	memory_array[105] <=105 ;
	memory_array[106] <=106 ;
	memory_array[107] <=107 ;
	memory_array[108] <=108 ;
	memory_array[109] <=109 ;
	memory_array[110] <=110 ;
	memory_array[111] <=111 ;
	memory_array[112] <=112 ;
	memory_array[113] <=113 ;
	memory_array[114] <=114 ;
	memory_array[115] <=115 ;
	memory_array[116] <=116 ;
	memory_array[117] <=117 ;
	memory_array[118] <=118 ;
	memory_array[119] <=119 ;
	memory_array[120] <=120 ;
	memory_array[121] <=121 ;
	memory_array[122] <=122 ;
	memory_array[123] <=123 ;
	memory_array[124] <=124 ;
	memory_array[125] <=125 ;
	memory_array[126] <=126 ;
	memory_array[127] <=127 ;
	memory_array[128] <= 128;
    memory_array[129] <= 129;
    memory_array[130] <= 130;
    memory_array[131] <= 131;
    memory_array[132] <= 132;
    memory_array[133] <= 133;
    memory_array[134] <= 134;
    memory_array[135] <= 135;
    memory_array[136] <= 136;
    memory_array[137] <= 137;
    memory_array[138] <= 138;
    memory_array[139] <= 139;
    memory_array[140] <= 140;
    memory_array[141] <= 141;
    memory_array[142] <= 142;
    memory_array[143] <= 143;
    memory_array[144] <= 144;
    memory_array[145] <= 145;
    memory_array[146] <= 146;
    memory_array[147] <= 147;
    memory_array[148] <= 148;
    memory_array[149] <= 149;
    memory_array[150] <= 150;
    memory_array[151] <= 151;
    memory_array[152] <= 152;
    memory_array[153] <= 153;
    memory_array[154] <= 154;
    memory_array[155] <= 155;
    memory_array[156] <= 156;
    memory_array[157] <= 157;
    memory_array[158] <= 158;
    memory_array[159] <= 159;
    memory_array[160] <= 160;
    memory_array[161] <= 161;
    memory_array[162] <= 162;
    memory_array[163] <= 163;
    memory_array[164] <= 164;
    memory_array[165] <= 165;
    memory_array[166] <= 166;
    memory_array[167] <= 167;
    memory_array[168] <= 168;
    memory_array[169] <= 169;
    memory_array[170] <= 170;
    memory_array[171] <= 171;
    memory_array[172] <= 172;
    memory_array[173] <= 173;
    memory_array[174] <= 174;
    memory_array[175] <= 175;
    memory_array[176] <= 176;
    memory_array[177] <= 177;
    memory_array[178] <= 178;
    memory_array[179] <= 179;
    memory_array[180] <= 180;
    memory_array[181] <= 181;
    memory_array[182] <= 182;
    memory_array[183] <= 183;
    memory_array[184] <= 184;
    memory_array[185] <= 185;
    memory_array[186] <= 186;
    memory_array[187] <= 187;
    memory_array[188] <= 188;
    memory_array[189] <= 189;
    memory_array[190] <= 190;
    memory_array[191] <= 191;
    memory_array[192] <= 192;
    memory_array[193] <= 193;
    memory_array[194] <= 194;
    memory_array[195] <= 195;
    memory_array[196] <= 196;
    memory_array[197] <= 197;
    memory_array[198] <= 198;
    memory_array[199] <= 199;
    memory_array[200] <= 200;
    memory_array[201] <= 201;
    memory_array[202] <= 202;
    memory_array[203] <= 203;
    memory_array[204] <= 204;
    memory_array[205] <= 205;
    memory_array[206] <= 206;
    memory_array[207] <= 207;
    memory_array[208] <= 208;
    memory_array[209] <= 209;
    memory_array[210] <= 210;
    memory_array[211] <= 211;
    memory_array[212] <= 212;
    memory_array[213] <= 213;
    memory_array[214] <= 214;
    memory_array[215] <= 215;
    memory_array[216] <= 216;
    memory_array[217] <= 217;
    memory_array[218] <= 218;
    memory_array[219] <= 219;
    memory_array[220] <= 220;
    memory_array[221] <= 221;
    memory_array[222] <= 222;
    memory_array[223] <= 223;
    memory_array[224] <= 224;
    memory_array[225] <= 225;
    memory_array[226] <= 226;
    memory_array[227] <= 227;
    memory_array[228] <= 228;
    memory_array[229] <= 229;
    memory_array[230] <= 230;
    memory_array[231] <= 231;
    memory_array[232] <= 232;
    memory_array[233] <= 233;
    memory_array[234] <= 234;
    memory_array[235] <= 235;
    memory_array[236] <= 236;
    memory_array[237] <= 237;
    memory_array[238] <= 238;
    memory_array[239] <= 239;
    memory_array[240] <= 240;
    memory_array[241] <= 241;
    memory_array[242] <= 242;
    memory_array[243] <= 243;
    memory_array[244] <= 244;
    memory_array[245] <= 245;
    memory_array[246] <= 246;
    memory_array[247] <= 247;
    memory_array[248] <= 248;
    memory_array[249] <= 249;
    memory_array[250] <= 250;
    memory_array[251] <= 251;
    memory_array[252] <= 252;
    memory_array[253] <= 253;
    memory_array[254] <= 254;
    memory_array[255] <= 255;
		end
        else if (we) begin
            memory_array[write_addr[7:0]] <= write_data;
        end
    end

    // Read operation for port A
    always @(posedge clk) begin
        read_data_a <= memory_array[read_addr_a[7:0]];
    end

    // Read operation for port B
    always @(posedge clk) begin
        read_data_b <= memory_array[read_addr_b[7:0]];
    end

endmodule
