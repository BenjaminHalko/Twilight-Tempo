mode = !global.start;

backgroundColors = [ #2D1D39,#251932,#1C1329,#151022,#0B0A19];
layer_background_blend(layer_background_get_id(layer_get_id("Background")),backgroundColors[min(4,global.index)]);

