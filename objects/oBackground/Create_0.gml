mode = !global.start;
index = !global.start*8;

backgroundColors = [ #251932,#1C1329,#151022,#0B0A19];
cloudColors = [ #3A264A,#302143,#281D3E,#211A3A,#161433];

if(mode) layer_background_blend(layer_background_get_id(layer_get_id("Background")),backgroundColors[3]);