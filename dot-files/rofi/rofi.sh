bg_color=#00FFFFFF          
text_color=#ffffff
htext_color=#B55252

rofi -combi-modi window,drun -show combi -modi combi '' -hide-scrollbar true -lines 3 -eh 1  -padding 30 -bw 0 -color-window "$bg_color, $bg_color, $bg_color" -color-normal "$bg_color, $text_color, $bg_color, $bg_color, $htext_color"
