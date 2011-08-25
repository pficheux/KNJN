////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: K.39
//  \   \         Application: netgen
//  /   /         Filename: TENBASET_synthesis.v
// /___/   /\     Timestamp: Wed Aug 17 10:56:52 2011
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim TENBASET.ngc TENBASET_synthesis.v 
// Device	: xc2s100-6-tq144
// Input file	: TENBASET.ngc
// Output file	: /home/pierre/developpement/Perso/KNJN/PF/ISE_Test/myeth/netgen/synthesis/TENBASET_synthesis.v
// # of Modules	: 1
// Design Name	: TENBASET
// Xilinx        : /opt/Xilinx/10.1/ISE
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Development System Reference Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module TENBASET (
  Ethernet_RDp, USB_FRDn, Ethernet_TDm, Ethernet_TDp, CLK40, CLK_USB, USB_D, LED
);
  input Ethernet_RDp;
  input USB_FRDn;
  output Ethernet_TDm;
  output Ethernet_TDp;
  input CLK40;
  input CLK_USB;
  inout [7 : 0] USB_D;
  output [2 : 0] LED;
  wire CLK40_BUFGP_1;
  wire CLK_USB_BUFGP_3;
  wire CRCflush_68;
  wire CRCflush_mux0000_69;
  wire CRCflush_not0001;
  wire CRCinit_71;
  wire CRCinit_cmp_eq0000_72;
  wire CRCinput;
  wire Ethernet_RDp_IBUF_75;
  wire Ethernet_TDm_OBUF_77;
  wire Ethernet_TDm_not0001;
  wire Ethernet_TDp_OBUF_80;
  wire IPchecksum1;
  wire LED_0_85;
  wire LED_1_86;
  wire LED_2_87;
  wire LinkPulse_88;
  wire LinkPulse_and0000;
  wire LinkPulse_and000021_107;
  wire LinkPulse_and000026_108;
  wire LinkPulse_and00004_109;
  wire LinkPulse_and00009_110;
  wire Maccum_RxTransitionCount_111;
  wire \Mcount_LinkPulseCount_cy<10>_rt_114 ;
  wire \Mcount_LinkPulseCount_cy<11>_rt_116 ;
  wire \Mcount_LinkPulseCount_cy<12>_rt_118 ;
  wire \Mcount_LinkPulseCount_cy<13>_rt_120 ;
  wire \Mcount_LinkPulseCount_cy<14>_rt_122 ;
  wire \Mcount_LinkPulseCount_cy<15>_rt_124 ;
  wire \Mcount_LinkPulseCount_cy<1>_rt_126 ;
  wire \Mcount_LinkPulseCount_cy<2>_rt_128 ;
  wire \Mcount_LinkPulseCount_cy<3>_rt_130 ;
  wire \Mcount_LinkPulseCount_cy<4>_rt_132 ;
  wire \Mcount_LinkPulseCount_cy<5>_rt_134 ;
  wire \Mcount_LinkPulseCount_cy<6>_rt_136 ;
  wire \Mcount_LinkPulseCount_cy<7>_rt_138 ;
  wire \Mcount_LinkPulseCount_cy<8>_rt_140 ;
  wire \Mcount_LinkPulseCount_cy<9>_rt_142 ;
  wire \Mcount_LinkPulseCount_xor<16>_rt_144 ;
  wire \Mcount_RxBitCount_cy<10>_rt_147 ;
  wire \Mcount_RxBitCount_cy<11>_rt_149 ;
  wire \Mcount_RxBitCount_cy<12>_rt_151 ;
  wire \Mcount_RxBitCount_cy<1>_rt_153 ;
  wire \Mcount_RxBitCount_cy<2>_rt_155 ;
  wire \Mcount_RxBitCount_cy<3>_rt_157 ;
  wire \Mcount_RxBitCount_cy<4>_rt_159 ;
  wire \Mcount_RxBitCount_cy<5>_rt_161 ;
  wire \Mcount_RxBitCount_cy<6>_rt_163 ;
  wire \Mcount_RxBitCount_cy<7>_rt_165 ;
  wire \Mcount_RxBitCount_cy<8>_rt_167 ;
  wire \Mcount_RxBitCount_cy<9>_rt_169 ;
  wire \Mcount_RxBitCount_xor<13>_rt_171 ;
  wire \Mcount_RxPacketCount_cy<10>_rt_174 ;
  wire \Mcount_RxPacketCount_cy<11>_rt_176 ;
  wire \Mcount_RxPacketCount_cy<12>_rt_178 ;
  wire \Mcount_RxPacketCount_cy<13>_rt_180 ;
  wire \Mcount_RxPacketCount_cy<14>_rt_182 ;
  wire \Mcount_RxPacketCount_cy<15>_rt_184 ;
  wire \Mcount_RxPacketCount_cy<16>_rt_186 ;
  wire \Mcount_RxPacketCount_cy<17>_rt_188 ;
  wire \Mcount_RxPacketCount_cy<18>_rt_190 ;
  wire \Mcount_RxPacketCount_cy<19>_rt_192 ;
  wire \Mcount_RxPacketCount_cy<1>_rt_194 ;
  wire \Mcount_RxPacketCount_cy<20>_rt_196 ;
  wire \Mcount_RxPacketCount_cy<21>_rt_198 ;
  wire \Mcount_RxPacketCount_cy<22>_rt_200 ;
  wire \Mcount_RxPacketCount_cy<23>_rt_202 ;
  wire \Mcount_RxPacketCount_cy<24>_rt_204 ;
  wire \Mcount_RxPacketCount_cy<25>_rt_206 ;
  wire \Mcount_RxPacketCount_cy<26>_rt_208 ;
  wire \Mcount_RxPacketCount_cy<27>_rt_210 ;
  wire \Mcount_RxPacketCount_cy<28>_rt_212 ;
  wire \Mcount_RxPacketCount_cy<29>_rt_214 ;
  wire \Mcount_RxPacketCount_cy<2>_rt_216 ;
  wire \Mcount_RxPacketCount_cy<30>_rt_218 ;
  wire \Mcount_RxPacketCount_cy<3>_rt_220 ;
  wire \Mcount_RxPacketCount_cy<4>_rt_222 ;
  wire \Mcount_RxPacketCount_cy<5>_rt_224 ;
  wire \Mcount_RxPacketCount_cy<6>_rt_226 ;
  wire \Mcount_RxPacketCount_cy<7>_rt_228 ;
  wire \Mcount_RxPacketCount_cy<8>_rt_230 ;
  wire \Mcount_RxPacketCount_cy<9>_rt_232 ;
  wire \Mcount_RxPacketCount_xor<31>_rt_234 ;
  wire \Mcount_RxPreambleBitsCount_xor<4>11 ;
  wire \Mcount_RxPreambleBitsCount_xor<4>111_236 ;
  wire Mcount_TxAddress;
  wire Mcount_TxAddress1;
  wire Mcount_TxAddress10;
  wire Mcount_TxAddress2;
  wire Mcount_TxAddress3;
  wire Mcount_TxAddress4;
  wire Mcount_TxAddress5;
  wire Mcount_TxAddress6;
  wire Mcount_TxAddress7;
  wire Mcount_TxAddress8;
  wire Mcount_TxAddress9;
  wire \Mcount_counter_cy<10>_rt_271 ;
  wire \Mcount_counter_cy<11>_rt_273 ;
  wire \Mcount_counter_cy<12>_rt_275 ;
  wire \Mcount_counter_cy<13>_rt_277 ;
  wire \Mcount_counter_cy<14>_rt_279 ;
  wire \Mcount_counter_cy<15>_rt_281 ;
  wire \Mcount_counter_cy<16>_rt_283 ;
  wire \Mcount_counter_cy<17>_rt_285 ;
  wire \Mcount_counter_cy<18>_rt_287 ;
  wire \Mcount_counter_cy<19>_rt_289 ;
  wire \Mcount_counter_cy<1>_rt_291 ;
  wire \Mcount_counter_cy<20>_rt_293 ;
  wire \Mcount_counter_cy<21>_rt_295 ;
  wire \Mcount_counter_cy<22>_rt_297 ;
  wire \Mcount_counter_cy<2>_rt_299 ;
  wire \Mcount_counter_cy<3>_rt_301 ;
  wire \Mcount_counter_cy<4>_rt_303 ;
  wire \Mcount_counter_cy<5>_rt_305 ;
  wire \Mcount_counter_cy<6>_rt_307 ;
  wire \Mcount_counter_cy<7>_rt_309 ;
  wire \Mcount_counter_cy<8>_rt_311 ;
  wire \Mcount_counter_cy<9>_rt_313 ;
  wire \Mcount_counter_xor<23>_rt_315 ;
  wire Mmux_USB_readmux_3_316;
  wire Mmux_USB_readmux_31_317;
  wire Mmux_USB_readmux_32_318;
  wire Mmux_USB_readmux_33_319;
  wire Mmux_USB_readmux_34_320;
  wire Mmux_USB_readmux_35_321;
  wire Mmux_USB_readmux_36_322;
  wire Mmux_USB_readmux_37_323;
  wire Mmux_USB_readmux_4_324;
  wire Mmux_USB_readmux_41_325;
  wire Mmux_USB_readmux_42_326;
  wire Mmux_USB_readmux_43_327;
  wire Mmux_USB_readmux_44_328;
  wire Mmux_USB_readmux_45_329;
  wire Mmux_USB_readmux_46_330;
  wire Mmux_USB_readmux_47_331;
  wire Mshreg_RxInSRn_2_332;
  wire Mshreg_RxInSRp_1_333;
  wire N0;
  wire N1;
  wire N104;
  wire N106;
  wire N11;
  wire N12;
  wire N13;
  wire N130;
  wire N134;
  wire N136;
  wire N138;
  wire N14;
  wire N142;
  wire N144;
  wire N146;
  wire N148;
  wire N15;
  wire N150;
  wire N154;
  wire N158;
  wire N16;
  wire N166;
  wire N168;
  wire N17;
  wire N170;
  wire N172;
  wire N174;
  wire N176;
  wire N178;
  wire N18;
  wire N180;
  wire N181;
  wire N183;
  wire N187;
  wire N189;
  wire N191;
  wire N193;
  wire N195;
  wire N197;
  wire N199;
  wire N201;
  wire N203;
  wire N205;
  wire N207;
  wire N209;
  wire N211;
  wire N213;
  wire N215;
  wire N217;
  wire N219;
  wire N220;
  wire N222;
  wire N224;
  wire N225;
  wire N227;
  wire N229;
  wire N231;
  wire N233;
  wire N235;
  wire N236;
  wire N237;
  wire N238;
  wire N239;
  wire N240;
  wire N241;
  wire N242;
  wire N243;
  wire N244;
  wire N245;
  wire N246;
  wire N247;
  wire N248;
  wire N249;
  wire N250;
  wire N251;
  wire N252;
  wire N253;
  wire N254;
  wire N255;
  wire N256;
  wire N257;
  wire N258;
  wire N38;
  wire N41;
  wire N42;
  wire N46;
  wire N48;
  wire N49;
  wire N50;
  wire N51;
  wire N52;
  wire N54;
  wire N56;
  wire N60;
  wire N61;
  wire N73;
  wire N79;
  wire N8;
  wire N80;
  wire N82;
  wire N9;
  wire N97;
  wire N98;
  wire \Result<0>2 ;
  wire \Result<0>3 ;
  wire \Result<0>4 ;
  wire \Result<0>5 ;
  wire \Result<0>6 ;
  wire \Result<0>7 ;
  wire \Result<0>8 ;
  wire \Result<0>9 ;
  wire \Result<10>1 ;
  wire \Result<10>2 ;
  wire \Result<10>3 ;
  wire \Result<11>1 ;
  wire \Result<11>2 ;
  wire \Result<11>3 ;
  wire \Result<12>1 ;
  wire \Result<12>2 ;
  wire \Result<12>3 ;
  wire \Result<13>1 ;
  wire \Result<13>2 ;
  wire \Result<13>3 ;
  wire \Result<14>1 ;
  wire \Result<14>2 ;
  wire \Result<15>1 ;
  wire \Result<15>2 ;
  wire \Result<16>1 ;
  wire \Result<16>2 ;
  wire \Result<17>1 ;
  wire \Result<18>1 ;
  wire \Result<19>1 ;
  wire \Result<1>1 ;
  wire \Result<1>2 ;
  wire \Result<1>3 ;
  wire \Result<1>4 ;
  wire \Result<1>5 ;
  wire \Result<1>6 ;
  wire \Result<1>7 ;
  wire \Result<1>8 ;
  wire \Result<1>9 ;
  wire \Result<20>1 ;
  wire \Result<21>1 ;
  wire \Result<22>1 ;
  wire \Result<23>1 ;
  wire \Result<2>1 ;
  wire \Result<2>2 ;
  wire \Result<2>3 ;
  wire \Result<2>4 ;
  wire \Result<2>5 ;
  wire \Result<2>6 ;
  wire \Result<2>7 ;
  wire \Result<3>1 ;
  wire \Result<3>2 ;
  wire \Result<3>3 ;
  wire \Result<3>4 ;
  wire \Result<3>5 ;
  wire \Result<4>1 ;
  wire \Result<4>2 ;
  wire \Result<4>3 ;
  wire \Result<4>4 ;
  wire \Result<5>1 ;
  wire \Result<5>2 ;
  wire \Result<5>3 ;
  wire \Result<6>1 ;
  wire \Result<6>2 ;
  wire \Result<6>3 ;
  wire \Result<7>1 ;
  wire \Result<7>2 ;
  wire \Result<7>3 ;
  wire \Result<8>1 ;
  wire \Result<8>2 ;
  wire \Result<8>3 ;
  wire \Result<9>1 ;
  wire \Result<9>2 ;
  wire \Result<9>3 ;
  wire RxCRC_CheckNow_588;
  wire RxCRC_OK_589;
  wire RxCRC_OK_cmp_eq0000;
  wire RxDataPolarity_647;
  wire RxDataPolarity_xor0000;
  wire RxFrame_649;
  wire RxFrame_inv;
  wire RxFrame_mux0000;
  wire RxGoodPacket_652;
  wire RxGoodPacket_and0000;
  wire RxGoodPacket_mux0000;
  wire RxGoodPacket_mux0000104_655;
  wire RxGoodPacket_mux0000121_656;
  wire RxGoodPacket_mux0000130_657;
  wire RxGoodPacket_mux0000148_658;
  wire RxGoodPacket_mux0000181_659;
  wire RxGoodPacket_mux0000198_660;
  wire RxGoodPacket_mux0000212_661;
  wire RxGoodPacket_mux0000220_662;
  wire RxGoodPacket_mux0000236_663;
  wire RxGoodPacket_mux0000270;
  wire RxGoodPacket_mux00002701_665;
  wire RxGoodPacket_mux0000274_666;
  wire RxGoodPacket_mux0000295_667;
  wire RxGoodPacket_mux0000329_668;
  wire RxGoodPacket_mux000033;
  wire RxGoodPacket_mux0000331_670;
  wire RxGoodPacket_mux0000375_671;
  wire RxGoodPacket_mux0000398_672;
  wire RxGoodPacket_mux0000415_673;
  wire RxGoodPacket_mux000051_674;
  wire RxGoodPacket_mux00007_675;
  wire RxGoodPacket_mux000070_676;
  wire RxGoodPacket_mux000088_677;
  wire \RxInSRn[0] ;
  wire \RxInSRn[2] ;
  wire RxInSRp_xor0000;
  wire RxLED_0_and0000;
  wire RxLED_0_and000011;
  wire RxLED_0_and0000119_686;
  wire RxLED_0_and000017_687;
  wire RxLED_1_and0000;
  wire RxLED_2_and0000;
  wire RxNewBitAvailable_692;
  wire RxNewByteAvailable_693;
  wire RxPacketReceivedOK_726;
  wire RxPacketReceivedOK_and0000;
  wire RxPacketReceivedOK_and000013_728;
  wire RxPacketReceivedOK_and00006;
  wire RxPacketReceivedOK_and000061_730;
  wire RxPreambleBitsCount_not0001_736;
  wire RxPreambleBitsCount_or0000;
  wire RxPreambleBitsCount_or000018_738;
  wire RxPreambleBitsCount_or000039_739;
  wire RxPreambleBitsCount_or000051_740;
  wire RxPreambleBitsCount_or000065_741;
  wire RxPreambleBitsCount_or00007_742;
  wire RxTransitionCount_cmp_eq0000_inv;
  wire RxTransitionCount_not0001_746;
  wire RxTransitionTimeout_or0000;
  wire Rx_SFDdetected;
  wire Rx_SFDdetected45_752;
  wire Rx_end_of_Ethernet_frame;
  wire SendingPacket_754;
  wire SendingPacketData_755;
  wire SendingPacketData_inv;
  wire SendingPacket_and0000;
  wire SendingPacket_and000014_758;
  wire SendingPacket_and00009_759;
  wire SendingPacket_inv;
  wire StartSending_781;
  wire StartSending_and0000;
  wire TxAddress_3_1_799;
  wire USB_D_USB_readmux_not0000_inv;
  wire USB_D_USB_readmux_not0000_inv_inv;
  wire _and0000;
  wire clk20_836;
  wire clkTx;
  wire idlecount_and0000_inv;
  wire pkt_data_cmp_eq0023;
  wire pkt_data_cmp_eq0025;
  wire pkt_data_cmp_eq0027;
  wire pkt_data_cmp_eq0028;
  wire pkt_data_cmp_eq0029;
  wire pkt_data_cmp_eq0030;
  wire pkt_data_cmp_eq0037;
  wire pkt_data_cmp_eq0048;
  wire pkt_data_cmp_eq0049;
  wire pkt_data_cmp_eq0050;
  wire \pkt_data_mux0000<0>16_884 ;
  wire \pkt_data_mux0000<0>33_885 ;
  wire \pkt_data_mux0000<0>49 ;
  wire \pkt_data_mux0000<0>5_887 ;
  wire \pkt_data_mux0000<1>34_888 ;
  wire \pkt_data_mux0000<1>55 ;
  wire \pkt_data_mux0000<1>7_890 ;
  wire \pkt_data_mux0000<2>12_891 ;
  wire \pkt_data_mux0000<2>20_892 ;
  wire \pkt_data_mux0000<2>49 ;
  wire \pkt_data_mux0000<2>5_894 ;
  wire \pkt_data_mux0000<3>0_895 ;
  wire \pkt_data_mux0000<3>28_896 ;
  wire \pkt_data_mux0000<3>36_897 ;
  wire \pkt_data_mux0000<3>41_898 ;
  wire \pkt_data_mux0000<3>5_899 ;
  wire \pkt_data_mux0000<3>59_900 ;
  wire \pkt_data_mux0000<3>69_901 ;
  wire \pkt_data_mux0000<3>90 ;
  wire \pkt_data_mux0000<4>14_903 ;
  wire \pkt_data_mux0000<4>21_904 ;
  wire \pkt_data_mux0000<4>6 ;
  wire \pkt_data_mux0000<4>61_906 ;
  wire \pkt_data_mux0000<4>62_907 ;
  wire \pkt_data_mux0000<4>66 ;
  wire \pkt_data_mux0000<5>15_909 ;
  wire \pkt_data_mux0000<5>24_910 ;
  wire \pkt_data_mux0000<5>51 ;
  wire \pkt_data_mux0000<6>21_912 ;
  wire \pkt_data_mux0000<6>34_913 ;
  wire \pkt_data_mux0000<6>69 ;
  wire \pkt_data_mux0000<7>101 ;
  wire \pkt_data_mux0000<7>26_916 ;
  wire \pkt_data_mux0000<7>68_917 ;
  wire pkt_data_or0000_918;
  wire pkt_data_or0004;
  wire pkt_data_or0007;
  wire pkt_data_or000733_921;
  wire pkt_data_or000766_922;
  wire pkt_data_or000779_923;
  wire qo_924;
  wire qo_xor0000;
  wire qoe_926;
  wire qoe_inv;
  wire qoe_or00001;
  wire readram;
  wire \NLW_RAM_RxTx/RAM_DIB<7>_UNCONNECTED ;
  wire \NLW_RAM_RxTx/RAM_DIB<6>_UNCONNECTED ;
  wire \NLW_RAM_RxTx/RAM_DIB<5>_UNCONNECTED ;
  wire \NLW_RAM_RxTx/RAM_DIB<4>_UNCONNECTED ;
  wire \NLW_RAM_RxTx/RAM_DIB<3>_UNCONNECTED ;
  wire \NLW_RAM_RxTx/RAM_DIB<2>_UNCONNECTED ;
  wire \NLW_RAM_RxTx/RAM_DIB<1>_UNCONNECTED ;
  wire \NLW_RAM_RxTx/RAM_DIB<0>_UNCONNECTED ;
  wire \NLW_RAM_RxTx/RAM_DOA<7>_UNCONNECTED ;
  wire \NLW_RAM_RxTx/RAM_DOA<6>_UNCONNECTED ;
  wire \NLW_RAM_RxTx/RAM_DOA<5>_UNCONNECTED ;
  wire \NLW_RAM_RxTx/RAM_DOA<4>_UNCONNECTED ;
  wire \NLW_RAM_RxTx/RAM_DOA<3>_UNCONNECTED ;
  wire \NLW_RAM_RxTx/RAM_DOA<2>_UNCONNECTED ;
  wire \NLW_RAM_RxTx/RAM_DOA<1>_UNCONNECTED ;
  wire \NLW_RAM_RxTx/RAM_DOA<0>_UNCONNECTED ;
  wire [31 : 0] CRC;
  wire [31 : 0] CRC_mux0000;
  wire [16 : 0] LinkPulseCount;
  wire [15 : 0] Mcount_LinkPulseCount_cy;
  wire [0 : 0] Mcount_LinkPulseCount_lut;
  wire [12 : 0] Mcount_RxBitCount_cy;
  wire [0 : 0] Mcount_RxBitCount_lut;
  wire [30 : 0] Mcount_RxPacketCount_cy;
  wire [0 : 0] Mcount_RxPacketCount_lut;
  wire [9 : 0] Mcount_TxAddress_cy;
  wire [10 : 0] Mcount_TxAddress_lut;
  wire [22 : 0] Mcount_counter_cy;
  wire [0 : 0] Mcount_counter_lut;
  wire [31 : 0] Result;
  wire [13 : 0] RxBitCount;
  wire [31 : 0] RxCRC;
  wire [6 : 0] RxCRC_OK_cmp_eq0000_wg_cy;
  wire [7 : 0] RxCRC_OK_cmp_eq0000_wg_lut;
  wire [31 : 0] RxCRC_mux0000;
  wire [7 : 0] RxDataByteIn;
  wire [7 : 7] RxDataByteIn_mux0000;
  wire [2 : 1] RxInSRp;
  wire [2 : 0] RxLED;
  wire [31 : 0] RxPacketCount;
  wire [4 : 0] RxPreambleBitsCount;
  wire [1 : 0] RxTransitionCount;
  wire [2 : 0] RxTransitionTimeout;
  wire [3 : 0] ShiftCount;
  wire [7 : 0] ShiftData;
  wire [7 : 0] ShiftData_mux0000;
  wire [4 : 0] StartSending_and0000_wg_cy;
  wire [5 : 0] StartSending_and0000_wg_lut;
  wire [10 : 0] TxAddress;
  wire [7 : 0] TxData;
  wire [1 : 0] USB_readcnt;
  wire [7 : 0] USB_readmux;
  wire [23 : 0] counter;
  wire [2 : 0] idlecount;
  wire [7 : 0] pkt_data;
  GND   XST_GND (
    .G(N0)
  );
  VCC   XST_VCC (
    .P(IPchecksum1)
  );
  FD   RxNewBitAvailable (
    .C(CLK_USB_BUFGP_3),
    .D(RxTransitionCount[1]),
    .Q(RxNewBitAvailable_692)
  );
  FD   RxFrame (
    .C(CLK_USB_BUFGP_3),
    .D(RxFrame_mux0000),
    .Q(RxFrame_649)
  );
  FD   RxDataByteIn_7 (
    .C(CLK_USB_BUFGP_3),
    .D(RxDataByteIn_mux0000[7]),
    .Q(RxDataByteIn[7])
  );
  FD   RxCRC_CheckNow (
    .C(CLK_USB_BUFGP_3),
    .D(RxNewByteAvailable_693),
    .Q(RxCRC_CheckNow_588)
  );
  FD   RxPacketReceivedOK (
    .C(CLK_USB_BUFGP_3),
    .D(RxPacketReceivedOK_and0000),
    .Q(RxPacketReceivedOK_726)
  );
  FDR   clk20 (
    .C(CLK40_BUFGP_1),
    .D(IPchecksum1),
    .R(clk20_836),
    .Q(clk20_836)
  );
  FDE   RxCRC_0 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(RxCRC_mux0000[31]),
    .Q(RxCRC[0])
  );
  FDE   RxCRC_1 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(RxCRC_mux0000[30]),
    .Q(RxCRC[1])
  );
  FDE   RxCRC_2 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(RxCRC_mux0000[29]),
    .Q(RxCRC[2])
  );
  FDE   RxCRC_3 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(RxCRC_mux0000[28]),
    .Q(RxCRC[3])
  );
  FDE   RxCRC_4 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(RxCRC_mux0000[27]),
    .Q(RxCRC[4])
  );
  FDE   RxCRC_5 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(RxCRC_mux0000[26]),
    .Q(RxCRC[5])
  );
  FDE   RxCRC_6 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(RxCRC_mux0000[25]),
    .Q(RxCRC[6])
  );
  FDE   RxCRC_7 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(RxCRC_mux0000[24]),
    .Q(RxCRC[7])
  );
  FDE   RxCRC_8 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(RxCRC_mux0000[23]),
    .Q(RxCRC[8])
  );
  FDE   RxCRC_9 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(RxCRC_mux0000[22]),
    .Q(RxCRC[9])
  );
  FDE   RxCRC_10 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(RxCRC_mux0000[21]),
    .Q(RxCRC[10])
  );
  FDE   RxCRC_11 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(RxCRC_mux0000[20]),
    .Q(RxCRC[11])
  );
  FDE   RxCRC_12 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(RxCRC_mux0000[19]),
    .Q(RxCRC[12])
  );
  FDE   RxCRC_13 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(RxCRC_mux0000[18]),
    .Q(RxCRC[13])
  );
  FDE   RxCRC_14 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(RxCRC_mux0000[17]),
    .Q(RxCRC[14])
  );
  FDE   RxCRC_15 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(RxCRC_mux0000[16]),
    .Q(RxCRC[15])
  );
  FDE   RxCRC_16 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(RxCRC_mux0000[15]),
    .Q(RxCRC[16])
  );
  FDE   RxCRC_17 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(RxCRC_mux0000[14]),
    .Q(RxCRC[17])
  );
  FDE   RxCRC_18 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(RxCRC_mux0000[13]),
    .Q(RxCRC[18])
  );
  FDE   RxCRC_19 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(RxCRC_mux0000[12]),
    .Q(RxCRC[19])
  );
  FDE   RxCRC_20 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(RxCRC_mux0000[11]),
    .Q(RxCRC[20])
  );
  FDE   RxCRC_21 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(RxCRC_mux0000[10]),
    .Q(RxCRC[21])
  );
  FDE   RxCRC_22 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(RxCRC_mux0000[9]),
    .Q(RxCRC[22])
  );
  FDE   RxCRC_23 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(RxCRC_mux0000[8]),
    .Q(RxCRC[23])
  );
  FDE   RxCRC_24 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(RxCRC_mux0000[7]),
    .Q(RxCRC[24])
  );
  FDE   RxCRC_25 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(RxCRC_mux0000[6]),
    .Q(RxCRC[25])
  );
  FDE   RxCRC_26 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(RxCRC_mux0000[5]),
    .Q(RxCRC[26])
  );
  FDE   RxCRC_27 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(RxCRC_mux0000[4]),
    .Q(RxCRC[27])
  );
  FDE   RxCRC_28 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(RxCRC_mux0000[3]),
    .Q(RxCRC[28])
  );
  FDE   RxCRC_29 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(RxCRC_mux0000[2]),
    .Q(RxCRC[29])
  );
  FDE   RxCRC_30 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(RxCRC_mux0000[1]),
    .Q(RxCRC[30])
  );
  FDE   RxCRC_31 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(RxCRC_mux0000[0]),
    .Q(RxCRC[31])
  );
  FDE   RxCRC_OK (
    .C(CLK_USB_BUFGP_3),
    .CE(RxCRC_CheckNow_588),
    .D(RxCRC_OK_cmp_eq0000),
    .Q(RxCRC_OK_589)
  );
  FDSE   RxGoodPacket (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewByteAvailable_693),
    .D(RxGoodPacket_mux0000),
    .S(RxFrame_inv),
    .Q(RxGoodPacket_652)
  );
  FDE   RxLED_1 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxLED_1_and0000),
    .D(RxDataByteIn[7]),
    .Q(RxLED[1])
  );
  FDE   RxLED_0 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxLED_0_and0000),
    .D(RxDataByteIn[7]),
    .Q(RxLED[0])
  );
  FDE   RxLED_2 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxLED_2_and0000),
    .D(RxDataByteIn[7]),
    .Q(RxLED[2])
  );
  FD   StartSending (
    .C(clkTx),
    .D(StartSending_and0000),
    .Q(StartSending_781)
  );
  FDE   CRCflush (
    .C(clkTx),
    .CE(CRCflush_not0001),
    .D(CRCflush_mux0000_69),
    .Q(CRCflush_68)
  );
  FDE   CRCinit (
    .C(clkTx),
    .CE(readram),
    .D(CRCinit_cmp_eq0000_72),
    .Q(CRCinit_71)
  );
  FD   LinkPulse (
    .C(clkTx),
    .D(LinkPulse_and0000),
    .Q(LinkPulse_88)
  );
  FDE   RxDataPolarity (
    .C(CLK_USB_BUFGP_3),
    .CE(Rx_SFDdetected),
    .D(RxDataPolarity_xor0000),
    .Q(RxDataPolarity_647)
  );
  FDE   LED_0 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPacketReceivedOK_726),
    .D(RxLED[0]),
    .Q(LED_0_85)
  );
  FDE   LED_1 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPacketReceivedOK_726),
    .D(RxLED[1]),
    .Q(LED_1_86)
  );
  FDE   LED_2 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPacketReceivedOK_726),
    .D(RxLED[2]),
    .Q(LED_2_87)
  );
  FDSE   SendingPacket (
    .C(clkTx),
    .CE(SendingPacket_and0000),
    .D(N0),
    .S(StartSending_781),
    .Q(SendingPacket_754)
  );
  FDR   Ethernet_TDm_55 (
    .C(clkTx),
    .D(Ethernet_TDm_not0001),
    .R(qoe_inv),
    .Q(Ethernet_TDm_OBUF_77)
  );
  FD   SendingPacketData (
    .C(clkTx),
    .D(SendingPacket_754),
    .Q(SendingPacketData_755)
  );
  FD_1   RxInSRn_0 (
    .C(CLK_USB_BUFGP_3),
    .D(RxInSRp_xor0000),
    .Q(\RxInSRn[0] )
  );
  FD   RxInSRp_2 (
    .C(CLK_USB_BUFGP_3),
    .D(RxInSRp[1]),
    .Q(RxInSRp[2])
  );
  FDE   ShiftData_0 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(ShiftData_mux0000[0]),
    .Q(ShiftData[0])
  );
  FDE   ShiftData_1 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(ShiftData_mux0000[1]),
    .Q(ShiftData[1])
  );
  FDE   ShiftData_2 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(ShiftData_mux0000[2]),
    .Q(ShiftData[2])
  );
  FDE   ShiftData_3 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(ShiftData_mux0000[3]),
    .Q(ShiftData[3])
  );
  FDE   ShiftData_4 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(ShiftData_mux0000[4]),
    .Q(ShiftData[4])
  );
  FDE   ShiftData_5 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(ShiftData_mux0000[5]),
    .Q(ShiftData[5])
  );
  FDE   ShiftData_6 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(ShiftData_mux0000[6]),
    .Q(ShiftData[6])
  );
  FDE   ShiftData_7 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(ShiftData_mux0000[7]),
    .Q(ShiftData[7])
  );
  FDE   CRC_0 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(CRC_mux0000[31]),
    .Q(CRC[0])
  );
  FDE   CRC_1 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(CRC_mux0000[30]),
    .Q(CRC[1])
  );
  FDE   CRC_2 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(CRC_mux0000[29]),
    .Q(CRC[2])
  );
  FDE   CRC_3 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(CRC_mux0000[28]),
    .Q(CRC[3])
  );
  FDE   CRC_4 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(CRC_mux0000[27]),
    .Q(CRC[4])
  );
  FDE   CRC_5 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(CRC_mux0000[26]),
    .Q(CRC[5])
  );
  FDE   CRC_6 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(CRC_mux0000[25]),
    .Q(CRC[6])
  );
  FDE   CRC_7 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(CRC_mux0000[24]),
    .Q(CRC[7])
  );
  FDE   CRC_8 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(CRC_mux0000[23]),
    .Q(CRC[8])
  );
  FDE   CRC_9 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(CRC_mux0000[22]),
    .Q(CRC[9])
  );
  FDE   CRC_10 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(CRC_mux0000[21]),
    .Q(CRC[10])
  );
  FDE   CRC_11 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(CRC_mux0000[20]),
    .Q(CRC[11])
  );
  FDE   CRC_12 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(CRC_mux0000[19]),
    .Q(CRC[12])
  );
  FDE   CRC_13 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(CRC_mux0000[18]),
    .Q(CRC[13])
  );
  FDE   CRC_14 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(CRC_mux0000[17]),
    .Q(CRC[14])
  );
  FDE   CRC_15 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(CRC_mux0000[16]),
    .Q(CRC[15])
  );
  FDE   CRC_16 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(CRC_mux0000[15]),
    .Q(CRC[16])
  );
  FDE   CRC_17 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(CRC_mux0000[14]),
    .Q(CRC[17])
  );
  FDE   CRC_18 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(CRC_mux0000[13]),
    .Q(CRC[18])
  );
  FDE   CRC_19 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(CRC_mux0000[12]),
    .Q(CRC[19])
  );
  FDE   CRC_20 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(CRC_mux0000[11]),
    .Q(CRC[20])
  );
  FDE   CRC_21 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(CRC_mux0000[10]),
    .Q(CRC[21])
  );
  FDE   CRC_22 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(CRC_mux0000[9]),
    .Q(CRC[22])
  );
  FDE   CRC_23 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(CRC_mux0000[8]),
    .Q(CRC[23])
  );
  FDE   CRC_24 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(CRC_mux0000[7]),
    .Q(CRC[24])
  );
  FDE   CRC_25 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(CRC_mux0000[6]),
    .Q(CRC[25])
  );
  FDE   CRC_26 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(CRC_mux0000[5]),
    .Q(CRC[26])
  );
  FDE   CRC_27 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(CRC_mux0000[4]),
    .Q(CRC[27])
  );
  FDE   CRC_28 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(CRC_mux0000[3]),
    .Q(CRC[28])
  );
  FDE   CRC_29 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(CRC_mux0000[2]),
    .Q(CRC[29])
  );
  FDE   CRC_30 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(CRC_mux0000[1]),
    .Q(CRC[30])
  );
  FDE   CRC_31 (
    .C(clkTx),
    .CE(ShiftCount[0]),
    .D(CRC_mux0000[0]),
    .Q(CRC[31])
  );
  FDS   qo (
    .C(clkTx),
    .D(qo_xor0000),
    .S(SendingPacketData_inv),
    .Q(qo_924)
  );
  FDR   Ethernet_TDp_100 (
    .C(clkTx),
    .D(qo_924),
    .R(qoe_inv),
    .Q(Ethernet_TDp_OBUF_80)
  );
  MUXCY   \Mcount_TxAddress_cy<0>  (
    .CI(SendingPacket_754),
    .DI(N0),
    .S(Mcount_TxAddress_lut[0]),
    .O(Mcount_TxAddress_cy[0])
  );
  XORCY   \Mcount_TxAddress_xor<0>  (
    .CI(SendingPacket_754),
    .LI(Mcount_TxAddress_lut[0]),
    .O(Mcount_TxAddress)
  );
  MUXCY   \Mcount_TxAddress_cy<1>  (
    .CI(Mcount_TxAddress_cy[0]),
    .DI(N0),
    .S(Mcount_TxAddress_lut[1]),
    .O(Mcount_TxAddress_cy[1])
  );
  XORCY   \Mcount_TxAddress_xor<1>  (
    .CI(Mcount_TxAddress_cy[0]),
    .LI(Mcount_TxAddress_lut[1]),
    .O(Mcount_TxAddress1)
  );
  MUXCY   \Mcount_TxAddress_cy<2>  (
    .CI(Mcount_TxAddress_cy[1]),
    .DI(N0),
    .S(Mcount_TxAddress_lut[2]),
    .O(Mcount_TxAddress_cy[2])
  );
  XORCY   \Mcount_TxAddress_xor<2>  (
    .CI(Mcount_TxAddress_cy[1]),
    .LI(Mcount_TxAddress_lut[2]),
    .O(Mcount_TxAddress2)
  );
  MUXCY   \Mcount_TxAddress_cy<3>  (
    .CI(Mcount_TxAddress_cy[2]),
    .DI(N0),
    .S(Mcount_TxAddress_lut[3]),
    .O(Mcount_TxAddress_cy[3])
  );
  XORCY   \Mcount_TxAddress_xor<3>  (
    .CI(Mcount_TxAddress_cy[2]),
    .LI(Mcount_TxAddress_lut[3]),
    .O(Mcount_TxAddress3)
  );
  MUXCY   \Mcount_TxAddress_cy<4>  (
    .CI(Mcount_TxAddress_cy[3]),
    .DI(N0),
    .S(Mcount_TxAddress_lut[4]),
    .O(Mcount_TxAddress_cy[4])
  );
  XORCY   \Mcount_TxAddress_xor<4>  (
    .CI(Mcount_TxAddress_cy[3]),
    .LI(Mcount_TxAddress_lut[4]),
    .O(Mcount_TxAddress4)
  );
  MUXCY   \Mcount_TxAddress_cy<5>  (
    .CI(Mcount_TxAddress_cy[4]),
    .DI(N0),
    .S(Mcount_TxAddress_lut[5]),
    .O(Mcount_TxAddress_cy[5])
  );
  XORCY   \Mcount_TxAddress_xor<5>  (
    .CI(Mcount_TxAddress_cy[4]),
    .LI(Mcount_TxAddress_lut[5]),
    .O(Mcount_TxAddress5)
  );
  MUXCY   \Mcount_TxAddress_cy<6>  (
    .CI(Mcount_TxAddress_cy[5]),
    .DI(N0),
    .S(Mcount_TxAddress_lut[6]),
    .O(Mcount_TxAddress_cy[6])
  );
  XORCY   \Mcount_TxAddress_xor<6>  (
    .CI(Mcount_TxAddress_cy[5]),
    .LI(Mcount_TxAddress_lut[6]),
    .O(Mcount_TxAddress6)
  );
  MUXCY   \Mcount_TxAddress_cy<7>  (
    .CI(Mcount_TxAddress_cy[6]),
    .DI(N0),
    .S(Mcount_TxAddress_lut[7]),
    .O(Mcount_TxAddress_cy[7])
  );
  XORCY   \Mcount_TxAddress_xor<7>  (
    .CI(Mcount_TxAddress_cy[6]),
    .LI(Mcount_TxAddress_lut[7]),
    .O(Mcount_TxAddress7)
  );
  MUXCY   \Mcount_TxAddress_cy<8>  (
    .CI(Mcount_TxAddress_cy[7]),
    .DI(N0),
    .S(Mcount_TxAddress_lut[8]),
    .O(Mcount_TxAddress_cy[8])
  );
  XORCY   \Mcount_TxAddress_xor<8>  (
    .CI(Mcount_TxAddress_cy[7]),
    .LI(Mcount_TxAddress_lut[8]),
    .O(Mcount_TxAddress8)
  );
  MUXCY   \Mcount_TxAddress_cy<9>  (
    .CI(Mcount_TxAddress_cy[8]),
    .DI(N0),
    .S(Mcount_TxAddress_lut[9]),
    .O(Mcount_TxAddress_cy[9])
  );
  XORCY   \Mcount_TxAddress_xor<9>  (
    .CI(Mcount_TxAddress_cy[8]),
    .LI(Mcount_TxAddress_lut[9]),
    .O(Mcount_TxAddress9)
  );
  XORCY   \Mcount_TxAddress_xor<10>  (
    .CI(Mcount_TxAddress_cy[9]),
    .LI(Mcount_TxAddress_lut[10]),
    .O(Mcount_TxAddress10)
  );
  FDE   RxTransitionCount_0 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxTransitionCount_not0001_746),
    .D(Maccum_RxTransitionCount_111),
    .Q(RxTransitionCount[0])
  );
  FDE   RxTransitionCount_1 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxTransitionCount_not0001_746),
    .D(\Result<1>1 ),
    .Q(RxTransitionCount[1])
  );
  FDRE   RxPreambleBitsCount_0 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPreambleBitsCount_not0001_736),
    .D(\Result<0>2 ),
    .R(RxPreambleBitsCount_or0000),
    .Q(RxPreambleBitsCount[0])
  );
  FDRE   RxPreambleBitsCount_1 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPreambleBitsCount_not0001_736),
    .D(\Result<1>2 ),
    .R(RxPreambleBitsCount_or0000),
    .Q(RxPreambleBitsCount[1])
  );
  FDRE   RxPreambleBitsCount_2 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPreambleBitsCount_not0001_736),
    .D(\Result<2>1 ),
    .R(RxPreambleBitsCount_or0000),
    .Q(RxPreambleBitsCount[2])
  );
  FDRE   RxPreambleBitsCount_3 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPreambleBitsCount_not0001_736),
    .D(\Result<3>1 ),
    .R(RxPreambleBitsCount_or0000),
    .Q(RxPreambleBitsCount[3])
  );
  FDRE   RxPreambleBitsCount_4 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPreambleBitsCount_not0001_736),
    .D(\Result<4>1 ),
    .R(RxPreambleBitsCount_or0000),
    .Q(RxPreambleBitsCount[4])
  );
  FDRE   RxTransitionTimeout_0 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxTransitionCount_cmp_eq0000_inv),
    .D(\Result<0>4 ),
    .R(RxTransitionTimeout_or0000),
    .Q(RxTransitionTimeout[0])
  );
  FDRE   RxTransitionTimeout_1 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxTransitionCount_cmp_eq0000_inv),
    .D(\Result<1>4 ),
    .R(RxTransitionTimeout_or0000),
    .Q(RxTransitionTimeout[1])
  );
  FDRE   RxTransitionTimeout_2 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxTransitionCount_cmp_eq0000_inv),
    .D(\Result<2>3 ),
    .R(RxTransitionTimeout_or0000),
    .Q(RxTransitionTimeout[2])
  );
  FDE   RxPacketCount_0 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPacketReceivedOK_726),
    .D(Result[0]),
    .Q(RxPacketCount[0])
  );
  FDE   RxPacketCount_1 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPacketReceivedOK_726),
    .D(Result[1]),
    .Q(RxPacketCount[1])
  );
  FDE   RxPacketCount_2 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPacketReceivedOK_726),
    .D(Result[2]),
    .Q(RxPacketCount[2])
  );
  FDE   RxPacketCount_3 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPacketReceivedOK_726),
    .D(Result[3]),
    .Q(RxPacketCount[3])
  );
  FDE   RxPacketCount_4 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPacketReceivedOK_726),
    .D(Result[4]),
    .Q(RxPacketCount[4])
  );
  FDE   RxPacketCount_5 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPacketReceivedOK_726),
    .D(Result[5]),
    .Q(RxPacketCount[5])
  );
  FDE   RxPacketCount_6 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPacketReceivedOK_726),
    .D(Result[6]),
    .Q(RxPacketCount[6])
  );
  FDE   RxPacketCount_7 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPacketReceivedOK_726),
    .D(Result[7]),
    .Q(RxPacketCount[7])
  );
  FDE   RxPacketCount_8 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPacketReceivedOK_726),
    .D(Result[8]),
    .Q(RxPacketCount[8])
  );
  FDE   RxPacketCount_9 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPacketReceivedOK_726),
    .D(Result[9]),
    .Q(RxPacketCount[9])
  );
  FDE   RxPacketCount_10 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPacketReceivedOK_726),
    .D(Result[10]),
    .Q(RxPacketCount[10])
  );
  FDE   RxPacketCount_11 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPacketReceivedOK_726),
    .D(Result[11]),
    .Q(RxPacketCount[11])
  );
  FDE   RxPacketCount_12 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPacketReceivedOK_726),
    .D(Result[12]),
    .Q(RxPacketCount[12])
  );
  FDE   RxPacketCount_13 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPacketReceivedOK_726),
    .D(Result[13]),
    .Q(RxPacketCount[13])
  );
  FDE   RxPacketCount_14 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPacketReceivedOK_726),
    .D(Result[14]),
    .Q(RxPacketCount[14])
  );
  FDE   RxPacketCount_15 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPacketReceivedOK_726),
    .D(Result[15]),
    .Q(RxPacketCount[15])
  );
  FDE   RxPacketCount_16 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPacketReceivedOK_726),
    .D(Result[16]),
    .Q(RxPacketCount[16])
  );
  FDE   RxPacketCount_17 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPacketReceivedOK_726),
    .D(Result[17]),
    .Q(RxPacketCount[17])
  );
  FDE   RxPacketCount_18 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPacketReceivedOK_726),
    .D(Result[18]),
    .Q(RxPacketCount[18])
  );
  FDE   RxPacketCount_19 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPacketReceivedOK_726),
    .D(Result[19]),
    .Q(RxPacketCount[19])
  );
  FDE   RxPacketCount_20 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPacketReceivedOK_726),
    .D(Result[20]),
    .Q(RxPacketCount[20])
  );
  FDE   RxPacketCount_21 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPacketReceivedOK_726),
    .D(Result[21]),
    .Q(RxPacketCount[21])
  );
  FDE   RxPacketCount_22 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPacketReceivedOK_726),
    .D(Result[22]),
    .Q(RxPacketCount[22])
  );
  FDE   RxPacketCount_23 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPacketReceivedOK_726),
    .D(Result[23]),
    .Q(RxPacketCount[23])
  );
  FDE   RxPacketCount_24 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPacketReceivedOK_726),
    .D(Result[24]),
    .Q(RxPacketCount[24])
  );
  FDE   RxPacketCount_25 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPacketReceivedOK_726),
    .D(Result[25]),
    .Q(RxPacketCount[25])
  );
  FDE   RxPacketCount_26 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPacketReceivedOK_726),
    .D(Result[26]),
    .Q(RxPacketCount[26])
  );
  FDE   RxPacketCount_27 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPacketReceivedOK_726),
    .D(Result[27]),
    .Q(RxPacketCount[27])
  );
  FDE   RxPacketCount_28 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPacketReceivedOK_726),
    .D(Result[28]),
    .Q(RxPacketCount[28])
  );
  FDE   RxPacketCount_29 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPacketReceivedOK_726),
    .D(Result[29]),
    .Q(RxPacketCount[29])
  );
  FDE   RxPacketCount_30 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPacketReceivedOK_726),
    .D(Result[30]),
    .Q(RxPacketCount[30])
  );
  FDE   RxPacketCount_31 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxPacketReceivedOK_726),
    .D(Result[31]),
    .Q(RxPacketCount[31])
  );
  FDRE   RxBitCount_0 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(\Result<0>3 ),
    .R(RxFrame_inv),
    .Q(RxBitCount[0])
  );
  FDRE   RxBitCount_1 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(\Result<1>3 ),
    .R(RxFrame_inv),
    .Q(RxBitCount[1])
  );
  FDRE   RxBitCount_2 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(\Result<2>2 ),
    .R(RxFrame_inv),
    .Q(RxBitCount[2])
  );
  FDRE   RxBitCount_3 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(\Result<3>2 ),
    .R(RxFrame_inv),
    .Q(RxBitCount[3])
  );
  FDRE   RxBitCount_4 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(\Result<4>2 ),
    .R(RxFrame_inv),
    .Q(RxBitCount[4])
  );
  FDRE   RxBitCount_5 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(\Result<5>1 ),
    .R(RxFrame_inv),
    .Q(RxBitCount[5])
  );
  FDRE   RxBitCount_6 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(\Result<6>1 ),
    .R(RxFrame_inv),
    .Q(RxBitCount[6])
  );
  FDRE   RxBitCount_7 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(\Result<7>1 ),
    .R(RxFrame_inv),
    .Q(RxBitCount[7])
  );
  FDRE   RxBitCount_8 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(\Result<8>1 ),
    .R(RxFrame_inv),
    .Q(RxBitCount[8])
  );
  FDRE   RxBitCount_9 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(\Result<9>1 ),
    .R(RxFrame_inv),
    .Q(RxBitCount[9])
  );
  FDRE   RxBitCount_10 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(\Result<10>1 ),
    .R(RxFrame_inv),
    .Q(RxBitCount[10])
  );
  FDRE   RxBitCount_11 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(\Result<11>1 ),
    .R(RxFrame_inv),
    .Q(RxBitCount[11])
  );
  FDRE   RxBitCount_12 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(\Result<12>1 ),
    .R(RxFrame_inv),
    .Q(RxBitCount[12])
  );
  FDRE   RxBitCount_13 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxNewBitAvailable_692),
    .D(\Result<13>1 ),
    .R(RxFrame_inv),
    .Q(RxBitCount[13])
  );
  FDE   USB_readcnt_0 (
    .C(CLK_USB_BUFGP_3),
    .CE(USB_D_USB_readmux_not0000_inv_inv),
    .D(\Result<0>5 ),
    .Q(USB_readcnt[0])
  );
  FDE   USB_readcnt_1 (
    .C(CLK_USB_BUFGP_3),
    .CE(USB_D_USB_readmux_not0000_inv_inv),
    .D(\Result<1>5 ),
    .Q(USB_readcnt[1])
  );
  FD   counter_0 (
    .C(clkTx),
    .D(\Result<0>6 ),
    .Q(counter[0])
  );
  FD   counter_1 (
    .C(clkTx),
    .D(\Result<1>6 ),
    .Q(counter[1])
  );
  FD   counter_2 (
    .C(clkTx),
    .D(\Result<2>4 ),
    .Q(counter[2])
  );
  FD   counter_3 (
    .C(clkTx),
    .D(\Result<3>3 ),
    .Q(counter[3])
  );
  FD   counter_4 (
    .C(clkTx),
    .D(\Result<4>3 ),
    .Q(counter[4])
  );
  FD   counter_5 (
    .C(clkTx),
    .D(\Result<5>2 ),
    .Q(counter[5])
  );
  FD   counter_6 (
    .C(clkTx),
    .D(\Result<6>2 ),
    .Q(counter[6])
  );
  FD   counter_7 (
    .C(clkTx),
    .D(\Result<7>2 ),
    .Q(counter[7])
  );
  FD   counter_8 (
    .C(clkTx),
    .D(\Result<8>2 ),
    .Q(counter[8])
  );
  FD   counter_9 (
    .C(clkTx),
    .D(\Result<9>2 ),
    .Q(counter[9])
  );
  FD   counter_10 (
    .C(clkTx),
    .D(\Result<10>2 ),
    .Q(counter[10])
  );
  FD   counter_11 (
    .C(clkTx),
    .D(\Result<11>2 ),
    .Q(counter[11])
  );
  FD   counter_12 (
    .C(clkTx),
    .D(\Result<12>2 ),
    .Q(counter[12])
  );
  FD   counter_13 (
    .C(clkTx),
    .D(\Result<13>2 ),
    .Q(counter[13])
  );
  FD   counter_14 (
    .C(clkTx),
    .D(\Result<14>1 ),
    .Q(counter[14])
  );
  FD   counter_15 (
    .C(clkTx),
    .D(\Result<15>1 ),
    .Q(counter[15])
  );
  FD   counter_16 (
    .C(clkTx),
    .D(\Result<16>1 ),
    .Q(counter[16])
  );
  FD   counter_17 (
    .C(clkTx),
    .D(\Result<17>1 ),
    .Q(counter[17])
  );
  FD   counter_18 (
    .C(clkTx),
    .D(\Result<18>1 ),
    .Q(counter[18])
  );
  FD   counter_19 (
    .C(clkTx),
    .D(\Result<19>1 ),
    .Q(counter[19])
  );
  FD   counter_20 (
    .C(clkTx),
    .D(\Result<20>1 ),
    .Q(counter[20])
  );
  FD   counter_21 (
    .C(clkTx),
    .D(\Result<21>1 ),
    .Q(counter[21])
  );
  FD   counter_22 (
    .C(clkTx),
    .D(\Result<22>1 ),
    .Q(counter[22])
  );
  FD   counter_23 (
    .C(clkTx),
    .D(\Result<23>1 ),
    .Q(counter[23])
  );
  FDS   ShiftCount_0 (
    .C(clkTx),
    .D(\Result<0>7 ),
    .S(SendingPacket_inv),
    .Q(ShiftCount[0])
  );
  FDS   ShiftCount_1 (
    .C(clkTx),
    .D(\Result<1>7 ),
    .S(SendingPacket_inv),
    .Q(ShiftCount[1])
  );
  FDS   ShiftCount_2 (
    .C(clkTx),
    .D(\Result<2>5 ),
    .S(SendingPacket_inv),
    .Q(ShiftCount[2])
  );
  FDS   ShiftCount_3 (
    .C(clkTx),
    .D(\Result<3>4 ),
    .S(SendingPacket_inv),
    .Q(ShiftCount[3])
  );
  FDE   TxAddress_0 (
    .C(clkTx),
    .CE(readram),
    .D(Mcount_TxAddress),
    .Q(TxAddress[0])
  );
  FDE   TxAddress_1 (
    .C(clkTx),
    .CE(readram),
    .D(Mcount_TxAddress1),
    .Q(TxAddress[1])
  );
  FDE   TxAddress_2 (
    .C(clkTx),
    .CE(readram),
    .D(Mcount_TxAddress2),
    .Q(TxAddress[2])
  );
  FDE   TxAddress_3 (
    .C(clkTx),
    .CE(readram),
    .D(Mcount_TxAddress3),
    .Q(TxAddress[3])
  );
  FDE   TxAddress_4 (
    .C(clkTx),
    .CE(readram),
    .D(Mcount_TxAddress4),
    .Q(TxAddress[4])
  );
  FDE   TxAddress_5 (
    .C(clkTx),
    .CE(readram),
    .D(Mcount_TxAddress5),
    .Q(TxAddress[5])
  );
  FDE   TxAddress_6 (
    .C(clkTx),
    .CE(readram),
    .D(Mcount_TxAddress6),
    .Q(TxAddress[6])
  );
  FDE   TxAddress_7 (
    .C(clkTx),
    .CE(readram),
    .D(Mcount_TxAddress7),
    .Q(TxAddress[7])
  );
  FDE   TxAddress_8 (
    .C(clkTx),
    .CE(readram),
    .D(Mcount_TxAddress8),
    .Q(TxAddress[8])
  );
  FDE   TxAddress_9 (
    .C(clkTx),
    .CE(readram),
    .D(Mcount_TxAddress9),
    .Q(TxAddress[9])
  );
  FDE   TxAddress_10 (
    .C(clkTx),
    .CE(readram),
    .D(Mcount_TxAddress10),
    .Q(TxAddress[10])
  );
  FDR   LinkPulseCount_0 (
    .C(clkTx),
    .D(\Result<0>8 ),
    .R(SendingPacket_754),
    .Q(LinkPulseCount[0])
  );
  FDR   LinkPulseCount_1 (
    .C(clkTx),
    .D(\Result<1>8 ),
    .R(SendingPacket_754),
    .Q(LinkPulseCount[1])
  );
  FDR   LinkPulseCount_2 (
    .C(clkTx),
    .D(\Result<2>6 ),
    .R(SendingPacket_754),
    .Q(LinkPulseCount[2])
  );
  FDR   LinkPulseCount_3 (
    .C(clkTx),
    .D(\Result<3>5 ),
    .R(SendingPacket_754),
    .Q(LinkPulseCount[3])
  );
  FDR   LinkPulseCount_4 (
    .C(clkTx),
    .D(\Result<4>4 ),
    .R(SendingPacket_754),
    .Q(LinkPulseCount[4])
  );
  FDR   LinkPulseCount_5 (
    .C(clkTx),
    .D(\Result<5>3 ),
    .R(SendingPacket_754),
    .Q(LinkPulseCount[5])
  );
  FDR   LinkPulseCount_6 (
    .C(clkTx),
    .D(\Result<6>3 ),
    .R(SendingPacket_754),
    .Q(LinkPulseCount[6])
  );
  FDR   LinkPulseCount_7 (
    .C(clkTx),
    .D(\Result<7>3 ),
    .R(SendingPacket_754),
    .Q(LinkPulseCount[7])
  );
  FDR   LinkPulseCount_8 (
    .C(clkTx),
    .D(\Result<8>3 ),
    .R(SendingPacket_754),
    .Q(LinkPulseCount[8])
  );
  FDR   LinkPulseCount_9 (
    .C(clkTx),
    .D(\Result<9>3 ),
    .R(SendingPacket_754),
    .Q(LinkPulseCount[9])
  );
  FDR   LinkPulseCount_10 (
    .C(clkTx),
    .D(\Result<10>3 ),
    .R(SendingPacket_754),
    .Q(LinkPulseCount[10])
  );
  FDR   LinkPulseCount_11 (
    .C(clkTx),
    .D(\Result<11>3 ),
    .R(SendingPacket_754),
    .Q(LinkPulseCount[11])
  );
  FDR   LinkPulseCount_12 (
    .C(clkTx),
    .D(\Result<12>3 ),
    .R(SendingPacket_754),
    .Q(LinkPulseCount[12])
  );
  FDR   LinkPulseCount_13 (
    .C(clkTx),
    .D(\Result<13>3 ),
    .R(SendingPacket_754),
    .Q(LinkPulseCount[13])
  );
  FDR   LinkPulseCount_14 (
    .C(clkTx),
    .D(\Result<14>2 ),
    .R(SendingPacket_754),
    .Q(LinkPulseCount[14])
  );
  FDR   LinkPulseCount_15 (
    .C(clkTx),
    .D(\Result<15>2 ),
    .R(SendingPacket_754),
    .Q(LinkPulseCount[15])
  );
  FDR   LinkPulseCount_16 (
    .C(clkTx),
    .D(\Result<16>2 ),
    .R(SendingPacket_754),
    .Q(LinkPulseCount[16])
  );
  FDRE   idlecount_0 (
    .C(clkTx),
    .CE(idlecount_and0000_inv),
    .D(\Result<0>9 ),
    .R(SendingPacketData_755),
    .Q(idlecount[0])
  );
  FDRE   idlecount_1 (
    .C(clkTx),
    .CE(idlecount_and0000_inv),
    .D(\Result<1>9 ),
    .R(SendingPacketData_755),
    .Q(idlecount[1])
  );
  FDRE   idlecount_2 (
    .C(clkTx),
    .CE(idlecount_and0000_inv),
    .D(\Result<2>7 ),
    .R(SendingPacketData_755),
    .Q(idlecount[2])
  );
  MUXF5   Mmux_USB_readmux_2_f5_6 (
    .I0(Mmux_USB_readmux_47_331),
    .I1(Mmux_USB_readmux_37_323),
    .S(USB_readcnt[1]),
    .O(USB_readmux[7])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_USB_readmux_47 (
    .I0(USB_readcnt[0]),
    .I1(RxPacketCount[7]),
    .I2(RxPacketCount[15]),
    .O(Mmux_USB_readmux_47_331)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_USB_readmux_37 (
    .I0(USB_readcnt[0]),
    .I1(RxPacketCount[23]),
    .I2(RxPacketCount[31]),
    .O(Mmux_USB_readmux_37_323)
  );
  MUXF5   Mmux_USB_readmux_2_f5_5 (
    .I0(Mmux_USB_readmux_46_330),
    .I1(Mmux_USB_readmux_36_322),
    .S(USB_readcnt[1]),
    .O(USB_readmux[6])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_USB_readmux_46 (
    .I0(USB_readcnt[0]),
    .I1(RxPacketCount[6]),
    .I2(RxPacketCount[14]),
    .O(Mmux_USB_readmux_46_330)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_USB_readmux_36 (
    .I0(USB_readcnt[0]),
    .I1(RxPacketCount[22]),
    .I2(RxPacketCount[30]),
    .O(Mmux_USB_readmux_36_322)
  );
  MUXF5   Mmux_USB_readmux_2_f5_4 (
    .I0(Mmux_USB_readmux_45_329),
    .I1(Mmux_USB_readmux_35_321),
    .S(USB_readcnt[1]),
    .O(USB_readmux[5])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_USB_readmux_45 (
    .I0(USB_readcnt[0]),
    .I1(RxPacketCount[5]),
    .I2(RxPacketCount[13]),
    .O(Mmux_USB_readmux_45_329)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_USB_readmux_35 (
    .I0(USB_readcnt[0]),
    .I1(RxPacketCount[21]),
    .I2(RxPacketCount[29]),
    .O(Mmux_USB_readmux_35_321)
  );
  MUXF5   Mmux_USB_readmux_2_f5_3 (
    .I0(Mmux_USB_readmux_44_328),
    .I1(Mmux_USB_readmux_34_320),
    .S(USB_readcnt[1]),
    .O(USB_readmux[4])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_USB_readmux_44 (
    .I0(USB_readcnt[0]),
    .I1(RxPacketCount[4]),
    .I2(RxPacketCount[12]),
    .O(Mmux_USB_readmux_44_328)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_USB_readmux_34 (
    .I0(USB_readcnt[0]),
    .I1(RxPacketCount[20]),
    .I2(RxPacketCount[28]),
    .O(Mmux_USB_readmux_34_320)
  );
  MUXF5   Mmux_USB_readmux_2_f5_2 (
    .I0(Mmux_USB_readmux_43_327),
    .I1(Mmux_USB_readmux_33_319),
    .S(USB_readcnt[1]),
    .O(USB_readmux[3])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_USB_readmux_43 (
    .I0(USB_readcnt[0]),
    .I1(RxPacketCount[3]),
    .I2(RxPacketCount[11]),
    .O(Mmux_USB_readmux_43_327)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_USB_readmux_33 (
    .I0(USB_readcnt[0]),
    .I1(RxPacketCount[19]),
    .I2(RxPacketCount[27]),
    .O(Mmux_USB_readmux_33_319)
  );
  MUXF5   Mmux_USB_readmux_2_f5_1 (
    .I0(Mmux_USB_readmux_42_326),
    .I1(Mmux_USB_readmux_32_318),
    .S(USB_readcnt[1]),
    .O(USB_readmux[2])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_USB_readmux_42 (
    .I0(USB_readcnt[0]),
    .I1(RxPacketCount[2]),
    .I2(RxPacketCount[10]),
    .O(Mmux_USB_readmux_42_326)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_USB_readmux_32 (
    .I0(USB_readcnt[0]),
    .I1(RxPacketCount[18]),
    .I2(RxPacketCount[26]),
    .O(Mmux_USB_readmux_32_318)
  );
  MUXF5   Mmux_USB_readmux_2_f5_0 (
    .I0(Mmux_USB_readmux_41_325),
    .I1(Mmux_USB_readmux_31_317),
    .S(USB_readcnt[1]),
    .O(USB_readmux[1])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_USB_readmux_41 (
    .I0(USB_readcnt[0]),
    .I1(RxPacketCount[1]),
    .I2(RxPacketCount[9]),
    .O(Mmux_USB_readmux_41_325)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_USB_readmux_31 (
    .I0(USB_readcnt[0]),
    .I1(RxPacketCount[17]),
    .I2(RxPacketCount[25]),
    .O(Mmux_USB_readmux_31_317)
  );
  MUXF5   Mmux_USB_readmux_2_f5 (
    .I0(Mmux_USB_readmux_4_324),
    .I1(Mmux_USB_readmux_3_316),
    .S(USB_readcnt[1]),
    .O(USB_readmux[0])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_USB_readmux_4 (
    .I0(USB_readcnt[0]),
    .I1(RxPacketCount[0]),
    .I2(RxPacketCount[8]),
    .O(Mmux_USB_readmux_4_324)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_USB_readmux_3 (
    .I0(USB_readcnt[0]),
    .I1(RxPacketCount[16]),
    .I2(RxPacketCount[24]),
    .O(Mmux_USB_readmux_3_316)
  );
  MUXCY   \Mcount_RxPacketCount_cy<0>  (
    .CI(N0),
    .DI(IPchecksum1),
    .S(Mcount_RxPacketCount_lut[0]),
    .O(Mcount_RxPacketCount_cy[0])
  );
  XORCY   \Mcount_RxPacketCount_xor<0>  (
    .CI(N0),
    .LI(Mcount_RxPacketCount_lut[0]),
    .O(Result[0])
  );
  MUXCY   \Mcount_RxPacketCount_cy<1>  (
    .CI(Mcount_RxPacketCount_cy[0]),
    .DI(N0),
    .S(\Mcount_RxPacketCount_cy<1>_rt_194 ),
    .O(Mcount_RxPacketCount_cy[1])
  );
  XORCY   \Mcount_RxPacketCount_xor<1>  (
    .CI(Mcount_RxPacketCount_cy[0]),
    .LI(\Mcount_RxPacketCount_cy<1>_rt_194 ),
    .O(Result[1])
  );
  MUXCY   \Mcount_RxPacketCount_cy<2>  (
    .CI(Mcount_RxPacketCount_cy[1]),
    .DI(N0),
    .S(\Mcount_RxPacketCount_cy<2>_rt_216 ),
    .O(Mcount_RxPacketCount_cy[2])
  );
  XORCY   \Mcount_RxPacketCount_xor<2>  (
    .CI(Mcount_RxPacketCount_cy[1]),
    .LI(\Mcount_RxPacketCount_cy<2>_rt_216 ),
    .O(Result[2])
  );
  MUXCY   \Mcount_RxPacketCount_cy<3>  (
    .CI(Mcount_RxPacketCount_cy[2]),
    .DI(N0),
    .S(\Mcount_RxPacketCount_cy<3>_rt_220 ),
    .O(Mcount_RxPacketCount_cy[3])
  );
  XORCY   \Mcount_RxPacketCount_xor<3>  (
    .CI(Mcount_RxPacketCount_cy[2]),
    .LI(\Mcount_RxPacketCount_cy<3>_rt_220 ),
    .O(Result[3])
  );
  MUXCY   \Mcount_RxPacketCount_cy<4>  (
    .CI(Mcount_RxPacketCount_cy[3]),
    .DI(N0),
    .S(\Mcount_RxPacketCount_cy<4>_rt_222 ),
    .O(Mcount_RxPacketCount_cy[4])
  );
  XORCY   \Mcount_RxPacketCount_xor<4>  (
    .CI(Mcount_RxPacketCount_cy[3]),
    .LI(\Mcount_RxPacketCount_cy<4>_rt_222 ),
    .O(Result[4])
  );
  MUXCY   \Mcount_RxPacketCount_cy<5>  (
    .CI(Mcount_RxPacketCount_cy[4]),
    .DI(N0),
    .S(\Mcount_RxPacketCount_cy<5>_rt_224 ),
    .O(Mcount_RxPacketCount_cy[5])
  );
  XORCY   \Mcount_RxPacketCount_xor<5>  (
    .CI(Mcount_RxPacketCount_cy[4]),
    .LI(\Mcount_RxPacketCount_cy<5>_rt_224 ),
    .O(Result[5])
  );
  MUXCY   \Mcount_RxPacketCount_cy<6>  (
    .CI(Mcount_RxPacketCount_cy[5]),
    .DI(N0),
    .S(\Mcount_RxPacketCount_cy<6>_rt_226 ),
    .O(Mcount_RxPacketCount_cy[6])
  );
  XORCY   \Mcount_RxPacketCount_xor<6>  (
    .CI(Mcount_RxPacketCount_cy[5]),
    .LI(\Mcount_RxPacketCount_cy<6>_rt_226 ),
    .O(Result[6])
  );
  MUXCY   \Mcount_RxPacketCount_cy<7>  (
    .CI(Mcount_RxPacketCount_cy[6]),
    .DI(N0),
    .S(\Mcount_RxPacketCount_cy<7>_rt_228 ),
    .O(Mcount_RxPacketCount_cy[7])
  );
  XORCY   \Mcount_RxPacketCount_xor<7>  (
    .CI(Mcount_RxPacketCount_cy[6]),
    .LI(\Mcount_RxPacketCount_cy<7>_rt_228 ),
    .O(Result[7])
  );
  MUXCY   \Mcount_RxPacketCount_cy<8>  (
    .CI(Mcount_RxPacketCount_cy[7]),
    .DI(N0),
    .S(\Mcount_RxPacketCount_cy<8>_rt_230 ),
    .O(Mcount_RxPacketCount_cy[8])
  );
  XORCY   \Mcount_RxPacketCount_xor<8>  (
    .CI(Mcount_RxPacketCount_cy[7]),
    .LI(\Mcount_RxPacketCount_cy<8>_rt_230 ),
    .O(Result[8])
  );
  MUXCY   \Mcount_RxPacketCount_cy<9>  (
    .CI(Mcount_RxPacketCount_cy[8]),
    .DI(N0),
    .S(\Mcount_RxPacketCount_cy<9>_rt_232 ),
    .O(Mcount_RxPacketCount_cy[9])
  );
  XORCY   \Mcount_RxPacketCount_xor<9>  (
    .CI(Mcount_RxPacketCount_cy[8]),
    .LI(\Mcount_RxPacketCount_cy<9>_rt_232 ),
    .O(Result[9])
  );
  MUXCY   \Mcount_RxPacketCount_cy<10>  (
    .CI(Mcount_RxPacketCount_cy[9]),
    .DI(N0),
    .S(\Mcount_RxPacketCount_cy<10>_rt_174 ),
    .O(Mcount_RxPacketCount_cy[10])
  );
  XORCY   \Mcount_RxPacketCount_xor<10>  (
    .CI(Mcount_RxPacketCount_cy[9]),
    .LI(\Mcount_RxPacketCount_cy<10>_rt_174 ),
    .O(Result[10])
  );
  MUXCY   \Mcount_RxPacketCount_cy<11>  (
    .CI(Mcount_RxPacketCount_cy[10]),
    .DI(N0),
    .S(\Mcount_RxPacketCount_cy<11>_rt_176 ),
    .O(Mcount_RxPacketCount_cy[11])
  );
  XORCY   \Mcount_RxPacketCount_xor<11>  (
    .CI(Mcount_RxPacketCount_cy[10]),
    .LI(\Mcount_RxPacketCount_cy<11>_rt_176 ),
    .O(Result[11])
  );
  MUXCY   \Mcount_RxPacketCount_cy<12>  (
    .CI(Mcount_RxPacketCount_cy[11]),
    .DI(N0),
    .S(\Mcount_RxPacketCount_cy<12>_rt_178 ),
    .O(Mcount_RxPacketCount_cy[12])
  );
  XORCY   \Mcount_RxPacketCount_xor<12>  (
    .CI(Mcount_RxPacketCount_cy[11]),
    .LI(\Mcount_RxPacketCount_cy<12>_rt_178 ),
    .O(Result[12])
  );
  MUXCY   \Mcount_RxPacketCount_cy<13>  (
    .CI(Mcount_RxPacketCount_cy[12]),
    .DI(N0),
    .S(\Mcount_RxPacketCount_cy<13>_rt_180 ),
    .O(Mcount_RxPacketCount_cy[13])
  );
  XORCY   \Mcount_RxPacketCount_xor<13>  (
    .CI(Mcount_RxPacketCount_cy[12]),
    .LI(\Mcount_RxPacketCount_cy<13>_rt_180 ),
    .O(Result[13])
  );
  MUXCY   \Mcount_RxPacketCount_cy<14>  (
    .CI(Mcount_RxPacketCount_cy[13]),
    .DI(N0),
    .S(\Mcount_RxPacketCount_cy<14>_rt_182 ),
    .O(Mcount_RxPacketCount_cy[14])
  );
  XORCY   \Mcount_RxPacketCount_xor<14>  (
    .CI(Mcount_RxPacketCount_cy[13]),
    .LI(\Mcount_RxPacketCount_cy<14>_rt_182 ),
    .O(Result[14])
  );
  MUXCY   \Mcount_RxPacketCount_cy<15>  (
    .CI(Mcount_RxPacketCount_cy[14]),
    .DI(N0),
    .S(\Mcount_RxPacketCount_cy<15>_rt_184 ),
    .O(Mcount_RxPacketCount_cy[15])
  );
  XORCY   \Mcount_RxPacketCount_xor<15>  (
    .CI(Mcount_RxPacketCount_cy[14]),
    .LI(\Mcount_RxPacketCount_cy<15>_rt_184 ),
    .O(Result[15])
  );
  MUXCY   \Mcount_RxPacketCount_cy<16>  (
    .CI(Mcount_RxPacketCount_cy[15]),
    .DI(N0),
    .S(\Mcount_RxPacketCount_cy<16>_rt_186 ),
    .O(Mcount_RxPacketCount_cy[16])
  );
  XORCY   \Mcount_RxPacketCount_xor<16>  (
    .CI(Mcount_RxPacketCount_cy[15]),
    .LI(\Mcount_RxPacketCount_cy<16>_rt_186 ),
    .O(Result[16])
  );
  MUXCY   \Mcount_RxPacketCount_cy<17>  (
    .CI(Mcount_RxPacketCount_cy[16]),
    .DI(N0),
    .S(\Mcount_RxPacketCount_cy<17>_rt_188 ),
    .O(Mcount_RxPacketCount_cy[17])
  );
  XORCY   \Mcount_RxPacketCount_xor<17>  (
    .CI(Mcount_RxPacketCount_cy[16]),
    .LI(\Mcount_RxPacketCount_cy<17>_rt_188 ),
    .O(Result[17])
  );
  MUXCY   \Mcount_RxPacketCount_cy<18>  (
    .CI(Mcount_RxPacketCount_cy[17]),
    .DI(N0),
    .S(\Mcount_RxPacketCount_cy<18>_rt_190 ),
    .O(Mcount_RxPacketCount_cy[18])
  );
  XORCY   \Mcount_RxPacketCount_xor<18>  (
    .CI(Mcount_RxPacketCount_cy[17]),
    .LI(\Mcount_RxPacketCount_cy<18>_rt_190 ),
    .O(Result[18])
  );
  MUXCY   \Mcount_RxPacketCount_cy<19>  (
    .CI(Mcount_RxPacketCount_cy[18]),
    .DI(N0),
    .S(\Mcount_RxPacketCount_cy<19>_rt_192 ),
    .O(Mcount_RxPacketCount_cy[19])
  );
  XORCY   \Mcount_RxPacketCount_xor<19>  (
    .CI(Mcount_RxPacketCount_cy[18]),
    .LI(\Mcount_RxPacketCount_cy<19>_rt_192 ),
    .O(Result[19])
  );
  MUXCY   \Mcount_RxPacketCount_cy<20>  (
    .CI(Mcount_RxPacketCount_cy[19]),
    .DI(N0),
    .S(\Mcount_RxPacketCount_cy<20>_rt_196 ),
    .O(Mcount_RxPacketCount_cy[20])
  );
  XORCY   \Mcount_RxPacketCount_xor<20>  (
    .CI(Mcount_RxPacketCount_cy[19]),
    .LI(\Mcount_RxPacketCount_cy<20>_rt_196 ),
    .O(Result[20])
  );
  MUXCY   \Mcount_RxPacketCount_cy<21>  (
    .CI(Mcount_RxPacketCount_cy[20]),
    .DI(N0),
    .S(\Mcount_RxPacketCount_cy<21>_rt_198 ),
    .O(Mcount_RxPacketCount_cy[21])
  );
  XORCY   \Mcount_RxPacketCount_xor<21>  (
    .CI(Mcount_RxPacketCount_cy[20]),
    .LI(\Mcount_RxPacketCount_cy<21>_rt_198 ),
    .O(Result[21])
  );
  MUXCY   \Mcount_RxPacketCount_cy<22>  (
    .CI(Mcount_RxPacketCount_cy[21]),
    .DI(N0),
    .S(\Mcount_RxPacketCount_cy<22>_rt_200 ),
    .O(Mcount_RxPacketCount_cy[22])
  );
  XORCY   \Mcount_RxPacketCount_xor<22>  (
    .CI(Mcount_RxPacketCount_cy[21]),
    .LI(\Mcount_RxPacketCount_cy<22>_rt_200 ),
    .O(Result[22])
  );
  MUXCY   \Mcount_RxPacketCount_cy<23>  (
    .CI(Mcount_RxPacketCount_cy[22]),
    .DI(N0),
    .S(\Mcount_RxPacketCount_cy<23>_rt_202 ),
    .O(Mcount_RxPacketCount_cy[23])
  );
  XORCY   \Mcount_RxPacketCount_xor<23>  (
    .CI(Mcount_RxPacketCount_cy[22]),
    .LI(\Mcount_RxPacketCount_cy<23>_rt_202 ),
    .O(Result[23])
  );
  MUXCY   \Mcount_RxPacketCount_cy<24>  (
    .CI(Mcount_RxPacketCount_cy[23]),
    .DI(N0),
    .S(\Mcount_RxPacketCount_cy<24>_rt_204 ),
    .O(Mcount_RxPacketCount_cy[24])
  );
  XORCY   \Mcount_RxPacketCount_xor<24>  (
    .CI(Mcount_RxPacketCount_cy[23]),
    .LI(\Mcount_RxPacketCount_cy<24>_rt_204 ),
    .O(Result[24])
  );
  MUXCY   \Mcount_RxPacketCount_cy<25>  (
    .CI(Mcount_RxPacketCount_cy[24]),
    .DI(N0),
    .S(\Mcount_RxPacketCount_cy<25>_rt_206 ),
    .O(Mcount_RxPacketCount_cy[25])
  );
  XORCY   \Mcount_RxPacketCount_xor<25>  (
    .CI(Mcount_RxPacketCount_cy[24]),
    .LI(\Mcount_RxPacketCount_cy<25>_rt_206 ),
    .O(Result[25])
  );
  MUXCY   \Mcount_RxPacketCount_cy<26>  (
    .CI(Mcount_RxPacketCount_cy[25]),
    .DI(N0),
    .S(\Mcount_RxPacketCount_cy<26>_rt_208 ),
    .O(Mcount_RxPacketCount_cy[26])
  );
  XORCY   \Mcount_RxPacketCount_xor<26>  (
    .CI(Mcount_RxPacketCount_cy[25]),
    .LI(\Mcount_RxPacketCount_cy<26>_rt_208 ),
    .O(Result[26])
  );
  MUXCY   \Mcount_RxPacketCount_cy<27>  (
    .CI(Mcount_RxPacketCount_cy[26]),
    .DI(N0),
    .S(\Mcount_RxPacketCount_cy<27>_rt_210 ),
    .O(Mcount_RxPacketCount_cy[27])
  );
  XORCY   \Mcount_RxPacketCount_xor<27>  (
    .CI(Mcount_RxPacketCount_cy[26]),
    .LI(\Mcount_RxPacketCount_cy<27>_rt_210 ),
    .O(Result[27])
  );
  MUXCY   \Mcount_RxPacketCount_cy<28>  (
    .CI(Mcount_RxPacketCount_cy[27]),
    .DI(N0),
    .S(\Mcount_RxPacketCount_cy<28>_rt_212 ),
    .O(Mcount_RxPacketCount_cy[28])
  );
  XORCY   \Mcount_RxPacketCount_xor<28>  (
    .CI(Mcount_RxPacketCount_cy[27]),
    .LI(\Mcount_RxPacketCount_cy<28>_rt_212 ),
    .O(Result[28])
  );
  MUXCY   \Mcount_RxPacketCount_cy<29>  (
    .CI(Mcount_RxPacketCount_cy[28]),
    .DI(N0),
    .S(\Mcount_RxPacketCount_cy<29>_rt_214 ),
    .O(Mcount_RxPacketCount_cy[29])
  );
  XORCY   \Mcount_RxPacketCount_xor<29>  (
    .CI(Mcount_RxPacketCount_cy[28]),
    .LI(\Mcount_RxPacketCount_cy<29>_rt_214 ),
    .O(Result[29])
  );
  MUXCY   \Mcount_RxPacketCount_cy<30>  (
    .CI(Mcount_RxPacketCount_cy[29]),
    .DI(N0),
    .S(\Mcount_RxPacketCount_cy<30>_rt_218 ),
    .O(Mcount_RxPacketCount_cy[30])
  );
  XORCY   \Mcount_RxPacketCount_xor<30>  (
    .CI(Mcount_RxPacketCount_cy[29]),
    .LI(\Mcount_RxPacketCount_cy<30>_rt_218 ),
    .O(Result[30])
  );
  XORCY   \Mcount_RxPacketCount_xor<31>  (
    .CI(Mcount_RxPacketCount_cy[30]),
    .LI(\Mcount_RxPacketCount_xor<31>_rt_234 ),
    .O(Result[31])
  );
  MUXCY   \Mcount_RxBitCount_cy<0>  (
    .CI(N0),
    .DI(IPchecksum1),
    .S(Mcount_RxBitCount_lut[0]),
    .O(Mcount_RxBitCount_cy[0])
  );
  XORCY   \Mcount_RxBitCount_xor<0>  (
    .CI(N0),
    .LI(Mcount_RxBitCount_lut[0]),
    .O(\Result<0>3 )
  );
  MUXCY   \Mcount_RxBitCount_cy<1>  (
    .CI(Mcount_RxBitCount_cy[0]),
    .DI(N0),
    .S(\Mcount_RxBitCount_cy<1>_rt_153 ),
    .O(Mcount_RxBitCount_cy[1])
  );
  XORCY   \Mcount_RxBitCount_xor<1>  (
    .CI(Mcount_RxBitCount_cy[0]),
    .LI(\Mcount_RxBitCount_cy<1>_rt_153 ),
    .O(\Result<1>3 )
  );
  MUXCY   \Mcount_RxBitCount_cy<2>  (
    .CI(Mcount_RxBitCount_cy[1]),
    .DI(N0),
    .S(\Mcount_RxBitCount_cy<2>_rt_155 ),
    .O(Mcount_RxBitCount_cy[2])
  );
  XORCY   \Mcount_RxBitCount_xor<2>  (
    .CI(Mcount_RxBitCount_cy[1]),
    .LI(\Mcount_RxBitCount_cy<2>_rt_155 ),
    .O(\Result<2>2 )
  );
  MUXCY   \Mcount_RxBitCount_cy<3>  (
    .CI(Mcount_RxBitCount_cy[2]),
    .DI(N0),
    .S(\Mcount_RxBitCount_cy<3>_rt_157 ),
    .O(Mcount_RxBitCount_cy[3])
  );
  XORCY   \Mcount_RxBitCount_xor<3>  (
    .CI(Mcount_RxBitCount_cy[2]),
    .LI(\Mcount_RxBitCount_cy<3>_rt_157 ),
    .O(\Result<3>2 )
  );
  MUXCY   \Mcount_RxBitCount_cy<4>  (
    .CI(Mcount_RxBitCount_cy[3]),
    .DI(N0),
    .S(\Mcount_RxBitCount_cy<4>_rt_159 ),
    .O(Mcount_RxBitCount_cy[4])
  );
  XORCY   \Mcount_RxBitCount_xor<4>  (
    .CI(Mcount_RxBitCount_cy[3]),
    .LI(\Mcount_RxBitCount_cy<4>_rt_159 ),
    .O(\Result<4>2 )
  );
  MUXCY   \Mcount_RxBitCount_cy<5>  (
    .CI(Mcount_RxBitCount_cy[4]),
    .DI(N0),
    .S(\Mcount_RxBitCount_cy<5>_rt_161 ),
    .O(Mcount_RxBitCount_cy[5])
  );
  XORCY   \Mcount_RxBitCount_xor<5>  (
    .CI(Mcount_RxBitCount_cy[4]),
    .LI(\Mcount_RxBitCount_cy<5>_rt_161 ),
    .O(\Result<5>1 )
  );
  MUXCY   \Mcount_RxBitCount_cy<6>  (
    .CI(Mcount_RxBitCount_cy[5]),
    .DI(N0),
    .S(\Mcount_RxBitCount_cy<6>_rt_163 ),
    .O(Mcount_RxBitCount_cy[6])
  );
  XORCY   \Mcount_RxBitCount_xor<6>  (
    .CI(Mcount_RxBitCount_cy[5]),
    .LI(\Mcount_RxBitCount_cy<6>_rt_163 ),
    .O(\Result<6>1 )
  );
  MUXCY   \Mcount_RxBitCount_cy<7>  (
    .CI(Mcount_RxBitCount_cy[6]),
    .DI(N0),
    .S(\Mcount_RxBitCount_cy<7>_rt_165 ),
    .O(Mcount_RxBitCount_cy[7])
  );
  XORCY   \Mcount_RxBitCount_xor<7>  (
    .CI(Mcount_RxBitCount_cy[6]),
    .LI(\Mcount_RxBitCount_cy<7>_rt_165 ),
    .O(\Result<7>1 )
  );
  MUXCY   \Mcount_RxBitCount_cy<8>  (
    .CI(Mcount_RxBitCount_cy[7]),
    .DI(N0),
    .S(\Mcount_RxBitCount_cy<8>_rt_167 ),
    .O(Mcount_RxBitCount_cy[8])
  );
  XORCY   \Mcount_RxBitCount_xor<8>  (
    .CI(Mcount_RxBitCount_cy[7]),
    .LI(\Mcount_RxBitCount_cy<8>_rt_167 ),
    .O(\Result<8>1 )
  );
  MUXCY   \Mcount_RxBitCount_cy<9>  (
    .CI(Mcount_RxBitCount_cy[8]),
    .DI(N0),
    .S(\Mcount_RxBitCount_cy<9>_rt_169 ),
    .O(Mcount_RxBitCount_cy[9])
  );
  XORCY   \Mcount_RxBitCount_xor<9>  (
    .CI(Mcount_RxBitCount_cy[8]),
    .LI(\Mcount_RxBitCount_cy<9>_rt_169 ),
    .O(\Result<9>1 )
  );
  MUXCY   \Mcount_RxBitCount_cy<10>  (
    .CI(Mcount_RxBitCount_cy[9]),
    .DI(N0),
    .S(\Mcount_RxBitCount_cy<10>_rt_147 ),
    .O(Mcount_RxBitCount_cy[10])
  );
  XORCY   \Mcount_RxBitCount_xor<10>  (
    .CI(Mcount_RxBitCount_cy[9]),
    .LI(\Mcount_RxBitCount_cy<10>_rt_147 ),
    .O(\Result<10>1 )
  );
  MUXCY   \Mcount_RxBitCount_cy<11>  (
    .CI(Mcount_RxBitCount_cy[10]),
    .DI(N0),
    .S(\Mcount_RxBitCount_cy<11>_rt_149 ),
    .O(Mcount_RxBitCount_cy[11])
  );
  XORCY   \Mcount_RxBitCount_xor<11>  (
    .CI(Mcount_RxBitCount_cy[10]),
    .LI(\Mcount_RxBitCount_cy<11>_rt_149 ),
    .O(\Result<11>1 )
  );
  MUXCY   \Mcount_RxBitCount_cy<12>  (
    .CI(Mcount_RxBitCount_cy[11]),
    .DI(N0),
    .S(\Mcount_RxBitCount_cy<12>_rt_151 ),
    .O(Mcount_RxBitCount_cy[12])
  );
  XORCY   \Mcount_RxBitCount_xor<12>  (
    .CI(Mcount_RxBitCount_cy[11]),
    .LI(\Mcount_RxBitCount_cy<12>_rt_151 ),
    .O(\Result<12>1 )
  );
  XORCY   \Mcount_RxBitCount_xor<13>  (
    .CI(Mcount_RxBitCount_cy[12]),
    .LI(\Mcount_RxBitCount_xor<13>_rt_171 ),
    .O(\Result<13>1 )
  );
  MUXCY   \Mcount_counter_cy<0>  (
    .CI(N0),
    .DI(IPchecksum1),
    .S(Mcount_counter_lut[0]),
    .O(Mcount_counter_cy[0])
  );
  XORCY   \Mcount_counter_xor<0>  (
    .CI(N0),
    .LI(Mcount_counter_lut[0]),
    .O(\Result<0>6 )
  );
  MUXCY   \Mcount_counter_cy<1>  (
    .CI(Mcount_counter_cy[0]),
    .DI(N0),
    .S(\Mcount_counter_cy<1>_rt_291 ),
    .O(Mcount_counter_cy[1])
  );
  XORCY   \Mcount_counter_xor<1>  (
    .CI(Mcount_counter_cy[0]),
    .LI(\Mcount_counter_cy<1>_rt_291 ),
    .O(\Result<1>6 )
  );
  MUXCY   \Mcount_counter_cy<2>  (
    .CI(Mcount_counter_cy[1]),
    .DI(N0),
    .S(\Mcount_counter_cy<2>_rt_299 ),
    .O(Mcount_counter_cy[2])
  );
  XORCY   \Mcount_counter_xor<2>  (
    .CI(Mcount_counter_cy[1]),
    .LI(\Mcount_counter_cy<2>_rt_299 ),
    .O(\Result<2>4 )
  );
  MUXCY   \Mcount_counter_cy<3>  (
    .CI(Mcount_counter_cy[2]),
    .DI(N0),
    .S(\Mcount_counter_cy<3>_rt_301 ),
    .O(Mcount_counter_cy[3])
  );
  XORCY   \Mcount_counter_xor<3>  (
    .CI(Mcount_counter_cy[2]),
    .LI(\Mcount_counter_cy<3>_rt_301 ),
    .O(\Result<3>3 )
  );
  MUXCY   \Mcount_counter_cy<4>  (
    .CI(Mcount_counter_cy[3]),
    .DI(N0),
    .S(\Mcount_counter_cy<4>_rt_303 ),
    .O(Mcount_counter_cy[4])
  );
  XORCY   \Mcount_counter_xor<4>  (
    .CI(Mcount_counter_cy[3]),
    .LI(\Mcount_counter_cy<4>_rt_303 ),
    .O(\Result<4>3 )
  );
  MUXCY   \Mcount_counter_cy<5>  (
    .CI(Mcount_counter_cy[4]),
    .DI(N0),
    .S(\Mcount_counter_cy<5>_rt_305 ),
    .O(Mcount_counter_cy[5])
  );
  XORCY   \Mcount_counter_xor<5>  (
    .CI(Mcount_counter_cy[4]),
    .LI(\Mcount_counter_cy<5>_rt_305 ),
    .O(\Result<5>2 )
  );
  MUXCY   \Mcount_counter_cy<6>  (
    .CI(Mcount_counter_cy[5]),
    .DI(N0),
    .S(\Mcount_counter_cy<6>_rt_307 ),
    .O(Mcount_counter_cy[6])
  );
  XORCY   \Mcount_counter_xor<6>  (
    .CI(Mcount_counter_cy[5]),
    .LI(\Mcount_counter_cy<6>_rt_307 ),
    .O(\Result<6>2 )
  );
  MUXCY   \Mcount_counter_cy<7>  (
    .CI(Mcount_counter_cy[6]),
    .DI(N0),
    .S(\Mcount_counter_cy<7>_rt_309 ),
    .O(Mcount_counter_cy[7])
  );
  XORCY   \Mcount_counter_xor<7>  (
    .CI(Mcount_counter_cy[6]),
    .LI(\Mcount_counter_cy<7>_rt_309 ),
    .O(\Result<7>2 )
  );
  MUXCY   \Mcount_counter_cy<8>  (
    .CI(Mcount_counter_cy[7]),
    .DI(N0),
    .S(\Mcount_counter_cy<8>_rt_311 ),
    .O(Mcount_counter_cy[8])
  );
  XORCY   \Mcount_counter_xor<8>  (
    .CI(Mcount_counter_cy[7]),
    .LI(\Mcount_counter_cy<8>_rt_311 ),
    .O(\Result<8>2 )
  );
  MUXCY   \Mcount_counter_cy<9>  (
    .CI(Mcount_counter_cy[8]),
    .DI(N0),
    .S(\Mcount_counter_cy<9>_rt_313 ),
    .O(Mcount_counter_cy[9])
  );
  XORCY   \Mcount_counter_xor<9>  (
    .CI(Mcount_counter_cy[8]),
    .LI(\Mcount_counter_cy<9>_rt_313 ),
    .O(\Result<9>2 )
  );
  MUXCY   \Mcount_counter_cy<10>  (
    .CI(Mcount_counter_cy[9]),
    .DI(N0),
    .S(\Mcount_counter_cy<10>_rt_271 ),
    .O(Mcount_counter_cy[10])
  );
  XORCY   \Mcount_counter_xor<10>  (
    .CI(Mcount_counter_cy[9]),
    .LI(\Mcount_counter_cy<10>_rt_271 ),
    .O(\Result<10>2 )
  );
  MUXCY   \Mcount_counter_cy<11>  (
    .CI(Mcount_counter_cy[10]),
    .DI(N0),
    .S(\Mcount_counter_cy<11>_rt_273 ),
    .O(Mcount_counter_cy[11])
  );
  XORCY   \Mcount_counter_xor<11>  (
    .CI(Mcount_counter_cy[10]),
    .LI(\Mcount_counter_cy<11>_rt_273 ),
    .O(\Result<11>2 )
  );
  MUXCY   \Mcount_counter_cy<12>  (
    .CI(Mcount_counter_cy[11]),
    .DI(N0),
    .S(\Mcount_counter_cy<12>_rt_275 ),
    .O(Mcount_counter_cy[12])
  );
  XORCY   \Mcount_counter_xor<12>  (
    .CI(Mcount_counter_cy[11]),
    .LI(\Mcount_counter_cy<12>_rt_275 ),
    .O(\Result<12>2 )
  );
  MUXCY   \Mcount_counter_cy<13>  (
    .CI(Mcount_counter_cy[12]),
    .DI(N0),
    .S(\Mcount_counter_cy<13>_rt_277 ),
    .O(Mcount_counter_cy[13])
  );
  XORCY   \Mcount_counter_xor<13>  (
    .CI(Mcount_counter_cy[12]),
    .LI(\Mcount_counter_cy<13>_rt_277 ),
    .O(\Result<13>2 )
  );
  MUXCY   \Mcount_counter_cy<14>  (
    .CI(Mcount_counter_cy[13]),
    .DI(N0),
    .S(\Mcount_counter_cy<14>_rt_279 ),
    .O(Mcount_counter_cy[14])
  );
  XORCY   \Mcount_counter_xor<14>  (
    .CI(Mcount_counter_cy[13]),
    .LI(\Mcount_counter_cy<14>_rt_279 ),
    .O(\Result<14>1 )
  );
  MUXCY   \Mcount_counter_cy<15>  (
    .CI(Mcount_counter_cy[14]),
    .DI(N0),
    .S(\Mcount_counter_cy<15>_rt_281 ),
    .O(Mcount_counter_cy[15])
  );
  XORCY   \Mcount_counter_xor<15>  (
    .CI(Mcount_counter_cy[14]),
    .LI(\Mcount_counter_cy<15>_rt_281 ),
    .O(\Result<15>1 )
  );
  MUXCY   \Mcount_counter_cy<16>  (
    .CI(Mcount_counter_cy[15]),
    .DI(N0),
    .S(\Mcount_counter_cy<16>_rt_283 ),
    .O(Mcount_counter_cy[16])
  );
  XORCY   \Mcount_counter_xor<16>  (
    .CI(Mcount_counter_cy[15]),
    .LI(\Mcount_counter_cy<16>_rt_283 ),
    .O(\Result<16>1 )
  );
  MUXCY   \Mcount_counter_cy<17>  (
    .CI(Mcount_counter_cy[16]),
    .DI(N0),
    .S(\Mcount_counter_cy<17>_rt_285 ),
    .O(Mcount_counter_cy[17])
  );
  XORCY   \Mcount_counter_xor<17>  (
    .CI(Mcount_counter_cy[16]),
    .LI(\Mcount_counter_cy<17>_rt_285 ),
    .O(\Result<17>1 )
  );
  MUXCY   \Mcount_counter_cy<18>  (
    .CI(Mcount_counter_cy[17]),
    .DI(N0),
    .S(\Mcount_counter_cy<18>_rt_287 ),
    .O(Mcount_counter_cy[18])
  );
  XORCY   \Mcount_counter_xor<18>  (
    .CI(Mcount_counter_cy[17]),
    .LI(\Mcount_counter_cy<18>_rt_287 ),
    .O(\Result<18>1 )
  );
  MUXCY   \Mcount_counter_cy<19>  (
    .CI(Mcount_counter_cy[18]),
    .DI(N0),
    .S(\Mcount_counter_cy<19>_rt_289 ),
    .O(Mcount_counter_cy[19])
  );
  XORCY   \Mcount_counter_xor<19>  (
    .CI(Mcount_counter_cy[18]),
    .LI(\Mcount_counter_cy<19>_rt_289 ),
    .O(\Result<19>1 )
  );
  MUXCY   \Mcount_counter_cy<20>  (
    .CI(Mcount_counter_cy[19]),
    .DI(N0),
    .S(\Mcount_counter_cy<20>_rt_293 ),
    .O(Mcount_counter_cy[20])
  );
  XORCY   \Mcount_counter_xor<20>  (
    .CI(Mcount_counter_cy[19]),
    .LI(\Mcount_counter_cy<20>_rt_293 ),
    .O(\Result<20>1 )
  );
  MUXCY   \Mcount_counter_cy<21>  (
    .CI(Mcount_counter_cy[20]),
    .DI(N0),
    .S(\Mcount_counter_cy<21>_rt_295 ),
    .O(Mcount_counter_cy[21])
  );
  XORCY   \Mcount_counter_xor<21>  (
    .CI(Mcount_counter_cy[20]),
    .LI(\Mcount_counter_cy<21>_rt_295 ),
    .O(\Result<21>1 )
  );
  MUXCY   \Mcount_counter_cy<22>  (
    .CI(Mcount_counter_cy[21]),
    .DI(N0),
    .S(\Mcount_counter_cy<22>_rt_297 ),
    .O(Mcount_counter_cy[22])
  );
  XORCY   \Mcount_counter_xor<22>  (
    .CI(Mcount_counter_cy[21]),
    .LI(\Mcount_counter_cy<22>_rt_297 ),
    .O(\Result<22>1 )
  );
  XORCY   \Mcount_counter_xor<23>  (
    .CI(Mcount_counter_cy[22]),
    .LI(\Mcount_counter_xor<23>_rt_315 ),
    .O(\Result<23>1 )
  );
  MUXCY   \Mcount_LinkPulseCount_cy<0>  (
    .CI(N0),
    .DI(IPchecksum1),
    .S(Mcount_LinkPulseCount_lut[0]),
    .O(Mcount_LinkPulseCount_cy[0])
  );
  XORCY   \Mcount_LinkPulseCount_xor<0>  (
    .CI(N0),
    .LI(Mcount_LinkPulseCount_lut[0]),
    .O(\Result<0>8 )
  );
  MUXCY   \Mcount_LinkPulseCount_cy<1>  (
    .CI(Mcount_LinkPulseCount_cy[0]),
    .DI(N0),
    .S(\Mcount_LinkPulseCount_cy<1>_rt_126 ),
    .O(Mcount_LinkPulseCount_cy[1])
  );
  XORCY   \Mcount_LinkPulseCount_xor<1>  (
    .CI(Mcount_LinkPulseCount_cy[0]),
    .LI(\Mcount_LinkPulseCount_cy<1>_rt_126 ),
    .O(\Result<1>8 )
  );
  MUXCY   \Mcount_LinkPulseCount_cy<2>  (
    .CI(Mcount_LinkPulseCount_cy[1]),
    .DI(N0),
    .S(\Mcount_LinkPulseCount_cy<2>_rt_128 ),
    .O(Mcount_LinkPulseCount_cy[2])
  );
  XORCY   \Mcount_LinkPulseCount_xor<2>  (
    .CI(Mcount_LinkPulseCount_cy[1]),
    .LI(\Mcount_LinkPulseCount_cy<2>_rt_128 ),
    .O(\Result<2>6 )
  );
  MUXCY   \Mcount_LinkPulseCount_cy<3>  (
    .CI(Mcount_LinkPulseCount_cy[2]),
    .DI(N0),
    .S(\Mcount_LinkPulseCount_cy<3>_rt_130 ),
    .O(Mcount_LinkPulseCount_cy[3])
  );
  XORCY   \Mcount_LinkPulseCount_xor<3>  (
    .CI(Mcount_LinkPulseCount_cy[2]),
    .LI(\Mcount_LinkPulseCount_cy<3>_rt_130 ),
    .O(\Result<3>5 )
  );
  MUXCY   \Mcount_LinkPulseCount_cy<4>  (
    .CI(Mcount_LinkPulseCount_cy[3]),
    .DI(N0),
    .S(\Mcount_LinkPulseCount_cy<4>_rt_132 ),
    .O(Mcount_LinkPulseCount_cy[4])
  );
  XORCY   \Mcount_LinkPulseCount_xor<4>  (
    .CI(Mcount_LinkPulseCount_cy[3]),
    .LI(\Mcount_LinkPulseCount_cy<4>_rt_132 ),
    .O(\Result<4>4 )
  );
  MUXCY   \Mcount_LinkPulseCount_cy<5>  (
    .CI(Mcount_LinkPulseCount_cy[4]),
    .DI(N0),
    .S(\Mcount_LinkPulseCount_cy<5>_rt_134 ),
    .O(Mcount_LinkPulseCount_cy[5])
  );
  XORCY   \Mcount_LinkPulseCount_xor<5>  (
    .CI(Mcount_LinkPulseCount_cy[4]),
    .LI(\Mcount_LinkPulseCount_cy<5>_rt_134 ),
    .O(\Result<5>3 )
  );
  MUXCY   \Mcount_LinkPulseCount_cy<6>  (
    .CI(Mcount_LinkPulseCount_cy[5]),
    .DI(N0),
    .S(\Mcount_LinkPulseCount_cy<6>_rt_136 ),
    .O(Mcount_LinkPulseCount_cy[6])
  );
  XORCY   \Mcount_LinkPulseCount_xor<6>  (
    .CI(Mcount_LinkPulseCount_cy[5]),
    .LI(\Mcount_LinkPulseCount_cy<6>_rt_136 ),
    .O(\Result<6>3 )
  );
  MUXCY   \Mcount_LinkPulseCount_cy<7>  (
    .CI(Mcount_LinkPulseCount_cy[6]),
    .DI(N0),
    .S(\Mcount_LinkPulseCount_cy<7>_rt_138 ),
    .O(Mcount_LinkPulseCount_cy[7])
  );
  XORCY   \Mcount_LinkPulseCount_xor<7>  (
    .CI(Mcount_LinkPulseCount_cy[6]),
    .LI(\Mcount_LinkPulseCount_cy<7>_rt_138 ),
    .O(\Result<7>3 )
  );
  MUXCY   \Mcount_LinkPulseCount_cy<8>  (
    .CI(Mcount_LinkPulseCount_cy[7]),
    .DI(N0),
    .S(\Mcount_LinkPulseCount_cy<8>_rt_140 ),
    .O(Mcount_LinkPulseCount_cy[8])
  );
  XORCY   \Mcount_LinkPulseCount_xor<8>  (
    .CI(Mcount_LinkPulseCount_cy[7]),
    .LI(\Mcount_LinkPulseCount_cy<8>_rt_140 ),
    .O(\Result<8>3 )
  );
  MUXCY   \Mcount_LinkPulseCount_cy<9>  (
    .CI(Mcount_LinkPulseCount_cy[8]),
    .DI(N0),
    .S(\Mcount_LinkPulseCount_cy<9>_rt_142 ),
    .O(Mcount_LinkPulseCount_cy[9])
  );
  XORCY   \Mcount_LinkPulseCount_xor<9>  (
    .CI(Mcount_LinkPulseCount_cy[8]),
    .LI(\Mcount_LinkPulseCount_cy<9>_rt_142 ),
    .O(\Result<9>3 )
  );
  MUXCY   \Mcount_LinkPulseCount_cy<10>  (
    .CI(Mcount_LinkPulseCount_cy[9]),
    .DI(N0),
    .S(\Mcount_LinkPulseCount_cy<10>_rt_114 ),
    .O(Mcount_LinkPulseCount_cy[10])
  );
  XORCY   \Mcount_LinkPulseCount_xor<10>  (
    .CI(Mcount_LinkPulseCount_cy[9]),
    .LI(\Mcount_LinkPulseCount_cy<10>_rt_114 ),
    .O(\Result<10>3 )
  );
  MUXCY   \Mcount_LinkPulseCount_cy<11>  (
    .CI(Mcount_LinkPulseCount_cy[10]),
    .DI(N0),
    .S(\Mcount_LinkPulseCount_cy<11>_rt_116 ),
    .O(Mcount_LinkPulseCount_cy[11])
  );
  XORCY   \Mcount_LinkPulseCount_xor<11>  (
    .CI(Mcount_LinkPulseCount_cy[10]),
    .LI(\Mcount_LinkPulseCount_cy<11>_rt_116 ),
    .O(\Result<11>3 )
  );
  MUXCY   \Mcount_LinkPulseCount_cy<12>  (
    .CI(Mcount_LinkPulseCount_cy[11]),
    .DI(N0),
    .S(\Mcount_LinkPulseCount_cy<12>_rt_118 ),
    .O(Mcount_LinkPulseCount_cy[12])
  );
  XORCY   \Mcount_LinkPulseCount_xor<12>  (
    .CI(Mcount_LinkPulseCount_cy[11]),
    .LI(\Mcount_LinkPulseCount_cy<12>_rt_118 ),
    .O(\Result<12>3 )
  );
  MUXCY   \Mcount_LinkPulseCount_cy<13>  (
    .CI(Mcount_LinkPulseCount_cy[12]),
    .DI(N0),
    .S(\Mcount_LinkPulseCount_cy<13>_rt_120 ),
    .O(Mcount_LinkPulseCount_cy[13])
  );
  XORCY   \Mcount_LinkPulseCount_xor<13>  (
    .CI(Mcount_LinkPulseCount_cy[12]),
    .LI(\Mcount_LinkPulseCount_cy<13>_rt_120 ),
    .O(\Result<13>3 )
  );
  MUXCY   \Mcount_LinkPulseCount_cy<14>  (
    .CI(Mcount_LinkPulseCount_cy[13]),
    .DI(N0),
    .S(\Mcount_LinkPulseCount_cy<14>_rt_122 ),
    .O(Mcount_LinkPulseCount_cy[14])
  );
  XORCY   \Mcount_LinkPulseCount_xor<14>  (
    .CI(Mcount_LinkPulseCount_cy[13]),
    .LI(\Mcount_LinkPulseCount_cy<14>_rt_122 ),
    .O(\Result<14>2 )
  );
  MUXCY   \Mcount_LinkPulseCount_cy<15>  (
    .CI(Mcount_LinkPulseCount_cy[14]),
    .DI(N0),
    .S(\Mcount_LinkPulseCount_cy<15>_rt_124 ),
    .O(Mcount_LinkPulseCount_cy[15])
  );
  XORCY   \Mcount_LinkPulseCount_xor<15>  (
    .CI(Mcount_LinkPulseCount_cy[14]),
    .LI(\Mcount_LinkPulseCount_cy<15>_rt_124 ),
    .O(\Result<15>2 )
  );
  XORCY   \Mcount_LinkPulseCount_xor<16>  (
    .CI(Mcount_LinkPulseCount_cy[15]),
    .LI(\Mcount_LinkPulseCount_xor<16>_rt_144 ),
    .O(\Result<16>2 )
  );
  BUFG   BUFG_clkTx (
    .I(clk20_836),
    .O(clkTx)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \StartSending_and0000_wg_lut<0>  (
    .I0(counter[15]),
    .I1(counter[17]),
    .I2(counter[19]),
    .I3(counter[16]),
    .O(StartSending_and0000_wg_lut[0])
  );
  MUXCY   \StartSending_and0000_wg_cy<0>  (
    .CI(IPchecksum1),
    .DI(N0),
    .S(StartSending_and0000_wg_lut[0]),
    .O(StartSending_and0000_wg_cy[0])
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \StartSending_and0000_wg_lut<1>  (
    .I0(counter[12]),
    .I1(counter[14]),
    .I2(counter[20]),
    .I3(counter[13]),
    .O(StartSending_and0000_wg_lut[1])
  );
  MUXCY   \StartSending_and0000_wg_cy<1>  (
    .CI(StartSending_and0000_wg_cy[0]),
    .DI(N0),
    .S(StartSending_and0000_wg_lut[1]),
    .O(StartSending_and0000_wg_cy[1])
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \StartSending_and0000_wg_lut<2>  (
    .I0(counter[9]),
    .I1(counter[11]),
    .I2(counter[18]),
    .I3(counter[10]),
    .O(StartSending_and0000_wg_lut[2])
  );
  MUXCY   \StartSending_and0000_wg_cy<2>  (
    .CI(StartSending_and0000_wg_cy[1]),
    .DI(N0),
    .S(StartSending_and0000_wg_lut[2]),
    .O(StartSending_and0000_wg_cy[2])
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \StartSending_and0000_wg_lut<3>  (
    .I0(counter[6]),
    .I1(counter[8]),
    .I2(counter[22]),
    .I3(counter[7]),
    .O(StartSending_and0000_wg_lut[3])
  );
  MUXCY   \StartSending_and0000_wg_cy<3>  (
    .CI(StartSending_and0000_wg_cy[2]),
    .DI(N0),
    .S(StartSending_and0000_wg_lut[3]),
    .O(StartSending_and0000_wg_cy[3])
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \StartSending_and0000_wg_lut<4>  (
    .I0(counter[3]),
    .I1(counter[5]),
    .I2(counter[23]),
    .I3(counter[4]),
    .O(StartSending_and0000_wg_lut[4])
  );
  MUXCY   \StartSending_and0000_wg_cy<4>  (
    .CI(StartSending_and0000_wg_cy[3]),
    .DI(N0),
    .S(StartSending_and0000_wg_lut[4]),
    .O(StartSending_and0000_wg_cy[4])
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \StartSending_and0000_wg_lut<5>  (
    .I0(counter[0]),
    .I1(counter[2]),
    .I2(counter[21]),
    .I3(counter[1]),
    .O(StartSending_and0000_wg_lut[5])
  );
  MUXCY   \StartSending_and0000_wg_cy<5>  (
    .CI(StartSending_and0000_wg_cy[4]),
    .DI(N0),
    .S(StartSending_and0000_wg_lut[5]),
    .O(StartSending_and0000)
  );
  LUT4 #(
    .INIT ( 16'h0200 ))
  \RxCRC_OK_cmp_eq0000_wg_lut<0>  (
    .I0(RxCRC[8]),
    .I1(RxCRC[9]),
    .I2(RxCRC[7]),
    .I3(RxCRC[10]),
    .O(RxCRC_OK_cmp_eq0000_wg_lut[0])
  );
  MUXCY   \RxCRC_OK_cmp_eq0000_wg_cy<0>  (
    .CI(IPchecksum1),
    .DI(N0),
    .S(RxCRC_OK_cmp_eq0000_wg_lut[0]),
    .O(RxCRC_OK_cmp_eq0000_wg_cy[0])
  );
  LUT4 #(
    .INIT ( 16'h0080 ))
  \RxCRC_OK_cmp_eq0000_wg_lut<1>  (
    .I0(RxCRC[11]),
    .I1(RxCRC[12]),
    .I2(RxCRC[6]),
    .I3(RxCRC[13]),
    .O(RxCRC_OK_cmp_eq0000_wg_lut[1])
  );
  MUXCY   \RxCRC_OK_cmp_eq0000_wg_cy<1>  (
    .CI(RxCRC_OK_cmp_eq0000_wg_cy[0]),
    .DI(N0),
    .S(RxCRC_OK_cmp_eq0000_wg_lut[1]),
    .O(RxCRC_OK_cmp_eq0000_wg_cy[1])
  );
  LUT4 #(
    .INIT ( 16'h0080 ))
  \RxCRC_OK_cmp_eq0000_wg_lut<2>  (
    .I0(RxCRC[14]),
    .I1(RxCRC[15]),
    .I2(RxCRC[5]),
    .I3(RxCRC[16]),
    .O(RxCRC_OK_cmp_eq0000_wg_lut[2])
  );
  MUXCY   \RxCRC_OK_cmp_eq0000_wg_cy<2>  (
    .CI(RxCRC_OK_cmp_eq0000_wg_cy[1]),
    .DI(N0),
    .S(RxCRC_OK_cmp_eq0000_wg_lut[2]),
    .O(RxCRC_OK_cmp_eq0000_wg_cy[2])
  );
  LUT4 #(
    .INIT ( 16'h0200 ))
  \RxCRC_OK_cmp_eq0000_wg_lut<3>  (
    .I0(RxCRC[4]),
    .I1(RxCRC[17]),
    .I2(RxCRC[19]),
    .I3(RxCRC[18]),
    .O(RxCRC_OK_cmp_eq0000_wg_lut[3])
  );
  MUXCY   \RxCRC_OK_cmp_eq0000_wg_cy<3>  (
    .CI(RxCRC_OK_cmp_eq0000_wg_cy[2]),
    .DI(N0),
    .S(RxCRC_OK_cmp_eq0000_wg_lut[3]),
    .O(RxCRC_OK_cmp_eq0000_wg_cy[3])
  );
  LUT4 #(
    .INIT ( 16'h0010 ))
  \RxCRC_OK_cmp_eq0000_wg_lut<4>  (
    .I0(RxCRC[20]),
    .I1(RxCRC[21]),
    .I2(RxCRC[3]),
    .I3(RxCRC[22]),
    .O(RxCRC_OK_cmp_eq0000_wg_lut[4])
  );
  MUXCY   \RxCRC_OK_cmp_eq0000_wg_cy<4>  (
    .CI(RxCRC_OK_cmp_eq0000_wg_cy[3]),
    .DI(N0),
    .S(RxCRC_OK_cmp_eq0000_wg_lut[4]),
    .O(RxCRC_OK_cmp_eq0000_wg_cy[4])
  );
  LUT4 #(
    .INIT ( 16'h0200 ))
  \RxCRC_OK_cmp_eq0000_wg_lut<5>  (
    .I0(RxCRC[24]),
    .I1(RxCRC[23]),
    .I2(RxCRC[2]),
    .I3(RxCRC[25]),
    .O(RxCRC_OK_cmp_eq0000_wg_lut[5])
  );
  MUXCY   \RxCRC_OK_cmp_eq0000_wg_cy<5>  (
    .CI(RxCRC_OK_cmp_eq0000_wg_cy[4]),
    .DI(N0),
    .S(RxCRC_OK_cmp_eq0000_wg_lut[5]),
    .O(RxCRC_OK_cmp_eq0000_wg_cy[5])
  );
  LUT4 #(
    .INIT ( 16'h0200 ))
  \RxCRC_OK_cmp_eq0000_wg_lut<6>  (
    .I0(RxCRC[1]),
    .I1(RxCRC[27]),
    .I2(RxCRC[28]),
    .I3(RxCRC[26]),
    .O(RxCRC_OK_cmp_eq0000_wg_lut[6])
  );
  MUXCY   \RxCRC_OK_cmp_eq0000_wg_cy<6>  (
    .CI(RxCRC_OK_cmp_eq0000_wg_cy[5]),
    .DI(N0),
    .S(RxCRC_OK_cmp_eq0000_wg_lut[6]),
    .O(RxCRC_OK_cmp_eq0000_wg_cy[6])
  );
  LUT4 #(
    .INIT ( 16'h0080 ))
  \RxCRC_OK_cmp_eq0000_wg_lut<7>  (
    .I0(RxCRC[31]),
    .I1(RxCRC[30]),
    .I2(RxCRC[0]),
    .I3(RxCRC[29]),
    .O(RxCRC_OK_cmp_eq0000_wg_lut[7])
  );
  MUXCY   \RxCRC_OK_cmp_eq0000_wg_cy<7>  (
    .CI(RxCRC_OK_cmp_eq0000_wg_cy[6]),
    .DI(N0),
    .S(RxCRC_OK_cmp_eq0000_wg_lut[7]),
    .O(RxCRC_OK_cmp_eq0000)
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \CRC_mux0000<7>1  (
    .I0(CRCinit_71),
    .I1(CRC[23]),
    .O(CRC_mux0000[7])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \CRC_mux0000<6>1  (
    .I0(CRCinit_71),
    .I1(CRC[24]),
    .O(CRC_mux0000[6])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \CRC_mux0000<4>1  (
    .I0(CRCinit_71),
    .I1(CRC[26]),
    .O(CRC_mux0000[4])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \CRC_mux0000<3>1  (
    .I0(CRCinit_71),
    .I1(CRC[27]),
    .O(CRC_mux0000[3])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \CRC_mux0000<2>1  (
    .I0(CRCinit_71),
    .I1(CRC[28]),
    .O(CRC_mux0000[2])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \CRC_mux0000<28>1  (
    .I0(CRCinit_71),
    .I1(CRC[2]),
    .O(CRC_mux0000[28])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \CRC_mux0000<25>1  (
    .I0(CRCinit_71),
    .I1(CRC[5]),
    .O(CRC_mux0000[25])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \CRC_mux0000<22>1  (
    .I0(CRCinit_71),
    .I1(CRC[8]),
    .O(CRC_mux0000[22])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \CRC_mux0000<1>1  (
    .I0(CRCinit_71),
    .I1(CRC[29]),
    .O(CRC_mux0000[1])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \CRC_mux0000<18>1  (
    .I0(CRCinit_71),
    .I1(CRC[12]),
    .O(CRC_mux0000[18])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \CRC_mux0000<17>1  (
    .I0(CRCinit_71),
    .I1(CRC[13]),
    .O(CRC_mux0000[17])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \CRC_mux0000<16>1  (
    .I0(CRCinit_71),
    .I1(CRC[14]),
    .O(CRC_mux0000[16])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \CRC_mux0000<14>1  (
    .I0(CRCinit_71),
    .I1(CRC[16]),
    .O(CRC_mux0000[14])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \CRC_mux0000<13>1  (
    .I0(CRCinit_71),
    .I1(CRC[17]),
    .O(CRC_mux0000[13])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \CRC_mux0000<12>1  (
    .I0(CRCinit_71),
    .I1(CRC[18]),
    .O(CRC_mux0000[12])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \CRC_mux0000<11>1  (
    .I0(CRCinit_71),
    .I1(CRC[19]),
    .O(CRC_mux0000[11])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \CRC_mux0000<10>1  (
    .I0(CRCinit_71),
    .I1(CRC[20]),
    .O(CRC_mux0000[10])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \CRC_mux0000<0>1  (
    .I0(CRCinit_71),
    .I1(CRC[30]),
    .O(CRC_mux0000[0])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  Mxor_RxDataPolarity_xor0000_Result1 (
    .I0(RxDataByteIn[1]),
    .I1(RxDataPolarity_647),
    .O(RxDataPolarity_xor0000)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Mcount_idlecount_xor<1>11  (
    .I0(idlecount[1]),
    .I1(idlecount[0]),
    .O(\Result<1>9 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Mcount_USB_readcnt_xor<1>11  (
    .I0(USB_readcnt[1]),
    .I1(USB_readcnt[0]),
    .O(\Result<1>5 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Mcount_ShiftCount_xor<1>11  (
    .I0(ShiftCount[1]),
    .I1(ShiftCount[0]),
    .O(\Result<1>7 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Mcount_RxTransitionTimeout_xor<1>11  (
    .I0(RxTransitionTimeout[1]),
    .I1(RxTransitionTimeout[0]),
    .O(\Result<1>4 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Mcount_RxPreambleBitsCount_xor<1>11  (
    .I0(RxPreambleBitsCount[1]),
    .I1(RxPreambleBitsCount[0]),
    .O(\Result<1>2 )
  );
  LUT3 #(
    .INIT ( 8'h6C ))
  \Mcount_idlecount_xor<2>11  (
    .I0(idlecount[0]),
    .I1(idlecount[2]),
    .I2(idlecount[1]),
    .O(\Result<2>7 )
  );
  LUT3 #(
    .INIT ( 8'h6C ))
  \Mcount_ShiftCount_xor<2>11  (
    .I0(ShiftCount[0]),
    .I1(ShiftCount[2]),
    .I2(ShiftCount[1]),
    .O(\Result<2>5 )
  );
  LUT3 #(
    .INIT ( 8'h6C ))
  \Mcount_RxTransitionTimeout_xor<2>11  (
    .I0(RxTransitionTimeout[0]),
    .I1(RxTransitionTimeout[2]),
    .I2(RxTransitionTimeout[1]),
    .O(\Result<2>3 )
  );
  LUT3 #(
    .INIT ( 8'h6C ))
  \Mcount_RxPreambleBitsCount_xor<2>11  (
    .I0(RxPreambleBitsCount[0]),
    .I1(RxPreambleBitsCount[2]),
    .I2(RxPreambleBitsCount[1]),
    .O(\Result<2>1 )
  );
  LUT4 #(
    .INIT ( 16'h6CCC ))
  \Mcount_ShiftCount_xor<3>11  (
    .I0(ShiftCount[2]),
    .I1(ShiftCount[3]),
    .I2(ShiftCount[1]),
    .I3(ShiftCount[0]),
    .O(\Result<3>4 )
  );
  LUT4 #(
    .INIT ( 16'h65A9 ))
  Mxor_qo_xor0000_Result1 (
    .I0(ShiftCount[0]),
    .I1(CRCflush_68),
    .I2(ShiftData[0]),
    .I3(CRC[31]),
    .O(qo_xor0000)
  );
  LUT2 #(
    .INIT ( 4'h7 ))
  RxTransitionCount_cmp_eq0000_inv1 (
    .I0(RxTransitionCount[1]),
    .I1(RxTransitionCount[0]),
    .O(RxTransitionCount_cmp_eq0000_inv)
  );
  LUT3 #(
    .INIT ( 8'h7F ))
  idlecount_and0000_inv1 (
    .I0(idlecount[0]),
    .I1(idlecount[1]),
    .I2(idlecount[2]),
    .O(idlecount_and0000_inv)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \ShiftData_mux0000<7>1  (
    .I0(readram),
    .I1(pkt_data[7]),
    .O(ShiftData_mux0000[7])
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  Rx_end_of_Ethernet_frame1 (
    .I0(RxTransitionTimeout[0]),
    .I1(RxTransitionTimeout[1]),
    .I2(RxTransitionTimeout[2]),
    .O(Rx_end_of_Ethernet_frame)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \ShiftData_mux0000<6>1  (
    .I0(readram),
    .I1(ShiftData[7]),
    .I2(pkt_data[6]),
    .O(ShiftData_mux0000[6])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \ShiftData_mux0000<5>1  (
    .I0(readram),
    .I1(ShiftData[6]),
    .I2(pkt_data[5]),
    .O(ShiftData_mux0000[5])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \ShiftData_mux0000<4>1  (
    .I0(readram),
    .I1(ShiftData[5]),
    .I2(pkt_data[4]),
    .O(ShiftData_mux0000[4])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \ShiftData_mux0000<3>1  (
    .I0(readram),
    .I1(ShiftData[4]),
    .I2(pkt_data[3]),
    .O(ShiftData_mux0000[3])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \ShiftData_mux0000<2>1  (
    .I0(readram),
    .I1(ShiftData[3]),
    .I2(pkt_data[2]),
    .O(ShiftData_mux0000[2])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \ShiftData_mux0000<1>1  (
    .I0(readram),
    .I1(ShiftData[2]),
    .I2(pkt_data[1]),
    .O(ShiftData_mux0000[1])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \ShiftData_mux0000<0>1  (
    .I0(readram),
    .I1(ShiftData[1]),
    .I2(pkt_data[0]),
    .O(ShiftData_mux0000[0])
  );
  LUT3 #(
    .INIT ( 8'h14 ))
  CRCinput1 (
    .I0(CRCflush_68),
    .I1(CRC[31]),
    .I2(ShiftData[0]),
    .O(CRCinput)
  );
  LUT3 #(
    .INIT ( 8'hBE ))
  \CRC_mux0000<9>1  (
    .I0(CRCinit_71),
    .I1(CRCinput),
    .I2(CRC[21]),
    .O(CRC_mux0000[9])
  );
  LUT3 #(
    .INIT ( 8'hBE ))
  \CRC_mux0000<8>1  (
    .I0(CRCinit_71),
    .I1(CRCinput),
    .I2(CRC[22]),
    .O(CRC_mux0000[8])
  );
  LUT3 #(
    .INIT ( 8'hBE ))
  \CRC_mux0000<5>1  (
    .I0(CRCinit_71),
    .I1(CRCinput),
    .I2(CRC[25]),
    .O(CRC_mux0000[5])
  );
  LUT3 #(
    .INIT ( 8'hBE ))
  \CRC_mux0000<30>1  (
    .I0(CRCinit_71),
    .I1(CRCinput),
    .I2(CRC[0]),
    .O(CRC_mux0000[30])
  );
  LUT3 #(
    .INIT ( 8'hBE ))
  \CRC_mux0000<29>1  (
    .I0(CRCinit_71),
    .I1(CRCinput),
    .I2(CRC[1]),
    .O(CRC_mux0000[29])
  );
  LUT3 #(
    .INIT ( 8'hBE ))
  \CRC_mux0000<27>1  (
    .I0(CRCinit_71),
    .I1(CRCinput),
    .I2(CRC[3]),
    .O(CRC_mux0000[27])
  );
  LUT3 #(
    .INIT ( 8'hBE ))
  \CRC_mux0000<26>1  (
    .I0(CRCinit_71),
    .I1(CRCinput),
    .I2(CRC[4]),
    .O(CRC_mux0000[26])
  );
  LUT3 #(
    .INIT ( 8'hBE ))
  \CRC_mux0000<24>1  (
    .I0(CRCinit_71),
    .I1(CRCinput),
    .I2(CRC[6]),
    .O(CRC_mux0000[24])
  );
  LUT3 #(
    .INIT ( 8'hBE ))
  \CRC_mux0000<23>1  (
    .I0(CRCinit_71),
    .I1(CRCinput),
    .I2(CRC[7]),
    .O(CRC_mux0000[23])
  );
  LUT3 #(
    .INIT ( 8'hBE ))
  \CRC_mux0000<21>1  (
    .I0(CRCinit_71),
    .I1(CRCinput),
    .I2(CRC[9]),
    .O(CRC_mux0000[21])
  );
  LUT3 #(
    .INIT ( 8'hBE ))
  \CRC_mux0000<20>1  (
    .I0(CRCinit_71),
    .I1(CRCinput),
    .I2(CRC[10]),
    .O(CRC_mux0000[20])
  );
  LUT3 #(
    .INIT ( 8'hBE ))
  \CRC_mux0000<19>1  (
    .I0(CRCinit_71),
    .I1(CRCinput),
    .I2(CRC[11]),
    .O(CRC_mux0000[19])
  );
  LUT3 #(
    .INIT ( 8'hBE ))
  \CRC_mux0000<15>1  (
    .I0(CRCinit_71),
    .I1(CRCinput),
    .I2(CRC[15]),
    .O(CRC_mux0000[15])
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  RxPacketReceivedOK_and000013 (
    .I0(Rx_end_of_Ethernet_frame),
    .I1(RxGoodPacket_652),
    .I2(RxCRC_OK_589),
    .I3(RxFrame_649),
    .O(RxPacketReceivedOK_and000013_728)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  RxPacketReceivedOK_and000014 (
    .I0(RxPacketReceivedOK_and00006),
    .I1(RxPacketReceivedOK_and000013_728),
    .O(RxPacketReceivedOK_and0000)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  LinkPulse_and00004 (
    .I0(LinkPulseCount[9]),
    .I1(LinkPulseCount[10]),
    .I2(LinkPulseCount[11]),
    .I3(LinkPulseCount[12]),
    .O(LinkPulse_and00004_109)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  LinkPulse_and00009 (
    .I0(LinkPulseCount[13]),
    .I1(LinkPulseCount[14]),
    .I2(LinkPulseCount[15]),
    .I3(LinkPulseCount[16]),
    .O(LinkPulse_and00009_110)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  LinkPulse_and000021 (
    .I0(LinkPulseCount[1]),
    .I1(LinkPulseCount[2]),
    .I2(LinkPulseCount[3]),
    .I3(LinkPulseCount[4]),
    .O(LinkPulse_and000021_107)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  LinkPulse_and000026 (
    .I0(LinkPulseCount[5]),
    .I1(LinkPulseCount[6]),
    .I2(LinkPulseCount[7]),
    .I3(LinkPulseCount[8]),
    .O(LinkPulse_and000026_108)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  LinkPulse_and000036 (
    .I0(LinkPulse_and00004_109),
    .I1(LinkPulse_and00009_110),
    .I2(LinkPulse_and000021_107),
    .I3(LinkPulse_and000026_108),
    .O(LinkPulse_and0000)
  );
  LUT2 #(
    .INIT ( 4'hE ))
  CRCflush_not00011 (
    .I0(readram),
    .I1(CRCflush_68),
    .O(CRCflush_not0001)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  readram1 (
    .I0(ShiftCount[1]),
    .I1(ShiftCount[0]),
    .I2(ShiftCount[3]),
    .I3(ShiftCount[2]),
    .O(readram)
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  RxPreambleBitsCount_not0001_SW0 (
    .I0(RxPreambleBitsCount[3]),
    .I1(RxPreambleBitsCount[2]),
    .I2(RxPreambleBitsCount[1]),
    .O(N61)
  );
  LUT4 #(
    .INIT ( 16'h2AAA ))
  RxPreambleBitsCount_not0001 (
    .I0(RxNewBitAvailable_692),
    .I1(RxPreambleBitsCount[0]),
    .I2(RxPreambleBitsCount[4]),
    .I3(N61),
    .O(RxPreambleBitsCount_not0001_736)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  SendingPacket_and000025 (
    .I0(N52),
    .I1(N38),
    .I2(SendingPacket_and00009_759),
    .I3(SendingPacket_and000014_758),
    .O(SendingPacket_and0000)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  RxPreambleBitsCount_or00007 (
    .I0(RxDataByteIn[0]),
    .I1(RxDataByteIn[2]),
    .I2(RxDataByteIn[1]),
    .O(RxPreambleBitsCount_or00007_742)
  );
  LUT4 #(
    .INIT ( 16'h22F2 ))
  RxPreambleBitsCount_or000018 (
    .I0(RxDataByteIn[4]),
    .I1(RxDataByteIn[2]),
    .I2(RxDataByteIn[3]),
    .I3(RxDataByteIn[1]),
    .O(RxPreambleBitsCount_or000018_738)
  );
  LUT4 #(
    .INIT ( 16'h22F2 ))
  RxPreambleBitsCount_or000039 (
    .I0(RxDataByteIn[6]),
    .I1(RxDataByteIn[4]),
    .I2(RxDataByteIn[5]),
    .I3(RxDataByteIn[3]),
    .O(RxPreambleBitsCount_or000039_739)
  );
  LUT3 #(
    .INIT ( 8'h1B ))
  RxPreambleBitsCount_or000051 (
    .I0(RxDataByteIn[7]),
    .I1(RxDataByteIn[6]),
    .I2(RxDataByteIn[5]),
    .O(RxPreambleBitsCount_or000051_740)
  );
  LUT3 #(
    .INIT ( 8'hEA ))
  RxPreambleBitsCount_or000091 (
    .I0(Rx_end_of_Ethernet_frame),
    .I1(RxNewBitAvailable_692),
    .I2(RxPreambleBitsCount_or000065_741),
    .O(RxPreambleBitsCount_or0000)
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  RxLED_2_and00001 (
    .I0(N241),
    .I1(RxBitCount[1]),
    .I2(RxBitCount[0]),
    .O(RxLED_2_and0000)
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  RxLED_1_and00001 (
    .I0(RxBitCount[0]),
    .I1(N9),
    .I2(RxBitCount[1]),
    .O(RxLED_1_and0000)
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  RxLED_0_and00002 (
    .I0(N9),
    .I1(RxBitCount[1]),
    .I2(RxBitCount[0]),
    .O(RxLED_0_and0000)
  );
  LUT4 #(
    .INIT ( 16'h0080 ))
  RxLED_0_and000017 (
    .I0(RxNewBitAvailable_692),
    .I1(RxBitCount[8]),
    .I2(RxBitCount[6]),
    .I3(RxBitCount[7]),
    .O(RxLED_0_and000017_687)
  );
  LUT4 #(
    .INIT ( 16'h0010 ))
  RxLED_0_and0000119 (
    .I0(RxBitCount[5]),
    .I1(RxBitCount[3]),
    .I2(RxBitCount[4]),
    .I3(RxBitCount[2]),
    .O(RxLED_0_and0000119_686)
  );
  LUT3 #(
    .INIT ( 8'h01 ))
  \pkt_data_mux0000<5>21  (
    .I0(TxAddress[3]),
    .I1(TxAddress[0]),
    .I2(TxAddress[4]),
    .O(N38)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  Mxor_RxInSRp_xor0000_Result1 (
    .I0(RxDataPolarity_647),
    .I1(Ethernet_RDp_IBUF_75),
    .O(RxInSRp_xor0000)
  );
  LUT4 #(
    .INIT ( 16'h5514 ))
  \Maccum_RxTransitionCount_xor<1>11  (
    .I0(RxTransitionCount[1]),
    .I1(\RxInSRn[2] ),
    .I2(RxInSRp[2]),
    .I3(RxTransitionCount[0]),
    .O(\Result<1>1 )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  pkt_data_or000721 (
    .I0(TxAddress[1]),
    .I1(TxAddress[2]),
    .O(N17)
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \RxCRC_mux0000<7>1  (
    .I0(Rx_SFDdetected),
    .I1(RxCRC[23]),
    .O(RxCRC_mux0000[7])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \RxCRC_mux0000<6>1  (
    .I0(Rx_SFDdetected),
    .I1(RxCRC[24]),
    .O(RxCRC_mux0000[6])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \RxCRC_mux0000<4>1  (
    .I0(Rx_SFDdetected),
    .I1(RxCRC[26]),
    .O(RxCRC_mux0000[4])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \RxCRC_mux0000<3>1  (
    .I0(Rx_SFDdetected),
    .I1(RxCRC[27]),
    .O(RxCRC_mux0000[3])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \RxCRC_mux0000<2>1  (
    .I0(Rx_SFDdetected),
    .I1(RxCRC[28]),
    .O(RxCRC_mux0000[2])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \RxCRC_mux0000<28>1  (
    .I0(Rx_SFDdetected),
    .I1(RxCRC[2]),
    .O(RxCRC_mux0000[28])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \RxCRC_mux0000<25>1  (
    .I0(Rx_SFDdetected),
    .I1(RxCRC[5]),
    .O(RxCRC_mux0000[25])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \RxCRC_mux0000<22>1  (
    .I0(Rx_SFDdetected),
    .I1(RxCRC[8]),
    .O(RxCRC_mux0000[22])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \RxCRC_mux0000<1>1  (
    .I0(Rx_SFDdetected),
    .I1(RxCRC[29]),
    .O(RxCRC_mux0000[1])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \RxCRC_mux0000<18>1  (
    .I0(Rx_SFDdetected),
    .I1(RxCRC[12]),
    .O(RxCRC_mux0000[18])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \RxCRC_mux0000<17>1  (
    .I0(Rx_SFDdetected),
    .I1(RxCRC[13]),
    .O(RxCRC_mux0000[17])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \RxCRC_mux0000<16>1  (
    .I0(Rx_SFDdetected),
    .I1(RxCRC[14]),
    .O(RxCRC_mux0000[16])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \RxCRC_mux0000<14>1  (
    .I0(Rx_SFDdetected),
    .I1(RxCRC[16]),
    .O(RxCRC_mux0000[14])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \RxCRC_mux0000<13>1  (
    .I0(Rx_SFDdetected),
    .I1(RxCRC[17]),
    .O(RxCRC_mux0000[13])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \RxCRC_mux0000<12>1  (
    .I0(Rx_SFDdetected),
    .I1(RxCRC[18]),
    .O(RxCRC_mux0000[12])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \RxCRC_mux0000<11>1  (
    .I0(Rx_SFDdetected),
    .I1(RxCRC[19]),
    .O(RxCRC_mux0000[11])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \RxCRC_mux0000<10>1  (
    .I0(Rx_SFDdetected),
    .I1(RxCRC[20]),
    .O(RxCRC_mux0000[10])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \RxCRC_mux0000<0>1  (
    .I0(Rx_SFDdetected),
    .I1(RxCRC[30]),
    .O(RxCRC_mux0000[0])
  );
  LUT3 #(
    .INIT ( 8'h72 ))
  RxFrame_mux00001 (
    .I0(RxFrame_649),
    .I1(Rx_end_of_Ethernet_frame),
    .I2(Rx_SFDdetected),
    .O(RxFrame_mux0000)
  );
  LUT3 #(
    .INIT ( 8'hFE ))
  pkt_data_or000766 (
    .I0(TxAddress[6]),
    .I1(TxAddress[7]),
    .I2(TxAddress[9]),
    .O(pkt_data_or000766_922)
  );
  LUT4 #(
    .INIT ( 16'h0200 ))
  pkt_data_cmp_eq00491 (
    .I0(N8),
    .I1(N248),
    .I2(TxAddress[0]),
    .I3(N14),
    .O(pkt_data_cmp_eq0049)
  );
  LUT4 #(
    .INIT ( 16'h0200 ))
  pkt_data_cmp_eq00231 (
    .I0(TxAddress[0]),
    .I1(N15),
    .I2(TxAddress[3]),
    .I3(N12),
    .O(pkt_data_cmp_eq0023)
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \pkt_data_mux0000<6>34  (
    .I0(pkt_data_cmp_eq0050),
    .I1(RxPacketCount[1]),
    .I2(N12),
    .I3(\pkt_data_mux0000<6>21_912 ),
    .O(\pkt_data_mux0000<6>34_913 )
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  RxNewByteAvailable (
    .I0(RxBitCount[2]),
    .I1(RxBitCount[1]),
    .I2(RxNewBitAvailable_692),
    .I3(N73),
    .O(RxNewByteAvailable_693)
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \pkt_data_mux0000<5>24  (
    .I0(CRCinit_cmp_eq0000_72),
    .I1(N257),
    .I2(RxPacketCount[2]),
    .I3(\pkt_data_mux0000<5>15_909 ),
    .O(\pkt_data_mux0000<5>24_910 )
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \pkt_data_mux0000<2>12  (
    .I0(pkt_data_cmp_eq0025),
    .I1(pkt_data_cmp_eq0027),
    .I2(pkt_data_cmp_eq0023),
    .I3(\pkt_data_mux0000<2>5_894 ),
    .O(\pkt_data_mux0000<2>12_891 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \pkt_data_mux0000<4>211  (
    .I0(pkt_data_cmp_eq0050),
    .I1(RxPacketCount[3]),
    .I2(N12),
    .I3(\pkt_data_mux0000<4>14_903 ),
    .O(\pkt_data_mux0000<4>21_904 )
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \pkt_data_mux0000<3>36  (
    .I0(pkt_data_cmp_eq0029),
    .I1(N253),
    .I2(pkt_data_cmp_eq0037),
    .I3(\pkt_data_mux0000<3>28_896 ),
    .O(\pkt_data_mux0000<3>36_897 )
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \pkt_data_mux0000<3>69  (
    .I0(N258),
    .I1(N51),
    .I2(\pkt_data_mux0000<3>59_900 ),
    .I3(\pkt_data_mux0000<3>41_898 ),
    .O(\pkt_data_mux0000<3>69_901 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \pkt_data_mux0000<0>17  (
    .I0(N250),
    .I1(TxAddress[6]),
    .O(N8)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  pkt_data_or00041 (
    .I0(TxAddress[1]),
    .I1(TxAddress[3]),
    .I2(TxAddress[0]),
    .I3(N13),
    .O(pkt_data_or0004)
  );
  LUT4 #(
    .INIT ( 16'h0200 ))
  pkt_data_cmp_eq004521 (
    .I0(TxAddress[5]),
    .I1(TxAddress[3]),
    .I2(TxAddress[4]),
    .I3(N8),
    .O(N41)
  );
  LUT4 #(
    .INIT ( 16'h0080 ))
  pkt_data_cmp_eq00251 (
    .I0(N246),
    .I1(TxAddress[0]),
    .I2(N12),
    .I3(TxAddress[3]),
    .O(pkt_data_cmp_eq0025)
  );
  LUT2 #(
    .INIT ( 4'h1 ))
  RxGoodPacket_mux000024131 (
    .I0(RxDataByteIn[6]),
    .I1(RxDataByteIn[2]),
    .O(N60)
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  RxGoodPacket_mux000024121 (
    .I0(RxBitCount[6]),
    .I1(RxDataByteIn[7]),
    .I2(RxDataByteIn[4]),
    .O(N54)
  );
  LUT4 #(
    .INIT ( 16'h2F20 ))
  \RxDataByteIn_mux0000<7>_SW0  (
    .I0(RxInSRp[1]),
    .I1(RxTransitionCount[0]),
    .I2(RxTransitionCount[1]),
    .I3(RxDataByteIn[7]),
    .O(N79)
  );
  LUT4 #(
    .INIT ( 16'hFCB8 ))
  \RxDataByteIn_mux0000<7>_SW1  (
    .I0(RxTransitionCount[0]),
    .I1(RxTransitionCount[1]),
    .I2(RxDataByteIn[7]),
    .I3(RxInSRp[1]),
    .O(N80)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \RxDataByteIn_mux0000<7>  (
    .I0(\RxInSRn[2] ),
    .I1(N79),
    .I2(N80),
    .O(RxDataByteIn_mux0000[7])
  );
  LUT4 #(
    .INIT ( 16'hFFD5 ))
  RxGoodPacket_mux000051 (
    .I0(RxGoodPacket_and0000),
    .I1(RxBitCount[4]),
    .I2(RxGoodPacket_mux000033),
    .I3(RxGoodPacket_mux00007_675),
    .O(RxGoodPacket_mux000051_674)
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  RxGoodPacket_mux000070 (
    .I0(RxBitCount[6]),
    .I1(RxDataByteIn[7]),
    .I2(RxBitCount[4]),
    .O(RxGoodPacket_mux000070_676)
  );
  LUT4 #(
    .INIT ( 16'h0200 ))
  RxGoodPacket_mux000088 (
    .I0(N46),
    .I1(RxDataByteIn[4]),
    .I2(RxDataByteIn[2]),
    .I3(RxBitCount[7]),
    .O(RxGoodPacket_mux000088_677)
  );
  LUT4 #(
    .INIT ( 16'h0080 ))
  RxGoodPacket_mux0000121 (
    .I0(RxDataByteIn[3]),
    .I1(RxDataByteIn[6]),
    .I2(RxBitCount[5]),
    .I3(RxDataByteIn[2]),
    .O(RxGoodPacket_mux0000121_656)
  );
  LUT4 #(
    .INIT ( 16'h0200 ))
  RxGoodPacket_mux0000130 (
    .I0(RxBitCount[4]),
    .I1(RxDataByteIn[3]),
    .I2(RxDataByteIn[6]),
    .I3(RxDataByteIn[2]),
    .O(RxGoodPacket_mux0000130_657)
  );
  LUT3 #(
    .INIT ( 8'h01 ))
  RxGoodPacket_mux0000181 (
    .I0(RxDataByteIn[0]),
    .I1(RxDataByteIn[1]),
    .I2(RxBitCount[3]),
    .O(RxGoodPacket_mux0000181_659)
  );
  LUT4 #(
    .INIT ( 16'hFFA8 ))
  RxGoodPacket_mux0000198 (
    .I0(RxGoodPacket_mux0000181_659),
    .I1(RxGoodPacket_mux0000104_655),
    .I2(RxGoodPacket_mux0000148_658),
    .I3(RxGoodPacket_mux000051_674),
    .O(RxGoodPacket_mux0000198_660)
  );
  LUT2 #(
    .INIT ( 4'h7 ))
  RxGoodPacket_mux0000212 (
    .I0(RxBitCount[4]),
    .I1(RxBitCount[5]),
    .O(RxGoodPacket_mux0000212_661)
  );
  LUT4 #(
    .INIT ( 16'h0080 ))
  RxGoodPacket_mux0000220 (
    .I0(RxBitCount[3]),
    .I1(RxBitCount[6]),
    .I2(RxDataByteIn[7]),
    .I3(RxDataByteIn[1]),
    .O(RxGoodPacket_mux0000220_662)
  );
  LUT4 #(
    .INIT ( 16'hA888 ))
  RxGoodPacket_mux0000274 (
    .I0(RxGoodPacket_mux0000270),
    .I1(N244),
    .I2(N56),
    .I3(N60),
    .O(RxGoodPacket_mux0000274_666)
  );
  LUT3 #(
    .INIT ( 8'h82 ))
  RxGoodPacket_mux0000295 (
    .I0(RxBitCount[8]),
    .I1(RxBitCount[3]),
    .I2(RxDataByteIn[4]),
    .O(RxGoodPacket_mux0000295_667)
  );
  LUT4 #(
    .INIT ( 16'h0010 ))
  RxGoodPacket_mux0000329 (
    .I0(RxDataByteIn[4]),
    .I1(RxDataByteIn[7]),
    .I2(N251),
    .I3(RxBitCount[3]),
    .O(RxGoodPacket_mux0000329_668)
  );
  LUT4 #(
    .INIT ( 16'h0F08 ))
  RxGoodPacket_mux0000415 (
    .I0(N60),
    .I1(RxGoodPacket_mux0000375_671),
    .I2(RxDataByteIn[1]),
    .I3(RxGoodPacket_mux0000398_672),
    .O(RxGoodPacket_mux0000415_673)
  );
  LUT2 #(
    .INIT ( 4'hE ))
  RxTransitionCount_not0001_SW0 (
    .I0(RxTransitionCount[0]),
    .I1(RxTransitionCount[1]),
    .O(N82)
  );
  IBUF   Ethernet_RDp_IBUF (
    .I(Ethernet_RDp),
    .O(Ethernet_RDp_IBUF_75)
  );
  IBUF   USB_FRDn_IBUF (
    .I(USB_FRDn),
    .O(USB_D_USB_readmux_not0000_inv)
  );
  OBUFT   USB_D_7_OBUFT (
    .I(USB_readmux[7]),
    .T(USB_D_USB_readmux_not0000_inv),
    .O(USB_D[7])
  );
  OBUFT   USB_D_6_OBUFT (
    .I(USB_readmux[6]),
    .T(USB_D_USB_readmux_not0000_inv),
    .O(USB_D[6])
  );
  OBUFT   USB_D_5_OBUFT (
    .I(USB_readmux[5]),
    .T(USB_D_USB_readmux_not0000_inv),
    .O(USB_D[5])
  );
  OBUFT   USB_D_4_OBUFT (
    .I(USB_readmux[4]),
    .T(USB_D_USB_readmux_not0000_inv),
    .O(USB_D[4])
  );
  OBUFT   USB_D_3_OBUFT (
    .I(USB_readmux[3]),
    .T(USB_D_USB_readmux_not0000_inv),
    .O(USB_D[3])
  );
  OBUFT   USB_D_2_OBUFT (
    .I(USB_readmux[2]),
    .T(USB_D_USB_readmux_not0000_inv),
    .O(USB_D[2])
  );
  OBUFT   USB_D_1_OBUFT (
    .I(USB_readmux[1]),
    .T(USB_D_USB_readmux_not0000_inv),
    .O(USB_D[1])
  );
  OBUFT   USB_D_0_OBUFT (
    .I(USB_readmux[0]),
    .T(USB_D_USB_readmux_not0000_inv),
    .O(USB_D[0])
  );
  OBUF   Ethernet_TDm_OBUF (
    .I(Ethernet_TDm_OBUF_77),
    .O(Ethernet_TDm)
  );
  OBUF   Ethernet_TDp_OBUF (
    .I(Ethernet_TDp_OBUF_80),
    .O(Ethernet_TDp)
  );
  OBUF   LED_2_OBUF (
    .I(LED_2_87),
    .O(LED[2])
  );
  OBUF   LED_1_OBUF (
    .I(LED_1_86),
    .O(LED[1])
  );
  OBUF   LED_0_OBUF (
    .I(LED_0_85),
    .O(LED[0])
  );
  FDS   pkt_data_0 (
    .C(clkTx),
    .D(\pkt_data_mux0000<7>101 ),
    .S(N48),
    .Q(pkt_data[0])
  );
  FDS   pkt_data_1 (
    .C(clkTx),
    .D(\pkt_data_mux0000<6>69 ),
    .S(N49),
    .Q(pkt_data[1])
  );
  FDS   pkt_data_2 (
    .C(clkTx),
    .D(\pkt_data_mux0000<5>51 ),
    .S(N50),
    .Q(pkt_data[2])
  );
  FDS   pkt_data_3 (
    .C(clkTx),
    .D(\pkt_data_mux0000<4>66 ),
    .S(\pkt_data_mux0000<4>6 ),
    .Q(pkt_data[3])
  );
  FDS   pkt_data_4 (
    .C(clkTx),
    .D(\pkt_data_mux0000<3>90 ),
    .S(\pkt_data_mux0000<3>0_895 ),
    .Q(pkt_data[4])
  );
  FDS   pkt_data_5 (
    .C(clkTx),
    .D(\pkt_data_mux0000<2>49 ),
    .S(\pkt_data_mux0000<2>12_891 ),
    .Q(pkt_data[5])
  );
  FDS   pkt_data_6 (
    .C(clkTx),
    .D(\pkt_data_mux0000<1>55 ),
    .S(\pkt_data_mux0000<1>7_890 ),
    .Q(pkt_data[6])
  );
  FDS   pkt_data_7 (
    .C(clkTx),
    .D(\pkt_data_mux0000<0>49 ),
    .S(N48),
    .Q(pkt_data[7])
  );
  FDS   qoe (
    .C(clkTx),
    .D(qoe_or00001),
    .S(LinkPulse_88),
    .Q(qoe_926)
  );
  LUT3 #(
    .INIT ( 8'hF7 ))
  qoe_or000011 (
    .I0(idlecount[2]),
    .I1(idlecount[1]),
    .I2(SendingPacketData_755),
    .O(qoe_or00001)
  );
  FDE   RxDataByteIn_0 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxTransitionCount[1]),
    .D(RxDataByteIn[1]),
    .Q(RxDataByteIn[0])
  );
  FDE   RxDataByteIn_1 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxTransitionCount[1]),
    .D(RxDataByteIn[2]),
    .Q(RxDataByteIn[1])
  );
  FDE   RxDataByteIn_2 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxTransitionCount[1]),
    .D(RxDataByteIn[3]),
    .Q(RxDataByteIn[2])
  );
  FDE   RxDataByteIn_3 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxTransitionCount[1]),
    .D(RxDataByteIn[4]),
    .Q(RxDataByteIn[3])
  );
  FDE   RxDataByteIn_4 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxTransitionCount[1]),
    .D(RxDataByteIn[5]),
    .Q(RxDataByteIn[4])
  );
  FDE   RxDataByteIn_5 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxTransitionCount[1]),
    .D(RxDataByteIn[6]),
    .Q(RxDataByteIn[5])
  );
  FDE   RxDataByteIn_6 (
    .C(CLK_USB_BUFGP_3),
    .CE(RxTransitionCount[1]),
    .D(RxDataByteIn[7]),
    .Q(RxDataByteIn[6])
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxPacketCount_cy<1>_rt  (
    .I0(RxPacketCount[1]),
    .O(\Mcount_RxPacketCount_cy<1>_rt_194 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxPacketCount_cy<2>_rt  (
    .I0(RxPacketCount[2]),
    .O(\Mcount_RxPacketCount_cy<2>_rt_216 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxPacketCount_cy<3>_rt  (
    .I0(RxPacketCount[3]),
    .O(\Mcount_RxPacketCount_cy<3>_rt_220 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxPacketCount_cy<4>_rt  (
    .I0(RxPacketCount[4]),
    .O(\Mcount_RxPacketCount_cy<4>_rt_222 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxPacketCount_cy<5>_rt  (
    .I0(RxPacketCount[5]),
    .O(\Mcount_RxPacketCount_cy<5>_rt_224 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxPacketCount_cy<6>_rt  (
    .I0(RxPacketCount[6]),
    .O(\Mcount_RxPacketCount_cy<6>_rt_226 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxPacketCount_cy<7>_rt  (
    .I0(RxPacketCount[7]),
    .O(\Mcount_RxPacketCount_cy<7>_rt_228 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxPacketCount_cy<8>_rt  (
    .I0(RxPacketCount[8]),
    .O(\Mcount_RxPacketCount_cy<8>_rt_230 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxPacketCount_cy<9>_rt  (
    .I0(RxPacketCount[9]),
    .O(\Mcount_RxPacketCount_cy<9>_rt_232 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxPacketCount_cy<10>_rt  (
    .I0(RxPacketCount[10]),
    .O(\Mcount_RxPacketCount_cy<10>_rt_174 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxPacketCount_cy<11>_rt  (
    .I0(RxPacketCount[11]),
    .O(\Mcount_RxPacketCount_cy<11>_rt_176 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxPacketCount_cy<12>_rt  (
    .I0(RxPacketCount[12]),
    .O(\Mcount_RxPacketCount_cy<12>_rt_178 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxPacketCount_cy<13>_rt  (
    .I0(RxPacketCount[13]),
    .O(\Mcount_RxPacketCount_cy<13>_rt_180 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxPacketCount_cy<14>_rt  (
    .I0(RxPacketCount[14]),
    .O(\Mcount_RxPacketCount_cy<14>_rt_182 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxPacketCount_cy<15>_rt  (
    .I0(RxPacketCount[15]),
    .O(\Mcount_RxPacketCount_cy<15>_rt_184 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxPacketCount_cy<16>_rt  (
    .I0(RxPacketCount[16]),
    .O(\Mcount_RxPacketCount_cy<16>_rt_186 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxPacketCount_cy<17>_rt  (
    .I0(RxPacketCount[17]),
    .O(\Mcount_RxPacketCount_cy<17>_rt_188 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxPacketCount_cy<18>_rt  (
    .I0(RxPacketCount[18]),
    .O(\Mcount_RxPacketCount_cy<18>_rt_190 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxPacketCount_cy<19>_rt  (
    .I0(RxPacketCount[19]),
    .O(\Mcount_RxPacketCount_cy<19>_rt_192 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxPacketCount_cy<20>_rt  (
    .I0(RxPacketCount[20]),
    .O(\Mcount_RxPacketCount_cy<20>_rt_196 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxPacketCount_cy<21>_rt  (
    .I0(RxPacketCount[21]),
    .O(\Mcount_RxPacketCount_cy<21>_rt_198 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxPacketCount_cy<22>_rt  (
    .I0(RxPacketCount[22]),
    .O(\Mcount_RxPacketCount_cy<22>_rt_200 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxPacketCount_cy<23>_rt  (
    .I0(RxPacketCount[23]),
    .O(\Mcount_RxPacketCount_cy<23>_rt_202 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxPacketCount_cy<24>_rt  (
    .I0(RxPacketCount[24]),
    .O(\Mcount_RxPacketCount_cy<24>_rt_204 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxPacketCount_cy<25>_rt  (
    .I0(RxPacketCount[25]),
    .O(\Mcount_RxPacketCount_cy<25>_rt_206 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxPacketCount_cy<26>_rt  (
    .I0(RxPacketCount[26]),
    .O(\Mcount_RxPacketCount_cy<26>_rt_208 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxPacketCount_cy<27>_rt  (
    .I0(RxPacketCount[27]),
    .O(\Mcount_RxPacketCount_cy<27>_rt_210 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxPacketCount_cy<28>_rt  (
    .I0(RxPacketCount[28]),
    .O(\Mcount_RxPacketCount_cy<28>_rt_212 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxPacketCount_cy<29>_rt  (
    .I0(RxPacketCount[29]),
    .O(\Mcount_RxPacketCount_cy<29>_rt_214 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxPacketCount_cy<30>_rt  (
    .I0(RxPacketCount[30]),
    .O(\Mcount_RxPacketCount_cy<30>_rt_218 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxBitCount_cy<1>_rt  (
    .I0(RxBitCount[1]),
    .O(\Mcount_RxBitCount_cy<1>_rt_153 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxBitCount_cy<2>_rt  (
    .I0(RxBitCount[2]),
    .O(\Mcount_RxBitCount_cy<2>_rt_155 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxBitCount_cy<3>_rt  (
    .I0(RxBitCount[3]),
    .O(\Mcount_RxBitCount_cy<3>_rt_157 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxBitCount_cy<4>_rt  (
    .I0(RxBitCount[4]),
    .O(\Mcount_RxBitCount_cy<4>_rt_159 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxBitCount_cy<5>_rt  (
    .I0(RxBitCount[5]),
    .O(\Mcount_RxBitCount_cy<5>_rt_161 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxBitCount_cy<6>_rt  (
    .I0(RxBitCount[6]),
    .O(\Mcount_RxBitCount_cy<6>_rt_163 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxBitCount_cy<7>_rt  (
    .I0(RxBitCount[7]),
    .O(\Mcount_RxBitCount_cy<7>_rt_165 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxBitCount_cy<8>_rt  (
    .I0(RxBitCount[8]),
    .O(\Mcount_RxBitCount_cy<8>_rt_167 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxBitCount_cy<9>_rt  (
    .I0(RxBitCount[9]),
    .O(\Mcount_RxBitCount_cy<9>_rt_169 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxBitCount_cy<10>_rt  (
    .I0(RxBitCount[10]),
    .O(\Mcount_RxBitCount_cy<10>_rt_147 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxBitCount_cy<11>_rt  (
    .I0(RxBitCount[11]),
    .O(\Mcount_RxBitCount_cy<11>_rt_149 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxBitCount_cy<12>_rt  (
    .I0(RxBitCount[12]),
    .O(\Mcount_RxBitCount_cy<12>_rt_151 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<1>_rt  (
    .I0(counter[1]),
    .O(\Mcount_counter_cy<1>_rt_291 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<2>_rt  (
    .I0(counter[2]),
    .O(\Mcount_counter_cy<2>_rt_299 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<3>_rt  (
    .I0(counter[3]),
    .O(\Mcount_counter_cy<3>_rt_301 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<4>_rt  (
    .I0(counter[4]),
    .O(\Mcount_counter_cy<4>_rt_303 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<5>_rt  (
    .I0(counter[5]),
    .O(\Mcount_counter_cy<5>_rt_305 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<6>_rt  (
    .I0(counter[6]),
    .O(\Mcount_counter_cy<6>_rt_307 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<7>_rt  (
    .I0(counter[7]),
    .O(\Mcount_counter_cy<7>_rt_309 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<8>_rt  (
    .I0(counter[8]),
    .O(\Mcount_counter_cy<8>_rt_311 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<9>_rt  (
    .I0(counter[9]),
    .O(\Mcount_counter_cy<9>_rt_313 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<10>_rt  (
    .I0(counter[10]),
    .O(\Mcount_counter_cy<10>_rt_271 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<11>_rt  (
    .I0(counter[11]),
    .O(\Mcount_counter_cy<11>_rt_273 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<12>_rt  (
    .I0(counter[12]),
    .O(\Mcount_counter_cy<12>_rt_275 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<13>_rt  (
    .I0(counter[13]),
    .O(\Mcount_counter_cy<13>_rt_277 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<14>_rt  (
    .I0(counter[14]),
    .O(\Mcount_counter_cy<14>_rt_279 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<15>_rt  (
    .I0(counter[15]),
    .O(\Mcount_counter_cy<15>_rt_281 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<16>_rt  (
    .I0(counter[16]),
    .O(\Mcount_counter_cy<16>_rt_283 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<17>_rt  (
    .I0(counter[17]),
    .O(\Mcount_counter_cy<17>_rt_285 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<18>_rt  (
    .I0(counter[18]),
    .O(\Mcount_counter_cy<18>_rt_287 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<19>_rt  (
    .I0(counter[19]),
    .O(\Mcount_counter_cy<19>_rt_289 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<20>_rt  (
    .I0(counter[20]),
    .O(\Mcount_counter_cy<20>_rt_293 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<21>_rt  (
    .I0(counter[21]),
    .O(\Mcount_counter_cy<21>_rt_295 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_cy<22>_rt  (
    .I0(counter[22]),
    .O(\Mcount_counter_cy<22>_rt_297 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_LinkPulseCount_cy<1>_rt  (
    .I0(LinkPulseCount[1]),
    .O(\Mcount_LinkPulseCount_cy<1>_rt_126 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_LinkPulseCount_cy<2>_rt  (
    .I0(LinkPulseCount[2]),
    .O(\Mcount_LinkPulseCount_cy<2>_rt_128 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_LinkPulseCount_cy<3>_rt  (
    .I0(LinkPulseCount[3]),
    .O(\Mcount_LinkPulseCount_cy<3>_rt_130 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_LinkPulseCount_cy<4>_rt  (
    .I0(LinkPulseCount[4]),
    .O(\Mcount_LinkPulseCount_cy<4>_rt_132 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_LinkPulseCount_cy<5>_rt  (
    .I0(LinkPulseCount[5]),
    .O(\Mcount_LinkPulseCount_cy<5>_rt_134 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_LinkPulseCount_cy<6>_rt  (
    .I0(LinkPulseCount[6]),
    .O(\Mcount_LinkPulseCount_cy<6>_rt_136 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_LinkPulseCount_cy<7>_rt  (
    .I0(LinkPulseCount[7]),
    .O(\Mcount_LinkPulseCount_cy<7>_rt_138 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_LinkPulseCount_cy<8>_rt  (
    .I0(LinkPulseCount[8]),
    .O(\Mcount_LinkPulseCount_cy<8>_rt_140 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_LinkPulseCount_cy<9>_rt  (
    .I0(LinkPulseCount[9]),
    .O(\Mcount_LinkPulseCount_cy<9>_rt_142 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_LinkPulseCount_cy<10>_rt  (
    .I0(LinkPulseCount[10]),
    .O(\Mcount_LinkPulseCount_cy<10>_rt_114 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_LinkPulseCount_cy<11>_rt  (
    .I0(LinkPulseCount[11]),
    .O(\Mcount_LinkPulseCount_cy<11>_rt_116 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_LinkPulseCount_cy<12>_rt  (
    .I0(LinkPulseCount[12]),
    .O(\Mcount_LinkPulseCount_cy<12>_rt_118 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_LinkPulseCount_cy<13>_rt  (
    .I0(LinkPulseCount[13]),
    .O(\Mcount_LinkPulseCount_cy<13>_rt_120 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_LinkPulseCount_cy<14>_rt  (
    .I0(LinkPulseCount[14]),
    .O(\Mcount_LinkPulseCount_cy<14>_rt_122 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_LinkPulseCount_cy<15>_rt  (
    .I0(LinkPulseCount[15]),
    .O(\Mcount_LinkPulseCount_cy<15>_rt_124 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxPacketCount_xor<31>_rt  (
    .I0(RxPacketCount[31]),
    .O(\Mcount_RxPacketCount_xor<31>_rt_234 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_RxBitCount_xor<13>_rt  (
    .I0(RxBitCount[13]),
    .O(\Mcount_RxBitCount_xor<13>_rt_171 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_counter_xor<23>_rt  (
    .I0(counter[23]),
    .O(\Mcount_counter_xor<23>_rt_315 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_LinkPulseCount_xor<16>_rt  (
    .I0(LinkPulseCount[16]),
    .O(\Mcount_LinkPulseCount_xor<16>_rt_144 )
  );
  LUT4 #(
    .INIT ( 16'hFF7E ))
  RxTransitionCount_not0001 (
    .I0(RxInSRp[1]),
    .I1(\RxInSRn[2] ),
    .I2(RxInSRp[2]),
    .I3(N82),
    .O(RxTransitionCount_not0001_746)
  );
  LUT3 #(
    .INIT ( 8'h7E ))
  RxTransitionTimeout_or00001 (
    .I0(RxInSRp[1]),
    .I1(\RxInSRn[2] ),
    .I2(RxInSRp[2]),
    .O(RxTransitionTimeout_or0000)
  );
  LUT4 #(
    .INIT ( 16'h3B2A ))
  Maccum_RxTransitionCount_SW0 (
    .I0(RxTransitionCount[1]),
    .I1(RxTransitionCount[0]),
    .I2(RxInSRp[1]),
    .I3(RxInSRp[2]),
    .O(N97)
  );
  LUT4 #(
    .INIT ( 16'hAB23 ))
  Maccum_RxTransitionCount_SW1 (
    .I0(RxTransitionCount[1]),
    .I1(RxTransitionCount[0]),
    .I2(RxInSRp[2]),
    .I3(RxInSRp[1]),
    .O(N98)
  );
  LUT3 #(
    .INIT ( 8'h1B ))
  Maccum_RxTransitionCount (
    .I0(\RxInSRn[2] ),
    .I1(N97),
    .I2(N98),
    .O(Maccum_RxTransitionCount_111)
  );
  LUT4 #(
    .INIT ( 16'hBFF5 ))
  RxGoodPacket_mux0000341_SW0 (
    .I0(RxBitCount[6]),
    .I1(RxBitCount[5]),
    .I2(RxDataByteIn[7]),
    .I3(RxDataByteIn[4]),
    .O(N104)
  );
  LUT4 #(
    .INIT ( 16'hAAA8 ))
  RxGoodPacket_mux0000468 (
    .I0(RxGoodPacket_652),
    .I1(RxGoodPacket_mux0000236_663),
    .I2(RxGoodPacket_mux0000198_660),
    .I3(N106),
    .O(RxGoodPacket_mux0000)
  );
  LUT4 #(
    .INIT ( 16'hF7FF ))
  pkt_data_cmp_eq00301_SW0 (
    .I0(TxAddress[3]),
    .I1(TxAddress[1]),
    .I2(TxAddress[2]),
    .I3(TxAddress[0]),
    .O(N130)
  );
  LUT4 #(
    .INIT ( 16'hFFBF ))
  RxNewByteAvailable_SW1 (
    .I0(RxBitCount[12]),
    .I1(RxBitCount[1]),
    .I2(RxGoodPacket_652),
    .I3(RxBitCount[13]),
    .O(N136)
  );
  LUT4 #(
    .INIT ( 16'h0080 ))
  _and00001 (
    .I0(N249),
    .I1(RxNewBitAvailable_692),
    .I2(RxBitCount[2]),
    .I3(N136),
    .O(_and0000)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  pkt_data_or0000_SW0_SW0 (
    .I0(TxAddress[8]),
    .I1(TxAddress[7]),
    .I2(TxAddress[10]),
    .I3(TxAddress[6]),
    .O(N138)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  pkt_data_or0000 (
    .I0(N14),
    .I1(N247),
    .I2(TxAddress[9]),
    .I3(N138),
    .O(pkt_data_or0000_918)
  );
  LUT4 #(
    .INIT ( 16'h0080 ))
  CRCinit_cmp_eq0000 (
    .I0(N138),
    .I1(N245),
    .I2(TxAddress[9]),
    .I3(N1),
    .O(CRCinit_cmp_eq0000_72)
  );
  LUT4 #(
    .INIT ( 16'hAA08 ))
  RxGoodPacket_mux0000236 (
    .I0(RxBitCount[7]),
    .I1(N11),
    .I2(N142),
    .I3(RxGoodPacket_mux0000212_661),
    .O(RxGoodPacket_mux0000236_663)
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \pkt_data_mux0000<2>491  (
    .I0(\pkt_data_mux0000<2>20_892 ),
    .I1(TxData[5]),
    .I2(pkt_data_or0007),
    .I3(N144),
    .O(\pkt_data_mux0000<2>49 )
  );
  LUT3 #(
    .INIT ( 8'hF7 ))
  RxGoodPacket_mux0000308_SW0 (
    .I0(RxDataByteIn[4]),
    .I1(RxBitCount[7]),
    .I2(RxBitCount[6]),
    .O(N146)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \pkt_data_mux0000<3>8_SW0  (
    .I0(TxData[4]),
    .I1(pkt_data_or0007),
    .O(N148)
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \pkt_data_mux0000<3>901  (
    .I0(\pkt_data_mux0000<3>69_901 ),
    .I1(\pkt_data_mux0000<3>36_897 ),
    .I2(\pkt_data_mux0000<3>5_899 ),
    .I3(N148),
    .O(\pkt_data_mux0000<3>90 )
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \pkt_data_mux0000<1>551  (
    .I0(\pkt_data_mux0000<1>34_888 ),
    .I1(TxData[6]),
    .I2(pkt_data_or0007),
    .I3(N150),
    .O(\pkt_data_mux0000<1>55 )
  );
  LUT3 #(
    .INIT ( 8'hF7 ))
  \pkt_data_mux0000<0>38_SW0  (
    .I0(TxAddress[2]),
    .I1(TxAddress[1]),
    .I2(TxAddress[0]),
    .O(N154)
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \pkt_data_mux0000<6>691  (
    .I0(\pkt_data_mux0000<6>34_913 ),
    .I1(TxData[1]),
    .I2(pkt_data_or0007),
    .I3(N158),
    .O(\pkt_data_mux0000<6>69 )
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \pkt_data_mux0000<4>661  (
    .I0(pkt_data_or0004),
    .I1(TxData[3]),
    .I2(pkt_data_or0007),
    .I3(N168),
    .O(\pkt_data_mux0000<4>66 )
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \pkt_data_mux0000<7>1011  (
    .I0(\pkt_data_mux0000<7>68_917 ),
    .I1(TxData[0]),
    .I2(pkt_data_or0007),
    .I3(N170),
    .O(\pkt_data_mux0000<7>101 )
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \pkt_data_mux0000<0>491  (
    .I0(\pkt_data_mux0000<0>16_884 ),
    .I1(TxData[7]),
    .I2(pkt_data_or0007),
    .I3(N172),
    .O(\pkt_data_mux0000<0>49 )
  );
  LUT4 #(
    .INIT ( 16'h2AFA ))
  pkt_data_or000733 (
    .I0(TxAddress[10]),
    .I1(N174),
    .I2(TxAddress[8]),
    .I3(TxAddress[9]),
    .O(pkt_data_or000733_921)
  );
  LUT4 #(
    .INIT ( 16'h0010 ))
  \pkt_data_mux0000<3>28  (
    .I0(N1),
    .I1(TxAddress[5]),
    .I2(N8),
    .I3(TxAddress[3]),
    .O(\pkt_data_mux0000<3>28_896 )
  );
  LUT4 #(
    .INIT ( 16'h1200 ))
  \pkt_data_mux0000<2>34_SW0  (
    .I0(TxAddress[4]),
    .I1(N176),
    .I2(TxAddress[5]),
    .I3(N8),
    .O(N144)
  );
  LUT4 #(
    .INIT ( 16'h0010 ))
  \pkt_data_mux0000<3>59  (
    .I0(TxAddress[6]),
    .I1(TxAddress[5]),
    .I2(N52),
    .I3(N134),
    .O(\pkt_data_mux0000<3>59_900 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Mcount_TxAddress_lut<0>  (
    .I0(SendingPacket_754),
    .I1(TxAddress[0]),
    .O(Mcount_TxAddress_lut[0])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Mcount_TxAddress_lut<1>  (
    .I0(SendingPacket_754),
    .I1(TxAddress[1]),
    .O(Mcount_TxAddress_lut[1])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Mcount_TxAddress_lut<2>  (
    .I0(SendingPacket_754),
    .I1(TxAddress[2]),
    .O(Mcount_TxAddress_lut[2])
  );
  LUT2 #(
    .INIT ( 4'hD ))
  \Mcount_TxAddress_lut<3>  (
    .I0(SendingPacket_754),
    .I1(TxAddress[3]),
    .O(Mcount_TxAddress_lut[3])
  );
  LUT2 #(
    .INIT ( 4'hD ))
  \Mcount_TxAddress_lut<4>  (
    .I0(SendingPacket_754),
    .I1(TxAddress[4]),
    .O(Mcount_TxAddress_lut[4])
  );
  LUT2 #(
    .INIT ( 4'hD ))
  \Mcount_TxAddress_lut<5>  (
    .I0(SendingPacket_754),
    .I1(TxAddress[5]),
    .O(Mcount_TxAddress_lut[5])
  );
  LUT2 #(
    .INIT ( 4'hD ))
  \Mcount_TxAddress_lut<6>  (
    .I0(SendingPacket_754),
    .I1(TxAddress[6]),
    .O(Mcount_TxAddress_lut[6])
  );
  LUT3 #(
    .INIT ( 8'hF7 ))
  \pkt_data_mux0000<7>26_SW0  (
    .I0(TxAddress[3]),
    .I1(TxAddress[2]),
    .I2(TxAddress[1]),
    .O(N180)
  );
  LUT4 #(
    .INIT ( 16'h0426 ))
  \pkt_data_mux0000<7>26  (
    .I0(TxAddress[5]),
    .I1(TxAddress[4]),
    .I2(N180),
    .I3(N181),
    .O(\pkt_data_mux0000<7>26_916 )
  );
  LUT3 #(
    .INIT ( 8'hA2 ))
  pkt_data_or000779_SW0 (
    .I0(TxAddress[4]),
    .I1(TxAddress[1]),
    .I2(TxAddress[2]),
    .O(N183)
  );
  LUT4 #(
    .INIT ( 16'hFFAE ))
  pkt_data_or000798 (
    .I0(pkt_data_or000779_923),
    .I1(TxAddress[5]),
    .I2(N187),
    .I3(pkt_data_or000733_921),
    .O(pkt_data_or0007)
  );
  LUT4 #(
    .INIT ( 16'hE5FF ))
  \pkt_data_mux0000<5>3_SW0_SW0  (
    .I0(TxAddress[4]),
    .I1(TxAddress[3]),
    .I2(TxAddress[5]),
    .I3(N243),
    .O(N189)
  );
  LUT4 #(
    .INIT ( 16'hFFAE ))
  \pkt_data_mux0000<5>3  (
    .I0(pkt_data_cmp_eq0037),
    .I1(N8),
    .I2(N189),
    .I3(pkt_data_cmp_eq0028),
    .O(N49)
  );
  LUT4 #(
    .INIT ( 16'hAB55 ))
  pkt_data_or000763_SW0 (
    .I0(TxAddress[4]),
    .I1(TxAddress[1]),
    .I2(TxAddress[2]),
    .I3(TxAddress[3]),
    .O(N187)
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \pkt_data_mux0000<5>511  (
    .I0(N49),
    .I1(TxData[2]),
    .I2(pkt_data_or0007),
    .I3(N193),
    .O(\pkt_data_mux0000<5>51 )
  );
  LUT4 #(
    .INIT ( 16'h0010 ))
  \pkt_data_mux0000<5>15  (
    .I0(TxAddress[6]),
    .I1(TxAddress[4]),
    .I2(N52),
    .I3(N195),
    .O(\pkt_data_mux0000<5>15_909 )
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  Rx_SFDdetected45_SW0 (
    .I0(RxPreambleBitsCount[3]),
    .I1(RxPreambleBitsCount[2]),
    .I2(RxPreambleBitsCount[1]),
    .I3(RxPreambleBitsCount[0]),
    .O(N197)
  );
  LUT4 #(
    .INIT ( 16'h0302 ))
  RxGoodPacket_mux0000148 (
    .I0(RxGoodPacket_mux0000130_657),
    .I1(RxDataByteIn[7]),
    .I2(N199),
    .I3(RxGoodPacket_mux0000121_656),
    .O(RxGoodPacket_mux0000148_658)
  );
  LUT3 #(
    .INIT ( 8'hAE ))
  \pkt_data_mux0000<5>4  (
    .I0(pkt_data_or0000_918),
    .I1(N12),
    .I2(N201),
    .O(N50)
  );
  LUT4 #(
    .INIT ( 16'h27FF ))
  \pkt_data_mux0000<1>13_SW1  (
    .I0(TxAddress[0]),
    .I1(RxPacketCount[6]),
    .I2(RxPacketCount[14]),
    .I3(N14),
    .O(N178)
  );
  LUT4 #(
    .INIT ( 16'hF7FF ))
  \pkt_data_mux0000<1>44_SW1  (
    .I0(TxAddress[4]),
    .I1(TxAddress[1]),
    .I2(TxAddress[5]),
    .I3(N18),
    .O(N191)
  );
  LUT4 #(
    .INIT ( 16'h0200 ))
  \pkt_data_mux0000<1>34_SW0  (
    .I0(N52),
    .I1(TxAddress[6]),
    .I2(TxAddress[5]),
    .I3(TxAddress[3]),
    .O(N166)
  );
  LUT4 #(
    .INIT ( 16'h0200 ))
  \pkt_data_mux0000<3>41  (
    .I0(N52),
    .I1(TxAddress[6]),
    .I2(N203),
    .I3(N14),
    .O(\pkt_data_mux0000<3>41_898 )
  );
  LUT4 #(
    .INIT ( 16'hFF1B ))
  \pkt_data_mux0000<0>33_SW1  (
    .I0(TxAddress[0]),
    .I1(RxPacketCount[15]),
    .I2(RxPacketCount[7]),
    .I3(TxAddress[6]),
    .O(N205)
  );
  LUT4 #(
    .INIT ( 16'h0200 ))
  \pkt_data_mux0000<0>5  (
    .I0(N52),
    .I1(TxAddress[6]),
    .I2(N207),
    .I3(N18),
    .O(\pkt_data_mux0000<0>5_887 )
  );
  LUT4 #(
    .INIT ( 16'hFFFB ))
  pkt_data_cmp_eq00291_SW1 (
    .I0(TxAddress[4]),
    .I1(TxAddress[1]),
    .I2(TxAddress[2]),
    .I3(TxAddress[5]),
    .O(N209)
  );
  LUT4 #(
    .INIT ( 16'h0200 ))
  pkt_data_cmp_eq00291 (
    .I0(N52),
    .I1(TxAddress[6]),
    .I2(N209),
    .I3(N242),
    .O(pkt_data_cmp_eq0029)
  );
  LUT2 #(
    .INIT ( 4'hD ))
  \Mcount_TxAddress_lut<7>  (
    .I0(SendingPacket_754),
    .I1(TxAddress[7]),
    .O(Mcount_TxAddress_lut[7])
  );
  LUT2 #(
    .INIT ( 4'hD ))
  \Mcount_TxAddress_lut<8>  (
    .I0(SendingPacket_754),
    .I1(TxAddress[8]),
    .O(Mcount_TxAddress_lut[8])
  );
  LUT2 #(
    .INIT ( 4'hD ))
  \Mcount_TxAddress_lut<9>  (
    .I0(SendingPacket_754),
    .I1(TxAddress[9]),
    .O(Mcount_TxAddress_lut[9])
  );
  LUT2 #(
    .INIT ( 4'hD ))
  \Mcount_TxAddress_lut<10>  (
    .I0(SendingPacket_754),
    .I1(TxAddress[10]),
    .O(Mcount_TxAddress_lut[10])
  );
  LUT4 #(
    .INIT ( 16'h0200 ))
  SendingPacket_and000014 (
    .I0(ShiftCount[3]),
    .I1(TxAddress[1]),
    .I2(TxAddress[2]),
    .I3(ShiftCount[2]),
    .O(SendingPacket_and000014_758)
  );
  LUT4 #(
    .INIT ( 16'hFF14 ))
  \CRC_mux0000<31>1  (
    .I0(CRCflush_68),
    .I1(CRC[31]),
    .I2(ShiftData[0]),
    .I3(CRCinit_71),
    .O(CRC_mux0000[31])
  );
  LUT4 #(
    .INIT ( 16'h6CCC ))
  \Mcount_RxPreambleBitsCount_xor<3>11  (
    .I0(RxPreambleBitsCount[0]),
    .I1(RxPreambleBitsCount[3]),
    .I2(RxPreambleBitsCount[1]),
    .I3(RxPreambleBitsCount[2]),
    .O(\Result<3>1 )
  );
  LUT4 #(
    .INIT ( 16'h7FFF ))
  pkt_data_cmp_eq00501_SW0 (
    .I0(TxAddress[5]),
    .I1(TxAddress[4]),
    .I2(TxAddress[3]),
    .I3(TxAddress[0]),
    .O(N211)
  );
  LUT4 #(
    .INIT ( 16'hF7FF ))
  pkt_data_cmp_eq00481_SW0 (
    .I0(TxAddress[2]),
    .I1(TxAddress[1]),
    .I2(TxAddress[3]),
    .I3(TxAddress[0]),
    .O(N213)
  );
  LUT4 #(
    .INIT ( 16'hFFB8 ))
  \pkt_data_mux0000<4>661_SW0_SW0_SW0_SW0  (
    .I0(TxAddress[5]),
    .I1(TxAddress[4]),
    .I2(TxAddress[3]),
    .I3(TxAddress[6]),
    .O(N215)
  );
  LUT4 #(
    .INIT ( 16'hCE02 ))
  CRCflush_mux0000 (
    .I0(N52),
    .I1(CRCflush_68),
    .I2(N217),
    .I3(SendingPacket_754),
    .O(CRCflush_mux0000_69)
  );
  LUT4 #(
    .INIT ( 16'hFFB8 ))
  \pkt_data_mux0000<7>2  (
    .I0(N220),
    .I1(TxAddress[3]),
    .I2(N219),
    .I3(CRCinit_cmp_eq0000_72),
    .O(N48)
  );
  LUT4 #(
    .INIT ( 16'h0200 ))
  pkt_data_cmp_eq00271 (
    .I0(N254),
    .I1(TxAddress[0]),
    .I2(N17),
    .I3(TxAddress[3]),
    .O(pkt_data_cmp_eq0027)
  );
  LUT4 #(
    .INIT ( 16'h0200 ))
  pkt_data_cmp_eq00371 (
    .I0(N255),
    .I1(TxAddress[0]),
    .I2(N17),
    .I3(TxAddress[3]),
    .O(pkt_data_cmp_eq0037)
  );
  LUT4 #(
    .INIT ( 16'hEAAA ))
  \pkt_data_mux0000<3>0  (
    .I0(pkt_data_cmp_eq0027),
    .I1(N12),
    .I2(TxAddress[3]),
    .I3(N16),
    .O(\pkt_data_mux0000<3>0_895 )
  );
  LUT3 #(
    .INIT ( 8'hBE ))
  \RxCRC_mux0000<31>1  (
    .I0(Rx_SFDdetected),
    .I1(RxCRC[31]),
    .I2(RxDataByteIn[7]),
    .O(RxCRC_mux0000[31])
  );
  LUT4 #(
    .INIT ( 16'hFF96 ))
  \RxCRC_mux0000<9>1  (
    .I0(RxCRC[31]),
    .I1(RxDataByteIn[7]),
    .I2(RxCRC[21]),
    .I3(Rx_SFDdetected),
    .O(RxCRC_mux0000[9])
  );
  LUT4 #(
    .INIT ( 16'hFF96 ))
  \RxCRC_mux0000<8>1  (
    .I0(RxCRC[31]),
    .I1(RxDataByteIn[7]),
    .I2(RxCRC[22]),
    .I3(Rx_SFDdetected),
    .O(RxCRC_mux0000[8])
  );
  LUT4 #(
    .INIT ( 16'hFF96 ))
  \RxCRC_mux0000<5>1  (
    .I0(RxCRC[31]),
    .I1(RxDataByteIn[7]),
    .I2(RxCRC[25]),
    .I3(Rx_SFDdetected),
    .O(RxCRC_mux0000[5])
  );
  LUT4 #(
    .INIT ( 16'hFF96 ))
  \RxCRC_mux0000<30>1  (
    .I0(RxCRC[31]),
    .I1(RxDataByteIn[7]),
    .I2(RxCRC[0]),
    .I3(Rx_SFDdetected),
    .O(RxCRC_mux0000[30])
  );
  LUT4 #(
    .INIT ( 16'hFF96 ))
  \RxCRC_mux0000<29>1  (
    .I0(RxCRC[31]),
    .I1(RxDataByteIn[7]),
    .I2(RxCRC[1]),
    .I3(Rx_SFDdetected),
    .O(RxCRC_mux0000[29])
  );
  LUT4 #(
    .INIT ( 16'hFF96 ))
  \RxCRC_mux0000<27>1  (
    .I0(RxCRC[31]),
    .I1(RxDataByteIn[7]),
    .I2(RxCRC[3]),
    .I3(Rx_SFDdetected),
    .O(RxCRC_mux0000[27])
  );
  LUT4 #(
    .INIT ( 16'hFF96 ))
  \RxCRC_mux0000<26>1  (
    .I0(RxCRC[31]),
    .I1(RxDataByteIn[7]),
    .I2(RxCRC[4]),
    .I3(Rx_SFDdetected),
    .O(RxCRC_mux0000[26])
  );
  LUT4 #(
    .INIT ( 16'hFF96 ))
  \RxCRC_mux0000<24>1  (
    .I0(RxCRC[31]),
    .I1(RxDataByteIn[7]),
    .I2(RxCRC[6]),
    .I3(Rx_SFDdetected),
    .O(RxCRC_mux0000[24])
  );
  LUT4 #(
    .INIT ( 16'hFF96 ))
  \RxCRC_mux0000<23>1  (
    .I0(RxCRC[31]),
    .I1(RxDataByteIn[7]),
    .I2(RxCRC[7]),
    .I3(Rx_SFDdetected),
    .O(RxCRC_mux0000[23])
  );
  LUT4 #(
    .INIT ( 16'hFF96 ))
  \RxCRC_mux0000<21>1  (
    .I0(RxCRC[31]),
    .I1(RxDataByteIn[7]),
    .I2(RxCRC[9]),
    .I3(Rx_SFDdetected),
    .O(RxCRC_mux0000[21])
  );
  LUT4 #(
    .INIT ( 16'hFF96 ))
  \RxCRC_mux0000<20>1  (
    .I0(RxCRC[31]),
    .I1(RxDataByteIn[7]),
    .I2(RxCRC[10]),
    .I3(Rx_SFDdetected),
    .O(RxCRC_mux0000[20])
  );
  LUT4 #(
    .INIT ( 16'hFF96 ))
  \RxCRC_mux0000<19>1  (
    .I0(RxCRC[31]),
    .I1(RxDataByteIn[7]),
    .I2(RxCRC[11]),
    .I3(Rx_SFDdetected),
    .O(RxCRC_mux0000[19])
  );
  LUT4 #(
    .INIT ( 16'hFF96 ))
  \RxCRC_mux0000<15>1  (
    .I0(RxCRC[31]),
    .I1(RxDataByteIn[7]),
    .I2(RxCRC[15]),
    .I3(Rx_SFDdetected),
    .O(RxCRC_mux0000[15])
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \pkt_data_mux0000<1>7  (
    .I0(pkt_data_cmp_eq0025),
    .I1(pkt_data_or0000_918),
    .I2(CRCinit_cmp_eq0000_72),
    .I3(N222),
    .O(\pkt_data_mux0000<1>7_890 )
  );
  LUT4 #(
    .INIT ( 16'hF7FF ))
  Rx_SFDdetected54_SW0 (
    .I0(N252),
    .I1(RxDataByteIn[1]),
    .I2(RxDataByteIn[7]),
    .I3(RxDataByteIn[5]),
    .O(N224)
  );
  LUT4 #(
    .INIT ( 16'h028A ))
  Rx_SFDdetected54 (
    .I0(Rx_SFDdetected45_752),
    .I1(RxDataByteIn[0]),
    .I2(N224),
    .I3(N225),
    .O(Rx_SFDdetected)
  );
  LUT3 #(
    .INIT ( 8'hC1 ))
  \pkt_data_mux0000<0>491_SW0_SW0_SW0  (
    .I0(TxAddress[2]),
    .I1(TxAddress[1]),
    .I2(TxAddress[0]),
    .O(N227)
  );
  LUT4 #(
    .INIT ( 16'hEAAA ))
  \pkt_data_mux0000<0>491_SW0_SW0  (
    .I0(\pkt_data_mux0000<0>33_885 ),
    .I1(N13),
    .I2(TxAddress[3]),
    .I3(N227),
    .O(N172)
  );
  LUT4 #(
    .INIT ( 16'h88F8 ))
  \pkt_data_mux0000<7>96_SW0_SW0  (
    .I0(RxPacketCount[0]),
    .I1(pkt_data_cmp_eq0050),
    .I2(N12),
    .I3(N256),
    .O(N231)
  );
  LUT4 #(
    .INIT ( 16'h0200 ))
  \pkt_data_mux0000<7>2_SW2  (
    .I0(N13),
    .I1(TxAddress[1]),
    .I2(TxAddress[2]),
    .I3(TxAddress[0]),
    .O(N220)
  );
  LUT3 #(
    .INIT ( 8'hD1 ))
  \pkt_data_mux0000<2>20_SW1  (
    .I0(TxAddress[2]),
    .I1(TxAddress[1]),
    .I2(TxAddress[0]),
    .O(N229)
  );
  LUT4 #(
    .INIT ( 16'hF7FF ))
  Rx_SFDdetected54_SW1 (
    .I0(RxDataByteIn[7]),
    .I1(RxDataByteIn[4]),
    .I2(N233),
    .I3(RxDataByteIn[6]),
    .O(N225)
  );
  FDE   TxAddress_3_1 (
    .C(clkTx),
    .CE(readram),
    .D(Mcount_TxAddress3),
    .Q(TxAddress_3_1_799)
  );
  MUXF5   \pkt_data_mux0000<7>68  (
    .I0(N235),
    .I1(N236),
    .S(TxAddress[0]),
    .O(\pkt_data_mux0000<7>68_917 )
  );
  LUT4 #(
    .INIT ( 16'h0080 ))
  \pkt_data_mux0000<7>68_F  (
    .I0(RxPacketCount[8]),
    .I1(N8),
    .I2(N14),
    .I3(N15),
    .O(N235)
  );
  LUT4 #(
    .INIT ( 16'h0080 ))
  \pkt_data_mux0000<7>68_G  (
    .I0(N13),
    .I1(TxAddress[1]),
    .I2(TxAddress[2]),
    .I3(TxAddress[3]),
    .O(N236)
  );
  MUXF5   \pkt_data_mux0000<1>34  (
    .I0(N237),
    .I1(N238),
    .S(TxAddress[1]),
    .O(\pkt_data_mux0000<1>34_888 )
  );
  LUT4 #(
    .INIT ( 16'hAAEA ))
  \pkt_data_mux0000<1>34_F  (
    .I0(pkt_data_cmp_eq0029),
    .I1(N166),
    .I2(TxAddress[0]),
    .I3(TxAddress[2]),
    .O(N237)
  );
  LUT4 #(
    .INIT ( 16'hEAAA ))
  \pkt_data_mux0000<1>34_G  (
    .I0(pkt_data_cmp_eq0029),
    .I1(TxAddress[2]),
    .I2(N12),
    .I3(N18),
    .O(N238)
  );
  MUXF5   RxGoodPacket_mux0000375 (
    .I0(N239),
    .I1(N240),
    .S(RxDataByteIn[0]),
    .O(RxGoodPacket_mux0000375_671)
  );
  LUT4 #(
    .INIT ( 16'hFF02 ))
  RxGoodPacket_mux0000375_F (
    .I0(RxBitCount[3]),
    .I1(RxBitCount[7]),
    .I2(N104),
    .I3(RxGoodPacket_mux0000329_668),
    .O(N239)
  );
  LUT3 #(
    .INIT ( 8'h51 ))
  RxGoodPacket_mux0000375_G (
    .I0(RxDataByteIn[7]),
    .I1(N146),
    .I2(RxGoodPacket_mux0000295_667),
    .O(N240)
  );
  BUFGP   CLK_USB_BUFGP (
    .I(CLK_USB),
    .O(CLK_USB_BUFGP_3)
  );
  BUFGP   CLK40_BUFGP (
    .I(CLK40),
    .O(CLK40_BUFGP_1)
  );
  INV   \Mcount_RxPacketCount_lut<0>_INV_0  (
    .I(RxPacketCount[0]),
    .O(Mcount_RxPacketCount_lut[0])
  );
  INV   \Mcount_RxBitCount_lut<0>_INV_0  (
    .I(RxBitCount[0]),
    .O(Mcount_RxBitCount_lut[0])
  );
  INV   \Mcount_counter_lut<0>_INV_0  (
    .I(counter[0]),
    .O(Mcount_counter_lut[0])
  );
  INV   \Mcount_LinkPulseCount_lut<0>_INV_0  (
    .I(LinkPulseCount[0]),
    .O(Mcount_LinkPulseCount_lut[0])
  );
  INV   USB_D_USB_readmux_not0000_inv_inv1_INV_0 (
    .I(USB_D_USB_readmux_not0000_inv),
    .O(USB_D_USB_readmux_not0000_inv_inv)
  );
  INV   \Mcount_idlecount_xor<0>11_INV_0  (
    .I(idlecount[0]),
    .O(\Result<0>9 )
  );
  INV   \Mcount_USB_readcnt_xor<0>11_INV_0  (
    .I(USB_readcnt[0]),
    .O(\Result<0>5 )
  );
  INV   \Mcount_ShiftCount_xor<0>11_INV_0  (
    .I(ShiftCount[0]),
    .O(\Result<0>7 )
  );
  INV   \Mcount_RxTransitionTimeout_xor<0>11_INV_0  (
    .I(RxTransitionTimeout[0]),
    .O(\Result<0>4 )
  );
  INV   \Mcount_RxPreambleBitsCount_xor<0>11_INV_0  (
    .I(RxPreambleBitsCount[0]),
    .O(\Result<0>2 )
  );
  INV   Ethernet_TDm_not00011_INV_0 (
    .I(qo_924),
    .O(Ethernet_TDm_not0001)
  );
  INV   qoe_inv1_INV_0 (
    .I(qoe_926),
    .O(qoe_inv)
  );
  INV   SendingPacketData_inv1_INV_0 (
    .I(SendingPacketData_755),
    .O(SendingPacketData_inv)
  );
  INV   RxFrame_inv1_INV_0 (
    .I(RxFrame_649),
    .O(RxFrame_inv)
  );
  INV   SendingPacket_inv1_INV_0 (
    .I(SendingPacket_754),
    .O(SendingPacket_inv)
  );
  RAMB4_S8_S8 #(
    .SIM_COLLISION_CHECK ( "ALL" ),
    .INIT_0E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_08 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_09 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ))
  \RAM_RxTx/RAM  (
    .CLKA(CLK_USB_BUFGP_3),
    .CLKB(clkTx),
    .ENA(IPchecksum1),
    .ENB(IPchecksum1),
    .RSTA(N0),
    .RSTB(N0),
    .WEA(_and0000),
    .WEB(N0),
    .ADDRA({RxBitCount[11], RxBitCount[10], RxBitCount[9], RxBitCount[8], RxBitCount[7], RxBitCount[6], RxBitCount[5], RxBitCount[4], RxBitCount[3]}),
    .ADDRB({TxAddress[8], TxAddress[7], TxAddress[6], TxAddress[5], TxAddress[4], TxAddress[3], TxAddress[2], TxAddress[1], TxAddress[0]}),
    .DIA({RxDataByteIn[7], RxDataByteIn[6], RxDataByteIn[5], RxDataByteIn[4], RxDataByteIn[3], RxDataByteIn[2], RxDataByteIn[1], RxDataByteIn[0]}),
    .DIB({\NLW_RAM_RxTx/RAM_DIB<7>_UNCONNECTED , \NLW_RAM_RxTx/RAM_DIB<6>_UNCONNECTED , \NLW_RAM_RxTx/RAM_DIB<5>_UNCONNECTED , 
\NLW_RAM_RxTx/RAM_DIB<4>_UNCONNECTED , \NLW_RAM_RxTx/RAM_DIB<3>_UNCONNECTED , \NLW_RAM_RxTx/RAM_DIB<2>_UNCONNECTED , 
\NLW_RAM_RxTx/RAM_DIB<1>_UNCONNECTED , \NLW_RAM_RxTx/RAM_DIB<0>_UNCONNECTED }),
    .DOA({\NLW_RAM_RxTx/RAM_DOA<7>_UNCONNECTED , \NLW_RAM_RxTx/RAM_DOA<6>_UNCONNECTED , \NLW_RAM_RxTx/RAM_DOA<5>_UNCONNECTED , 
\NLW_RAM_RxTx/RAM_DOA<4>_UNCONNECTED , \NLW_RAM_RxTx/RAM_DOA<3>_UNCONNECTED , \NLW_RAM_RxTx/RAM_DOA<2>_UNCONNECTED , 
\NLW_RAM_RxTx/RAM_DOA<1>_UNCONNECTED , \NLW_RAM_RxTx/RAM_DOA<0>_UNCONNECTED }),
    .DOB({TxData[7], TxData[6], TxData[5], TxData[4], TxData[3], TxData[2], TxData[1], TxData[0]})
  );
  LUT4 #(
    .INIT ( 16'h7FFF ))
  \Mcount_RxPreambleBitsCount_xor<4>111  (
    .I0(RxPreambleBitsCount[0]),
    .I1(RxPreambleBitsCount[1]),
    .I2(RxPreambleBitsCount[2]),
    .I3(RxPreambleBitsCount[3]),
    .O(\Mcount_RxPreambleBitsCount_xor<4>11 )
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \Mcount_RxPreambleBitsCount_xor<4>112  (
    .I0(RxPreambleBitsCount[3]),
    .I1(RxPreambleBitsCount[0]),
    .I2(RxPreambleBitsCount[1]),
    .I3(RxPreambleBitsCount[2]),
    .O(\Mcount_RxPreambleBitsCount_xor<4>111_236 )
  );
  MUXF5   \Mcount_RxPreambleBitsCount_xor<4>11_f5  (
    .I0(\Mcount_RxPreambleBitsCount_xor<4>111_236 ),
    .I1(\Mcount_RxPreambleBitsCount_xor<4>11 ),
    .S(RxPreambleBitsCount[4]),
    .O(\Result<4>1 )
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  RxPacketReceivedOK_and000061 (
    .I0(RxBitCount[12]),
    .I1(RxBitCount[10]),
    .I2(RxBitCount[11]),
    .I3(RxBitCount[13]),
    .O(RxPacketReceivedOK_and000061_730)
  );
  MUXF5   RxPacketReceivedOK_and00006_f5 (
    .I0(RxPacketReceivedOK_and000061_730),
    .I1(IPchecksum1),
    .S(RxBitCount[9]),
    .O(RxPacketReceivedOK_and00006)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  RxLED_0_and0000111 (
    .I0(RxBitCount[13]),
    .I1(RxBitCount[11]),
    .I2(RxBitCount[12]),
    .I3(RxBitCount[10]),
    .O(RxLED_0_and000011)
  );
  MUXF5   RxLED_0_and000011_f5 (
    .I0(RxLED_0_and000011),
    .I1(N0),
    .S(RxBitCount[9]),
    .O(RxGoodPacket_and0000)
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \pkt_data_mux0000<4>61  (
    .I0(pkt_data_cmp_eq0023),
    .I1(pkt_data_cmp_eq0029),
    .I2(pkt_data_cmp_eq0048),
    .I3(pkt_data_cmp_eq0049),
    .O(\pkt_data_mux0000<4>61_906 )
  );
  LUT3 #(
    .INIT ( 8'hFE ))
  \pkt_data_mux0000<4>62  (
    .I0(pkt_data_cmp_eq0023),
    .I1(pkt_data_cmp_eq0029),
    .I2(pkt_data_cmp_eq0048),
    .O(\pkt_data_mux0000<4>62_907 )
  );
  MUXF5   \pkt_data_mux0000<4>6_f5  (
    .I0(\pkt_data_mux0000<4>62_907 ),
    .I1(\pkt_data_mux0000<4>61_906 ),
    .S(RxPacketCount[11]),
    .O(\pkt_data_mux0000<4>6 )
  );
  LUT4 #(
    .INIT ( 16'h028A ))
  RxGoodPacket_mux0000331 (
    .I0(RxBitCount[5]),
    .I1(RxBitCount[3]),
    .I2(RxBitCount[6]),
    .I3(RxBitCount[7]),
    .O(RxGoodPacket_mux0000331_670)
  );
  MUXF5   RxGoodPacket_mux000033_f5 (
    .I0(RxGoodPacket_mux0000331_670),
    .I1(IPchecksum1),
    .S(RxBitCount[8]),
    .O(RxGoodPacket_mux000033)
  );
  LUT4 #(
    .INIT ( 16'h0080 ))
  RxGoodPacket_mux00002701 (
    .I0(RxBitCount[3]),
    .I1(RxDataByteIn[4]),
    .I2(RxDataByteIn[1]),
    .I3(RxDataByteIn[0]),
    .O(RxGoodPacket_mux00002701_665)
  );
  MUXF5   RxGoodPacket_mux0000270_f5 (
    .I0(RxGoodPacket_mux00002701_665),
    .I1(N0),
    .S(RxDataByteIn[7]),
    .O(RxGoodPacket_mux0000270)
  );
  LUT4_L #(
    .INIT ( 16'h0200 ))
  SendingPacket_and00009 (
    .I0(ShiftCount[1]),
    .I1(TxAddress[5]),
    .I2(ShiftCount[0]),
    .I3(TxAddress[6]),
    .LO(SendingPacket_and00009_759)
  );
  LUT4_L #(
    .INIT ( 16'hFFFE ))
  RxPreambleBitsCount_or000065 (
    .I0(RxPreambleBitsCount_or00007_742),
    .I1(RxPreambleBitsCount_or000018_738),
    .I2(RxPreambleBitsCount_or000039_739),
    .I3(RxPreambleBitsCount_or000051_740),
    .LO(RxPreambleBitsCount_or000065_741)
  );
  LUT3_D #(
    .INIT ( 8'h80 ))
  RxLED_0_and0000131 (
    .I0(RxGoodPacket_and0000),
    .I1(RxLED_0_and000017_687),
    .I2(RxLED_0_and0000119_686),
    .LO(N241),
    .O(N9)
  );
  LUT2_D #(
    .INIT ( 4'h2 ))
  \pkt_data_mux0000<4>21  (
    .I0(TxAddress[3]),
    .I1(TxAddress[0]),
    .LO(N242),
    .O(N18)
  );
  LUT3_D #(
    .INIT ( 8'h02 ))
  pkt_data_cmp_eq004511 (
    .I0(TxAddress[0]),
    .I1(TxAddress[1]),
    .I2(TxAddress[2]),
    .LO(N243),
    .O(N16)
  );
  LUT4_D #(
    .INIT ( 16'h0080 ))
  RxGoodPacket_mux000024111 (
    .I0(RxDataByteIn[2]),
    .I1(RxBitCount[4]),
    .I2(RxDataByteIn[6]),
    .I3(RxBitCount[7]),
    .LO(N244),
    .O(N42)
  );
  LUT3_D #(
    .INIT ( 8'h80 ))
  CRCflush_mux000011 (
    .I0(TxAddress[4]),
    .I1(TxAddress[5]),
    .I2(TxAddress_3_1_799),
    .LO(N245),
    .O(N14)
  );
  LUT2_D #(
    .INIT ( 4'h2 ))
  CRCflush_mux000031 (
    .I0(TxAddress[2]),
    .I1(TxAddress[1]),
    .LO(N246),
    .O(N51)
  );
  LUT3_D #(
    .INIT ( 8'h7F ))
  pkt_data_or000011 (
    .I0(TxAddress[0]),
    .I1(TxAddress[1]),
    .I2(TxAddress[2]),
    .LO(N247),
    .O(N1)
  );
  LUT2_D #(
    .INIT ( 4'hD ))
  pkt_data_or000711 (
    .I0(TxAddress[1]),
    .I1(TxAddress[2]),
    .LO(N248),
    .O(N15)
  );
  LUT3_L #(
    .INIT ( 8'h08 ))
  Rx_SFDdetected111 (
    .I0(RxDataByteIn[7]),
    .I1(RxDataByteIn[6]),
    .I2(RxDataByteIn[3]),
    .LO(N46)
  );
  LUT2_D #(
    .INIT ( 4'h8 ))
  RxNewByteAvailable_SW0 (
    .I0(RxFrame_649),
    .I1(RxBitCount[0]),
    .LO(N249),
    .O(N73)
  );
  LUT4_L #(
    .INIT ( 16'hF888 ))
  \pkt_data_mux0000<2>5  (
    .I0(pkt_data_cmp_eq0049),
    .I1(RxPacketCount[13]),
    .I2(pkt_data_cmp_eq0050),
    .I3(RxPacketCount[5]),
    .LO(\pkt_data_mux0000<2>5_894 )
  );
  LUT4_L #(
    .INIT ( 16'hFFEA ))
  \pkt_data_mux0000<3>5  (
    .I0(CRCinit_cmp_eq0000_72),
    .I1(pkt_data_cmp_eq0049),
    .I2(RxPacketCount[12]),
    .I3(pkt_data_or0000_918),
    .LO(\pkt_data_mux0000<3>5_899 )
  );
  LUT3_L #(
    .INIT ( 8'h80 ))
  pkt_data_cmp_eq00281 (
    .I0(N12),
    .I1(TxAddress[3]),
    .I2(N16),
    .LO(pkt_data_cmp_eq0028)
  );
  LUT4_D #(
    .INIT ( 16'h0001 ))
  SendingPacket_and000011 (
    .I0(TxAddress[7]),
    .I1(TxAddress[8]),
    .I2(TxAddress[9]),
    .I3(TxAddress[10]),
    .LO(N250),
    .O(N52)
  );
  LUT3_D #(
    .INIT ( 8'h01 ))
  RxGoodPacket_mux00001311 (
    .I0(RxBitCount[5]),
    .I1(RxBitCount[4]),
    .I2(RxBitCount[8]),
    .LO(N251),
    .O(N56)
  );
  LUT3_L #(
    .INIT ( 8'hE4 ))
  RxGoodPacket_mux00007 (
    .I0(RxBitCount[5]),
    .I1(RxBitCount[6]),
    .I2(RxBitCount[8]),
    .LO(RxGoodPacket_mux00007_675)
  );
  LUT4_L #(
    .INIT ( 16'h0F08 ))
  RxGoodPacket_mux0000104 (
    .I0(N11),
    .I1(RxGoodPacket_mux000070_676),
    .I2(RxDataByteIn[5]),
    .I3(RxGoodPacket_mux000088_677),
    .LO(RxGoodPacket_mux0000104_655)
  );
  LUT3_L #(
    .INIT ( 8'h80 ))
  RxGoodPacket_mux0000398 (
    .I0(N42),
    .I1(N54),
    .I2(RxDataByteIn[0]),
    .LO(RxGoodPacket_mux0000398_672)
  );
  LUT4_D #(
    .INIT ( 16'h0010 ))
  RxGoodPacket_mux0000231 (
    .I0(RxDataByteIn[6]),
    .I1(RxDataByteIn[2]),
    .I2(RxDataByteIn[3]),
    .I3(RxDataByteIn[4]),
    .LO(N252),
    .O(N11)
  );
  LUT4_D #(
    .INIT ( 16'h0010 ))
  pkt_data_cmp_eq00301 (
    .I0(TxAddress[5]),
    .I1(TxAddress[4]),
    .I2(N8),
    .I3(N130),
    .LO(N253),
    .O(pkt_data_cmp_eq0030)
  );
  LUT3_L #(
    .INIT ( 8'h7E ))
  \pkt_data_mux0000<3>59_SW0  (
    .I0(TxAddress[4]),
    .I1(TxAddress[3]),
    .I2(TxAddress[0]),
    .LO(N134)
  );
  LUT3_L #(
    .INIT ( 8'hF7 ))
  Rx_SFDdetected122_SW0 (
    .I0(RxGoodPacket_mux0000220_662),
    .I1(RxDataByteIn[5]),
    .I2(RxDataByteIn[0]),
    .LO(N142)
  );
  LUT4_L #(
    .INIT ( 16'h0302 ))
  RxGoodPacket_mux0000468_SW0 (
    .I0(RxGoodPacket_mux0000415_673),
    .I1(RxDataByteIn[3]),
    .I2(RxDataByteIn[5]),
    .I3(RxGoodPacket_mux0000274_666),
    .LO(N106)
  );
  LUT4_D #(
    .INIT ( 16'h0010 ))
  \pkt_data_mux0000<4>110  (
    .I0(TxAddress[6]),
    .I1(TxAddress[4]),
    .I2(N52),
    .I3(TxAddress[5]),
    .LO(N254),
    .O(N12)
  );
  LUT4_D #(
    .INIT ( 16'h0200 ))
  \pkt_data_mux0000<0>23  (
    .I0(TxAddress[4]),
    .I1(TxAddress[6]),
    .I2(TxAddress[5]),
    .I3(N52),
    .LO(N255),
    .O(N13)
  );
  LUT4_L #(
    .INIT ( 16'hFFAE ))
  \pkt_data_mux0000<0>16  (
    .I0(\pkt_data_mux0000<0>5_887 ),
    .I1(N13),
    .I2(N154),
    .I3(pkt_data_cmp_eq0030),
    .LO(\pkt_data_mux0000<0>16_884 )
  );
  LUT3_L #(
    .INIT ( 8'hEA ))
  \pkt_data_mux0000<6>691_SW0_SW0  (
    .I0(pkt_data_cmp_eq0048),
    .I1(pkt_data_cmp_eq0049),
    .I2(RxPacketCount[9]),
    .LO(N158)
  );
  LUT4_L #(
    .INIT ( 16'h8000 ))
  pkt_data_or000733_SW0 (
    .I0(TxAddress[7]),
    .I1(TxAddress[6]),
    .I2(TxAddress[5]),
    .I3(TxAddress[4]),
    .LO(N174)
  );
  LUT4_L #(
    .INIT ( 16'hFFFB ))
  \pkt_data_mux0000<2>34_SW0_SW0  (
    .I0(TxAddress[2]),
    .I1(TxAddress[0]),
    .I2(TxAddress[1]),
    .I3(TxAddress[3]),
    .LO(N176)
  );
  LUT4_L #(
    .INIT ( 16'h0200 ))
  \pkt_data_mux0000<4>14  (
    .I0(TxAddress[3]),
    .I1(TxAddress[1]),
    .I2(TxAddress[0]),
    .I3(TxAddress[2]),
    .LO(\pkt_data_mux0000<4>14_903 )
  );
  LUT4_L #(
    .INIT ( 16'hFFFE ))
  \pkt_data_mux0000<7>26_SW1  (
    .I0(TxAddress[3]),
    .I1(TxAddress[2]),
    .I2(TxAddress[1]),
    .I3(TxAddress[0]),
    .LO(N181)
  );
  LUT4_L #(
    .INIT ( 16'h0F08 ))
  pkt_data_or000779 (
    .I0(N183),
    .I1(TxAddress[5]),
    .I2(TxAddress[10]),
    .I3(pkt_data_or000766_922),
    .LO(pkt_data_or000779_923)
  );
  LUT4_L #(
    .INIT ( 16'h02AA ))
  \pkt_data_mux0000<1>16_SW0  (
    .I0(N8),
    .I1(N15),
    .I2(N178),
    .I3(N191),
    .LO(N150)
  );
  LUT4_L #(
    .INIT ( 16'hFFEA ))
  \pkt_data_mux0000<5>511_SW0_SW0  (
    .I0(\pkt_data_mux0000<5>24_910 ),
    .I1(pkt_data_cmp_eq0049),
    .I2(RxPacketCount[10]),
    .I3(pkt_data_cmp_eq0027),
    .LO(N193)
  );
  LUT4_L #(
    .INIT ( 16'hFFF9 ))
  \pkt_data_mux0000<5>15_SW1  (
    .I0(TxAddress[2]),
    .I1(TxAddress[1]),
    .I2(TxAddress[3]),
    .I3(TxAddress[0]),
    .LO(N195)
  );
  LUT4_L #(
    .INIT ( 16'h090C ))
  \pkt_data_mux0000<6>21  (
    .I0(TxAddress[0]),
    .I1(TxAddress[2]),
    .I2(TxAddress[3]),
    .I3(TxAddress[1]),
    .LO(\pkt_data_mux0000<6>21_912 )
  );
  LUT4_L #(
    .INIT ( 16'h0080 ))
  Rx_SFDdetected45 (
    .I0(N197),
    .I1(RxNewBitAvailable_692),
    .I2(RxPreambleBitsCount[4]),
    .I3(RxFrame_649),
    .LO(Rx_SFDdetected45_752)
  );
  LUT3_L #(
    .INIT ( 8'hF7 ))
  RxGoodPacket_mux0000148_SW0 (
    .I0(RxDataByteIn[4]),
    .I1(RxDataByteIn[5]),
    .I2(RxBitCount[6]),
    .LO(N199)
  );
  LUT4_D #(
    .INIT ( 16'hFE7F ))
  \pkt_data_mux0000<5>4_SW1  (
    .I0(TxAddress[3]),
    .I1(TxAddress[2]),
    .I2(TxAddress[1]),
    .I3(TxAddress[0]),
    .LO(N256),
    .O(N201)
  );
  LUT4_L #(
    .INIT ( 16'hF7FF ))
  \pkt_data_mux0000<3>41_SW0  (
    .I0(TxAddress[1]),
    .I1(TxAddress[0]),
    .I2(TxAddress[2]),
    .I3(RxPacketCount[4]),
    .LO(N203)
  );
  LUT4_L #(
    .INIT ( 16'h0200 ))
  \pkt_data_mux0000<0>33  (
    .I0(N14),
    .I1(N15),
    .I2(N205),
    .I3(N52),
    .LO(\pkt_data_mux0000<0>33_885 )
  );
  LUT4_L #(
    .INIT ( 16'hFFBF ))
  \pkt_data_mux0000<0>5_SW1  (
    .I0(TxAddress[2]),
    .I1(TxAddress[4]),
    .I2(TxAddress[1]),
    .I3(TxAddress[5]),
    .LO(N207)
  );
  LUT4_D #(
    .INIT ( 16'h0010 ))
  pkt_data_cmp_eq00501 (
    .I0(N15),
    .I1(TxAddress[6]),
    .I2(N52),
    .I3(N211),
    .LO(N257),
    .O(pkt_data_cmp_eq0050)
  );
  LUT4_D #(
    .INIT ( 16'h0200 ))
  pkt_data_cmp_eq00481 (
    .I0(N8),
    .I1(TxAddress[4]),
    .I2(N213),
    .I3(TxAddress[5]),
    .LO(N258),
    .O(pkt_data_cmp_eq0048)
  );
  LUT4_L #(
    .INIT ( 16'hAAEA ))
  \pkt_data_mux0000<4>661_SW0_SW0_SW0  (
    .I0(\pkt_data_mux0000<4>21_904 ),
    .I1(N52),
    .I2(N16),
    .I3(N215),
    .LO(N168)
  );
  LUT4_L #(
    .INIT ( 16'hFFBF ))
  CRCflush_mux0000_SW1 (
    .I0(TxAddress[6]),
    .I1(N14),
    .I2(N51),
    .I3(TxAddress[0]),
    .LO(N217)
  );
  LUT4_L #(
    .INIT ( 16'h0200 ))
  \pkt_data_mux0000<1>7_SW0  (
    .I0(N41),
    .I1(TxAddress[2]),
    .I2(TxAddress[1]),
    .I3(TxAddress[0]),
    .LO(N222)
  );
  LUT4_L #(
    .INIT ( 16'hEAAA ))
  \pkt_data_mux0000<2>20  (
    .I0(pkt_data_cmp_eq0029),
    .I1(N13),
    .I2(TxAddress[3]),
    .I3(N229),
    .LO(\pkt_data_mux0000<2>20_892 )
  );
  LUT4_L #(
    .INIT ( 16'hFFEA ))
  \pkt_data_mux0000<7>96_SW0  (
    .I0(pkt_data_or0000_918),
    .I1(N8),
    .I2(\pkt_data_mux0000<7>26_916 ),
    .I3(N231),
    .LO(N170)
  );
  LUT4_L #(
    .INIT ( 16'h2820 ))
  \pkt_data_mux0000<7>2_SW1  (
    .I0(N12),
    .I1(TxAddress[2]),
    .I2(TxAddress[1]),
    .I3(TxAddress[0]),
    .LO(N219)
  );
  LUT4_L #(
    .INIT ( 16'hFFFB ))
  Rx_SFDdetected54_SW1_SW0 (
    .I0(RxDataByteIn[3]),
    .I1(RxDataByteIn[2]),
    .I2(RxDataByteIn[1]),
    .I3(RxDataByteIn[5]),
    .LO(N233)
  );
  SRL16_1 #(
    .INIT ( 16'h0000 ))
  Mshreg_RxInSRn_2 (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CLK(CLK_USB_BUFGP_3),
    .D(\RxInSRn[0] ),
    .Q(Mshreg_RxInSRn_2_332)
  );
  FD_1   RxInSRn_2 (
    .C(CLK_USB_BUFGP_3),
    .D(Mshreg_RxInSRn_2_332),
    .Q(\RxInSRn[2] )
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  Mshreg_RxInSRp_1 (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CLK(CLK_USB_BUFGP_3),
    .D(RxInSRp_xor0000),
    .Q(Mshreg_RxInSRp_1_333)
  );
  FD   RxInSRp_1 (
    .C(CLK_USB_BUFGP_3),
    .D(Mshreg_RxInSRp_1_333),
    .Q(RxInSRp[1])
  );
endmodule


`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

    wire GSR;
    wire GTS;
    wire PRLD;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

