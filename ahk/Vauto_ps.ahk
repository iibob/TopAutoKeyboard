; PS 自动选择一次。脚本分离出来是因为集合到一个脚本会造成 KeyWait 失效

#NoTrayIcon ; 禁止显示托盘图标

Send "!{Esc}"
sleep 50
Send "v"
sleep 50
Send "{Ctrl down}"
KeyWait "LButton", "D"
sleep 50
Send "{Ctrl up}" 
ExitApp