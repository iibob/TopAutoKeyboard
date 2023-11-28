#Requires AutoHotkey v2.0
#SingleInstance Force ; 强制脚本只能有一个实例在运行
ProcessSetPriority 'B'
MyGui := Gui('+AlwaysOnTop +ToolWindow', 'TopAutoKeyboard')

tabList := ['Code','PY','PS','浏览器','文件夹','其他'] ; 列表元素需要与 procMap 的value对应
version := 'version 1.1.1'
XSize := 280 ; 隐藏后，窗口减小的尺寸。注意不能大于GuiWidth
GuiWidth := 340
GuiHeight := 460
; GuiHeight := 520



Btn51 := MyGui.AddButton('       w50 h30 Default', 'CN/EN')
Btn52 := MyGui.AddButton('yp x+3 wp  hp  Default', 'VPN')
Btn53 := MyGui.AddButton('yp x+3 wp  hp  Default', 'Win')
Btn54 := MyGui.AddButton('yp x+3 wp  hp  Default', 'Esc')
Btn55 := MyGui.AddButton('yp x+3 wp  hp  Default', '剪贴板')
Btn56 := MyGui.AddButton('yp x+3 wp  hp  Default', '任务')
Btn51.OnEvent("Click", cn_en) ; 输入法切换
Btn52.OnEvent("Click", VPN) ; 开启/关闭 VPN
Btn53.OnEvent("Click", win) ; 打开 Win 界面
Btn54.OnEvent("Click", Esc_) ; 退出键
Btn55.OnEvent("Click", winV) ; 打开系统剪贴板
Btn56.OnEvent("Click", taskManager) ; 打开任务管理器

Btn41 := MyGui.AddButton('xm     w50 h30 Default', '文件夹')
Btn42 := MyGui.AddButton('yp x+3 wp  hp  Default', '截屏')
Btn43 := MyGui.AddButton('yp x+3 wp  hp  Default', '贴图')
Btn44 := MyGui.AddButton('yp x+3 wp  hp  Default', 'C↓')
Btn45 := MyGui.AddButton('yp x+3 wp  hp  Default', 'S↓')
Btn46 := MyGui.AddButton('yp x+3 wp  hp  Default', 'CS↓')
Btn41.OnEvent("Click", openAFolder) ; 打开资源管理器
Btn42.OnEvent("Click", btnScreenshot) ; 截屏
Btn43.OnEvent("Click", screenshot_t) ; 显示/隐藏屏幕中的贴图
Btn44.OnEvent("Click", SwitchCtrl) ; 按下/松开 Ctrl
Btn45.OnEvent("Click", SwitchShift) ; 按下/松开 Shift
Btn46.OnEvent("Click", SwitchCtrlShift) ; 按下/松开 Ctrl Shift

Btn31 := MyGui.AddButton('xm     w50 h30 Default', '百度')
Btn32 := MyGui.AddButton('yp x+3 wp  hp  Default', '谷歌')
Btn33 := MyGui.AddButton('yp x+3 wp  hp  Default', '百译')
Btn34 := MyGui.AddButton('yp x+3 wp  hp  Default', '百ocr')
Btn35 := MyGui.AddButton('yp x+3 wp  hp  Default', '微ocr')
Btn36 := MyGui.AddButton('yp x+3 wp  hp  Default', '谷译')
Btn31.OnEvent("Click", search) ; 百度搜索
Btn32.OnEvent("Click", searchGoogle) ; Google 搜索
Btn33.OnEvent("Click", baiduTranslation) ; 百度翻译选中的文本
Btn34.OnEvent("Click", baiduOCR) ; 百度截图翻译
Btn35.OnEvent("Click", WeiOCR) ; 微信截图翻译
Btn36.OnEvent("Click", googleTranslate) ; 谷歌网页翻译

Btn21 := MyGui.AddButton('xm     w50 h30 Default', '上')
Btn22 := MyGui.AddButton('yp x+3 wp  hp  Default', '选')
Btn23 := MyGui.AddButton('yp x+3 wp  hp  Default', '置顶')
Btn24 := MyGui.AddButton('yp x+3 wp  hp  Default', '小')
Btn25 := MyGui.AddButton('yp x+3 wp  hp  Default', '大')
Btn26 := MyGui.AddButton('yp x+3 wp  hp  Default', '选字符')
Btn21.OnEvent("Click", ActivatePreviousWindow) ; 激活上一个窗口
Btn22.OnEvent("Click", SelectWindow) ; 选择窗口
Btn23.OnEvent("Click", topWindow) ; 置顶/取消置顶窗口
Btn24.OnEvent("Click", windowMinimizing) ; 最小化窗口
Btn25.OnEvent("Click", windowMaximizing) ; 最大化/还原窗口
Btn26.OnEvent("Click", selectedText) ; 选择引号间的字符，代码编辑器中使用无效

Btn11 := MyGui.AddButton('xm     w50 h30 Default', '复')
Btn12 := MyGui.AddButton('yp x+3 wp  hp  Default', '粘')
Btn13 := MyGui.AddButton('yp x+3 wp  hp  Default', '全')
Btn14 := MyGui.AddButton('yp x+3 wp  hp  Default', '剪')
Btn15 := MyGui.AddButton('yp x+3 wp  hp  Default', '撤')
Btn16 := MyGui.AddButton('yp x+3 wp  hp  Default', '粘-')
Btn11.OnEvent("Click", btnCopy) ; 复制选中的文本或对象
Btn12.OnEvent("Click", btnPaste) ; 粘贴文本或对象
Btn13.OnEvent("Click", btnAll) ; 全选文本或对象
Btn14.OnEvent("Click", btnCut) ; 剪切文本或对象
Btn15.OnEvent("Click", btnRevoke) ; 撤销先前的操作
Btn16.OnEvent("Click", pasteClearFormat) ; 清除文本格式 粘贴



tabH := 200
tabW := 321
; Tab := MyGui.AddTab3('xm Buttons', tabList) ; Buttons 在控件的顶部创建一系列按钮而不是选项卡
Tab := MyGui.AddTab3('xm w' tabW ' h' tabH, tabList)
Tab.OnEvent("Change", TabChange)
tabBtn11 := MyGui.AddButton('     x+0 w50 h30 Default', '选词')
tabBtn12 := MyGui.AddButton('yp   x+3 wp  hp  Default', '翻译')
tabBtn13 := MyGui.AddButton('yp   x+3 wp  hp  Default', '行↑')
tabBtn14 := MyGui.AddButton('yp   x+3 wp  hp  Default', '行↓')
tabBtn15 := MyGui.AddButton('yp   x+3 wp  hp  Default', '查找')
tabBtn16 := MyGui.AddButton('yp   x+3 wp  hp  Default', '替换')
tabBtn17 := MyGui.AddButton('xm+2 y+3 wp  hp  Default', '删行')
tabBtn18 := MyGui.AddButton('yp   x+3 wp  hp  Default', '注释')
tabBtn11.OnEvent("Click", selectedText_code) ; 选中光标附近的一个单词，可执行多次，更改选区
tabBtn12.OnEvent("Click", translate_code) ; 翻译选中文本
tabBtn13.OnEvent("Click", moveUp_code) ; 整行向上移动
tabBtn14.OnEvent("Click", moveDown_code) ; 整行向下移动
tabBtn15.OnEvent("Click", Find_code) ; 查找
tabBtn16.OnEvent("Click", replace_code) ; 替换
tabBtn17.OnEvent("Click", deleteEntireRow_code) ; 整行删除
tabBtn18.OnEvent("Click", commented_code) ; 注释代码

Tab.UseTab(2)
tabBtn21 := MyGui.AddButton('     x+0 w50 h30 Default', '选词')
tabBtn22 := MyGui.AddButton('yp   x+3 wp  hp  Default', '翻译')
tabBtn23 := MyGui.AddButton('yp   x+3 wp  hp  Default', '替换译')
tabBtn24 := MyGui.AddButton('yp   x+3 wp  hp  Default', '行↑')
tabBtn25 := MyGui.AddButton('yp   x+3 wp  hp  Default', '行↓')
tabBtn26 := MyGui.AddButton('yp   x+3 wp  hp  Default', '删行')
tabBtn27 := MyGui.AddButton('xm+2 y+3 wp  hp  Default', '复制行')
tabBtn28 := MyGui.AddButton('yp   x+3 wp  hp  Default', '注释')
tabBtn21.OnEvent("Click", selectedText_py) ; 选中光标附近的一个单词，可执行多次，更改选区
tabBtn22.OnEvent("Click", translate_py) ; 显示选中文本的翻译
tabBtn23.OnEvent("Click", replaceTranslation_py) ; 替换翻译选中文本
tabBtn24.OnEvent("Click", moveUp_py) ; 整行向上移动
tabBtn25.OnEvent("Click", moveDown_py) ; 整行向下移动
tabBtn26.OnEvent("Click", deleteEntireRow_py) ; 整行删除
tabBtn27.OnEvent("Click", copyEntireRow_py) ; 整行复制
tabBtn28.OnEvent("Click", commented_py) ; 注释代码

Tab.UseTab(3)
tabBtn31 := MyGui.AddButton('     x+0 w50 h30 Default', '图像')
tabBtn32 := MyGui.AddButton('yp   x+3 wp  hp  Default', '画布')
tabBtn33 := MyGui.AddButton('yp   x+3 wp  hp  Default', '保存')
tabBtn34 := MyGui.AddButton('yp   x+3 wp  hp  Default', '另存')
tabBtn35 := MyGui.AddButton('yp   x+3 wp  hp  Default', '放大')
tabBtn36 := MyGui.AddButton('yp   x+3 wp  hp  Default', '缩小')
tabBtn37 := MyGui.AddButton('xm+2 y+3 wp  hp  Default', '全显')
tabBtn38 := MyGui.AddButton('yp   x+3 wp  hp  Default', '等比')
tabBtn31.OnEvent("Click", imageSize_ps) ; 图像大小
tabBtn32.OnEvent("Click", canvasSize_ps) ; 画布大小
tabBtn33.OnEvent("Click", save_ps) ; 保存文件
tabBtn34.OnEvent("Click", saveAs_ps) ; 另存为
tabBtn35.OnEvent("Click", enlarge_ps) ; 放大画布
tabBtn36.OnEvent("Click", narrow_ps) ; 缩小画布
tabBtn37.OnEvent("Click", showAll_ps) ; 缩放至屏幕大小
tabBtn38.OnEvent("Click", equalProportion_ps) ; 1:1 显示

Tab.UseTab(4)
tabBtn41 := MyGui.AddButton('     x+0 w50 h30 Default', '刷新')
tabBtn42 := MyGui.AddButton('yp   x+3 wp  hp  Default', '关闭')
tabBtn43 := MyGui.AddButton('yp   x+3 wp  hp  Default', '密码')
tabBtn44 := MyGui.AddButton('yp   x+3 wp  hp  Default', '新')
tabBtn45 := MyGui.AddButton('yp   x+3 wp  hp  Default', '重开')
tabBtn46 := MyGui.AddButton('yp   x+3 wp  hp  Default', '无痕')
tabBtn47 := MyGui.AddButton('xm+2 y+3 wp  hp  Default', '右')
tabBtn48 := MyGui.AddButton('yp   x+3 wp  hp  Default', '左')
tabBtn41.OnEvent("Click", refresh_chrome) ; 刷新
tabBtn42.OnEvent("Click", close_chrome) ; 关闭选项卡
tabBtn43.OnEvent("Click", password_chrome) ; 打开密码箱
tabBtn44.OnEvent("Click", new_chrome) ; 新建选项卡
tabBtn45.OnEvent("Click", reopen_chrome) ; 重新打开关闭的选项卡
tabBtn46.OnEvent("Click", newTraceless_chrome) ; 新建无痕窗口
tabBtn47.OnEvent("Click", rightTab_chrome) ; 切换到右侧选项卡
tabBtn48.OnEvent("Click", leftTab_chrome) ; 切换到左侧选项卡

Tab.UseTab(5)
tabBtn51 := MyGui.AddButton('     x+0 w50 h30 Default', '关闭')
tabBtn52 := MyGui.AddButton('yp   x+3 wp  hp  Default', '新建')
tabBtn53 := MyGui.AddButton('yp   x+3 wp  hp  Default', '命名')
tabBtn54 := MyGui.AddButton('yp   x+3 wp  hp  Default', 'PS')
tabBtn55 := MyGui.AddButton('yp   x+3 wp  hp  Default', '列')
tabBtn56 := MyGui.AddButton('yp   x+3 wp  hp  Default', '详情')
tabBtn57 := MyGui.AddButton('xm+2 y+3 wp  hp  Default', '大')
tabBtn58 := MyGui.AddButton('yp   x+3 wp  hp  Default', '超大')
tabBtn51.OnEvent("Click", close_explorer) ; 关闭窗口
tabBtn52.OnEvent("Click", newFolder_explorer) ; 新建文件夹
tabBtn53.OnEvent("Click", renameFile_explorer) ; 重命名文件
tabBtn54.OnEvent("Click", psOpenFile_explorer) ; PS 打开文件
tabBtn55.OnEvent("Click", list_explorer) ; 文件查看方式：列表
tabBtn56.OnEvent("Click", information_explorer) ; 文件查看方式：详细信息
tabBtn57.OnEvent("Click", largeIcons_explorer) ; 文件查看方式：大图标
tabBtn58.OnEvent("Click", extraLargeIcons_explorer) ; 文件查看方式：越大图标

Tab.UseTab(6)
MyEdit_y := 213 ; 控件Y轴位置，上方每一行btn控件加间隙的高度为37
MyEdit := MyGui.AddEdit("r11 vMyEdit w" tabW-25)
tabBtn61 := MyGui.AddButton('w100 h30 Default Hidden', '复制原文')
tabBtn62 := MyGui.AddButton('wp   hp  Default Hidden', '复制译文')
moveMyEdit
tabBtn61.OnEvent("Click", copyEnglish) ; 复制原文
tabBtn62.OnEvent("Click", copyChinese) ; 复制译文

Tab.UseTab()  ; 即后续添加的控件将不属于前面那个选项卡控件.



BtnA1 := MyGui.AddButton('xm     w50 h30 Default', '热键on')
BtnA2 := MyGui.AddButton('yp x+3 wp  hp  Default', 'Tab锁')
BtnA3 := MyGui.AddButton('yp x+3 wp  hp  Default', '重启')
BtnA4 := MyGui.AddButton('yp x+3 wp  hp  Default', '退出')
; BtnA5 := MyGui.AddButton('yp x+3 wp  hp  Default', '')
BtnA1.OnEvent("Click", hotkeySwitch) ; 禁用/启用所有的热键和热字串
BtnA2.OnEvent("Click", tabLock_) ; 锁定/解锁Tab选项卡
BtnA3.OnEvent("Click", Reload_) ; 重启脚本
BtnA4.OnEvent("Click", Close_) ; 退出脚本



; 测试用 ---------------------------
; btn001 := MyGui.AddButton('xm w260') ; 当前被激活窗口的进程名称
; btn002 := MyGui.AddButton('xm w260') ; 当前被激活窗口的类名
; 测试用 结束 ---------------------------



SB := MyGui.AddStatusBar(, "条形图的起始文本")
SB.SetText("`t" version)

MyGui.OnEvent("Close", Hide) ; 点击右上角X时，隐藏部分窗口
MyGui.OnEvent("ContextMenu", Hide) ; 鼠标右键点击窗口后隐藏部分窗口

; MyGui.Show("Center NoActivate") ; NoActivate 让当前活动窗口继续保持活动状态.

show := () => MyGui.Show('w' GuiWidth 'h' GuiHeight 'NoActivate') ; NoActivate 让当前活动窗口继续保持活动状态.
SetTimer(update, 250), show()

tabLock := false
update() {
  Global proc := '' ; 进程名
  static procMap := Map('Code','Code','pycharm64','PY','Photoshop','PS','chrome','浏览器','WeChat','文件夹','explorer','文件夹')
  if !tabLock {
    Try If WinGetClass('A') != 'AutoHotkeyGUI' {
      ; btn002.Text := WinGetClass("A")
      last := proc
      proc := SubStr(WinGetProcessName('A'), 1, -4)
      if (last != proc) {
        ; btn001.Text := proc
        procMapValue := procMap.Get(proc, 0) ; Get返回map对应的值，此处的0是查找不到返回的值
        if procMapValue {
          Tab.Text := procMapValue
        } else {
          Tab.Text := '其他'
        }
      }
    }
  }
}


ButtonClickCount := Map() ; 初始化按钮点击次数的对象
UpdateInterval := 7200000  ; 设置每2小时更新的时间间隔，1小时 = 60分钟 * 60秒 * 1000毫秒
SetTimer SaveButtonClickCount, UpdateInterval


; 按钮点击事件处理函数
ButtonClick(buttonName) {
  Value := ButtonClickCount.Get(buttonName, 0) ; 0 是查找不到返回的值

  ; 更新按钮点击次数
  if Value {
    ButtonClickCount[buttonName] += 1
    ; MsgBox buttonName ' ' Value
  } else {
    ButtonClickCount[buttonName] := 1
    ; MsgBox buttonName  ' ' Value
  }
  ; MsgBox buttonName
}

; 保存按钮点击次数到本地文件
SaveButtonClickCount(*) {
  Global ButtonClickCount
  FileName := A_WorkingDir '\ButtonLog.txt'
  FileObj := FileOpen(FileName, "a")
  TimeString := FormatTime('R') ; 当前时间年月日时分秒格式的字符串
  FileObj.Write(TimeString '`n' ButtonClickCountToString())
  FileObj.Close()
  ButtonClickCount := Map() ; 清空按钮点击次数
}

; 将按钮点击次数转换为字符串
ButtonClickCountToString(*) {
    result := ""
    for key, value in ButtonClickCount
        result := result key ": " value "`n"
    return result
}



; 按钮函数 ------------------------------------------------------------------------------------------

btnCopy(*) {
  copy
  ButtonClick('Btn11')
}

copy(*) {
  Send "!{Esc}"
  sleep 150
  Send "^c"
}

btnPaste(*) {
  Send "!{Esc}"
  sleep 150
  Send "^v"
  ButtonClick('Btn12')
}

btnAll(*) {
  Send "!{Esc}"
  sleep 150
  Send "^a"
  ButtonClick('Btn13')
}

btnCut(*) {
  Send "!{Esc}"
  sleep 150
  Send "^x"
  ButtonClick('Btn14')
}

btnRevoke(*) {
  Send "!{Esc}"
  sleep 150
  Send "^z"
  ButtonClick('Btn15')
}

pasteClearFormat(*) {
  Send "!{Esc}"
  A_Clipboard := A_Clipboard
  sleep 150
  Send "^v"
  ButtonClick('Btn16')
}

ActivatePreviousWindow(*) {
  Send "!{Esc}"
  sleep 50
  Send "{Alt down}{Tab}"
  sleep 50
  Send "{Alt up}"
  ButtonClick('Btn21')
}

SelectWindow(*) {
  Send "!{Esc}"
  sleep 50
  Send "{Alt down}{Tab}"
  ButtonClick('Btn22')
}
GroupAdd "AltTabWindow", "ahk_class MultitaskingViewFrame"  ; 仅win10有效
GroupAdd "AltTabWindow", "ahk_class XamlExplorerHostIslandWindow"  ; 仅win11有效
#HotIf WinExist("ahk_group AltTabWindow")
; ~*LButton::Send "{Alt up}"  ; 取消菜单时, 自动释放 Alt 键.
*LButton::Send "{Blind}{LButton}{Alt up}"  ; 如果不使用(~), 则需要发送 LButton 键.
#HotIf

cn_en(*) {
  Send "!{Esc}"
  sleep 50
  Send "{LWin down}{Space}"
  Send "{LWin up}"
  ButtonClick('Btn51')
}

search(*) {
  copy
  sleep 50
  Run "https://www.baidu.com/s?wd=" A_Clipboard
  ButtonClick('Btn31')
}

searchGoogle(*) {
  copy
  sleep 50
  Run "https://www.google.com/search?q=" A_Clipboard
  ButtonClick('Btn32')
}

^Esc::Return ; ^Esc = # 禁用，以避免出现win界面
SwitchCtrl(btn, info) {
  if GetKeyState("Ctrl") {
      Send "{Ctrl up}"
      Send "!{Esc}"
      btn.Opt("-Background") ; 背景色恢复为系统默认值
      btn.text := "C↓"
      SB.SetText("`t" version)
  } else {
      Send "!{Esc}"
      Send "{Ctrl down}"
      btn.Opt("BackgroundRed")
      btn.text := "C↑"
      SB.SetText("`t■■■■■■■■■■ 已按下 Ctrl ■■■■■■■■■■")
  }
  ButtonClick('Btn44')
}

SwitchShift(btn, info) {
  if GetKeyState("Shift") {
      Send "{Shift up}"
      Send "!{Esc}"
      btn.Opt("-Background")
      btn.text := "S↓"
      SB.SetText("`t" version)
  } else {
      Send "!{Esc}"
      Send "{Shift down}"
      btn.Opt("BackgroundRed")
      btn.text := "S↑"
      SB.SetText("`t■■■■■■■■■■ 已按下 Shift ■■■■■■■■■■")
  }
  ButtonClick('Btn45')
}

SwitchCtrlShift(btn, info) {
  If btn.Text  = 'CS↓' {
    btn.Opt("BackgroundRed")
    btn.Text := 'CS↑'
    SB.SetText("`t■■■■■■■■■ 已按下 Ctrl Shift ■■■■■■■■■")
    Send "!{Esc}"
    Send "{Ctrl down}{Shift down}"
  } Else {
    btn.Opt("-Background")
    btn.Text := 'CS↓'
    SB.SetText("`t" version)
    Send "{Ctrl up}{Shift up}"
    Send "!{Esc}"
  }
  ButtonClick('Btn46')
}

btnScreenshot(*) {
  screenshot
  ButtonClick('Btn42')
}

screenshot(*) {
  WinSetTransColor(MyGui.BackColor " 0", MyGui)
  Send '!a'
  sleep 500
  WinSetTransColor(MyGui.BackColor " 255", MyGui)
}

screenshot_t(*) {
  Send '+{f2}'
  ButtonClick('Btn43')
}

baiduTranslation(*) {
  MyEdit.Value := ''
  OnClipboardChange clipChanged_1
  Send "!{Esc}"
	sleep 100
	Send "^c"
	sleep 1000
  OnClipboardChange clipChanged_1, 0 ; 误按时，剪贴板无变化，超时自动退出监测
  ButtonClick('Btn33')
}

clipChanged_1(*) {
	OnClipboardChange clipChanged_1, 0 ; 取消调用函数
	Run A_WorkingDir "\py\app.exe", A_WorkingDir '\py'
  OnClipboardChange clipChanged_2
}

clipChanged_2(*) {
	OnClipboardChange clipChanged_2, 0
  MyEdit.Value := A_Clipboard
  Tab.Text := '其他'
  ; MsgBox A_Clipboard, "翻译"
}

baiduOCR(*) {
  MyEdit.Value := ''
  screenshot
	sleep 100
  OnClipboardChange clipChanged_3
	sleep 10000
  OnClipboardChange clipChanged_3, 0
  ButtonClick('Btn34')
}

clipChanged_3(DataType) {
  OnClipboardChange clipChanged_3, 0
  if DataType = 2 {
		; MsgBox "图片"
    Run A_WorkingDir "\py\app.exe", A_WorkingDir '\py'
    sleep 50
    OnClipboardChange clipChanged_4
    ; translationTesting
  }	else {
    ; MsgBox '字符串'
  }
}

translationTesting(*) {
  sleep 3000
  A_Clipboard := 'abc&+&123'
  ; A_Clipboard := '翻译出错代码:105'
}

clipChanged_4(*) {
	OnClipboardChange clipChanged_4, 0
  Tab.Text := '其他'
  
  if InStr(A_Clipboard, "翻译出错代码") {
    translationErro
	} else if InStr(A_Clipboard, "图片宽度或高度小于30像素") {
    translationErro
	} else if InStr(A_Clipboard, "剪贴板为空") {
    translationErro
	} else {
    Global translationResults := []
		result := StrSplit(A_Clipboard, "&+&")
		all_src := result[1]
		all_dst := result[2]
    MyEdit.Value := all_src '`n`n' all_dst
    tabBtn61.Visible := true
    tabBtn62.Visible := true
    tabBtn61.Move('14',MyEdit_y+145)
    tabBtn62.Move('140',MyEdit_y+145)
    MyEdit.Move('12',MyEdit_y,tabW,tabH-53)
    translationResults := [all_src,all_dst]
		; MsgBox all_src '`n' all_dst, "翻译"
	}
}

translationErro(*) {
  MyEdit.Value := A_Clipboard
  tabBtn61.Visible := false
  tabBtn62.Visible := false
  moveMyEdit
  ; MsgBox A_Clipboard, "出错"
}

moveMyEdit(*) {
  MyEdit.Move('12',MyEdit_y,tabW-1,tabH-23) ; 更改控件的坐标和尺寸(x,y,w,h)
}

copyEnglish(*) {
  A_Clipboard := translationResults[1]
}

copyChinese(*) {
  A_Clipboard := translationResults[2]
}

WeiOCR(*) {
  WinSetTransColor(MyGui.BackColor " 0", MyGui)
  Send '^!+f'
  sleep 500
  WinSetTransColor(MyGui.BackColor " 255", MyGui)
  ButtonClick('Btn35')
}

googleTranslate(*) {
  copy
  sleep 50
  Run "https://translate.google.com.hk/?sl=auto&tl=zh-CN&text=" A_Clipboard "&op=translate"
  ButtonClick('Btn36')
}

openAFolder(*) {
  Send '#e'
  ButtonClick('Btn41')
}

winV(*) {
  Send "!{Esc}"
  sleep 200
  Send "{LWin down}v"
  Send "{LWin up}"
  ButtonClick('Btn55')
}

selectedText(*) {
  Send "!{Esc}"
  static q := Map("'", "'", '‘', '’', '"', '"', '“', '”')
  ; clipSave := ClipboardAll()  ; 把剪贴板保存到变量中
  lFind := false
  rFind := false
  rFind_ := ''
  i := 0
  j := 0
  loop {
    A_Clipboard := '' ; 清空剪贴板
    copyLeft
    ClipWait 1 ; 等待直到剪贴板包含数据，秒数
    clip := A_Clipboard
    i := A_Index
    ; A_Clipboard := clipSave   ; 还原剪贴板
    for lq, rq in q ; 遍历map,lq对应键，rq对应值
      if clip = lq {
        rFind_ := rq
        lFind := true
      }
  } until lFind ; 条件成立时，跳出循环
  SendEvent '{Right ' i '}'
  loop {
    A_Clipboard := ''
    copyRight
    ClipWait 1
    clip := A_Clipboard
    j := A_Index
    if clip = rFind_ {
      rFind := true
    }
  } until rFind
  SendEvent '{Left}'
  SendEvent '{Shift down}{Left ' i+j-2 '}'
  SendEvent '{Shift up}'
  ButtonClick('Btn26')
}
copyLeft(*) {
  ; SetKeyDelay(50, 50) ; SetKeyDelay:Send 发送键击后的延时;松开按键的延时
  SendEvent '{Shift down}{Left}'
  SendEvent '^c'
  SendEvent '{Shift up}{Left}'
}
copyRight(*) {
  SendEvent '{Shift down}{Right}'
  SendEvent '^c'
  SendEvent '{Shift up}{Right}'
}

topWindow(*) {
  ; Send "!{Esc}" ; 此代码无法切换激活置顶的窗口
  Send "{Alt down}{Tab}"
  sleep 50
  Send "{Alt up}"
  sleep 50
	active_id := WinExist('A')
	WinSetAlwaysOnTop -1, "ahk_id " active_id
  ButtonClick('Btn23')
}

windowMinimizing(*) {
  Send "{Alt down}{Tab}"
  sleep 50
  Send "{Alt up}"
  sleep 50 ; 兼容 使置顶窗口最小化
  WinMinimize "A"
  ButtonClick('Btn24')
}

windowMaximizing(*) {
  Send "{Alt down}{Tab}"
  sleep 50
  Send "{Alt up}"
  sleep 50 ; 兼容 使置顶窗口最小化

	if WinGetMinMax("ahk_id " WinExist('A')) ; 获取窗口状态
		WinRestore ; 还原窗口
	else WinMaximize ; 最大化窗口
  ButtonClick('Btn25')
}

win(*) {
  Send '{LWin}'
  ButtonClick('Btn53')
}

VPN(*) {
  Send '!o'
  ButtonClick('Btn52')
}

taskManager(*) {
  Send '^+{Esc}'
  ButtonClick('Btn56')
}

Esc_(*) {
  Send "!{Esc}"
  sleep 50
  Send '{Esc}'
  ButtonClick('Btn54')
}




; Tab 函数 -----------------------------------------------------------------------------------------------

selectedText_code(*) {
  Send "!{Esc}"
  Send '!+{Right}'
  ButtonClick('tabBtn11')
}

deleteEntireRow_code(*) {
  Send "!{Esc}"
  Send "^+K"
  ButtonClick('tabBtn17')
}

translate_code(*) {
  Send "!{Esc}"
  Send '^+t'
  ButtonClick('tabBtn12')
}

moveUp_code(*) {
  Send "!{Esc}"
  Send '!{Up}'
  ButtonClick('tabBtn13')
}

moveDown_code(*) {
  Send "!{Esc}"
  Send '!{Down}'
  ButtonClick('tabBtn14')
}

Find_code(*) {
  Send "!{Esc}"
  Send '^f'
  ButtonClick('tabBtn15')
}

replace_code(*) {
  Send "!{Esc}"
  Send '^h'
  ButtonClick('tabBtn16')
}

commented_code(*) {
  commented
  ButtonClick('tabBtn18')
}

commented(*) {
  Send "!{Esc}"
  Send '^/'
}

selectedText_py(*) {
  Send "!{Esc}"
  Send '^w'
  ButtonClick('tabBtn21')
}

moveUp_py(*) {
  Send "!{Esc}"
  Send '!+{Up}'
  ButtonClick('tabBtn24')
}

moveDown_py(*) {
  Send "!{Esc}"
  Send '!+{Down}'
  ButtonClick('tabBtn25')
}

deleteEntireRow_py(*) {
  Send "!{Esc}"
  Send '^y'
  ButtonClick('tabBtn26')
}

copyEntireRow_py(*) {
  Send "!{Esc}"
  Send '^d'
  ButtonClick('tabBtn27')
}

translate_py(*) {
  Send "!{Esc}"
  Send '^+y'
  ButtonClick('tabBtn22')
}

replaceTranslation_py(*) {
  Send "!{Esc}"
  Send '^+x'
  ButtonClick('tabBtn23')
}

commented_py(*) {
  commented
  ButtonClick('tabBtn28')
}

imageSize_ps(*) {
  Send "!{Esc}"
  Send "^!i"
  ButtonClick('tabBtn31')
}

canvasSize_ps(*) {
  Send "!{Esc}"
  Send '^!c'
  ButtonClick('tabBtn32')
}

save_ps(*) {
  Send "!{Esc}"
  Send '^s'
  ButtonClick('tabBtn33')
}

saveAs_ps(*) {
  Send "!{Esc}"
  Send '^+s'
  ButtonClick('tabBtn34')
}

enlarge_ps(*) {
  Send "!{Esc}"
  Send '^{NumpadAdd}'
  ButtonClick('tabBtn35')
}

narrow_ps(*) {
  Send "!{Esc}"
  Send '^{NumpadSub}'
  ButtonClick('tabBtn36')
}

showAll_ps(*) {
  Send "!{Esc}"
  Send '^0'
  ButtonClick('tabBtn37')
}

equalProportion_ps(*) {
  Send "!{Esc}"
  Send '^1'
  ButtonClick('tabBtn38')
}

refresh_chrome(*) {
  Send "!{Esc}"
  Send '^r'
  ButtonClick('tabBtn41')
}

close_chrome(*) {
  close
  ButtonClick('tabBtn42')
}

close(*) {
  Send "!{Esc}"
  Send '^w'
}

password_chrome(*) {
  Send "!{Esc}"
  Send '^+l'
  ButtonClick('tabBtn43')
}

new_chrome(*) {
  Send "!{Esc}"
  Send '^t'
  ButtonClick('tabBtn44')
}

reopen_chrome(*) {
  Send "!{Esc}"
  Send '^+t'
  ButtonClick('tabBtn45')
}

newTraceless_chrome(*) {
  Send "!{Esc}"
  Send '^+n'
  ButtonClick('tabBtn46')
}

rightTab_chrome(*) {
  Send "!{Esc}"
  Send '^{Tab}'
  ButtonClick('tabBtn47')
}

leftTab_chrome(*) {
  Send "!{Esc}"
  Send '^+{Tab}'
  ButtonClick('tabBtn48')
}

close_explorer(*) {
  close
  ButtonClick('tabBtn51')
}

newFolder_explorer(*) {
  Send "!{Esc}"
  Send '^+n'
  ButtonClick('tabBtn52')
}

renameFile_explorer(*) {
  Send "!{Esc}"
  Send '{f2}'
  ButtonClick('tabBtn53')
}

psOpenFile_explorer(*) {
  Send "!{Esc}"
  Send '{AppsKey}p'
  ButtonClick('tabBtn54')
}

list_explorer(*) {
  Send "!{Esc}"
  Send '^!5'
  ButtonClick('tabBtn55')
}

information_explorer(*) {
  Send "!{Esc}"
  Send '^!6'
  ButtonClick('tabBtn56')
}

largeIcons_explorer(*) {
  Send "!{Esc}"
  Send '^!2'
  ButtonClick('tabBtn57')
}

extraLargeIcons_explorer(*) {
  Send "!{Esc}"
  Send '^!1'
  ButtonClick('tabBtn58')
}



; GUI 函数 ---------------------------------------------------------------------------------------------------------

Close_(*) {
  ExitApp
}

Reload_(*) {
  Reload
}

hotkeySwitch(btn, info) {
  Send "!{Esc}"
  If btn.Text  = '热键on' {
    Suspend
    btn.Opt("BackgroundRed")
    btn.Text := '热键off'
  } Else {
    Suspend
    btn.Opt("-Background")
    btn.Text := '热键on'
    }
  ButtonClick('热键开关')
}


Hide(*) {
  static HideWindow := false
  if HideWindow {
    MyGui.GetClientPos(&X, &Y, &W, &H)
    HideWindow := false
    MyGui.Title := 'TopAutoKeyboard'
    SB.Visible := !SB.Visible
    Btn51.Visible := !Btn51.Visible
    WinSetTransColor(MyGui.BackColor " 255", MyGui) ; 界面半透明（0-255）
    MyGui.show('x' X-XSize-8 'w' GuiWidth 'h' GuiHeight)
  } else {
    MyGui.GetClientPos(&X, &Y, &W, &H)
    HideWindow := true
    MyGui.Title := ''
    SB.Visible := !SB.Visible
    Btn51.Visible := !Btn51.Visible
    WinSetTransColor(MyGui.BackColor " 100", MyGui)
    MyGui.show('x' X+XSize-8 'w' GuiWidth-XSize 'h30')
  }
  return true ; 阻止窗口被隐藏(点击右上角X时)
}

TabChange(*) {
  proc := Tab.Text
  ; btn001.Text := Tab.Text
}

tabLock_(btn, info) {
  Send "!{Esc}"
  Global tabLock
  If btn.Text  = 'Tab锁' {
    tabLock := true
    btn.Opt("BackgroundRed")
    btn.Text := 'Tab已锁'
  } Else {
    tabLock := false
    btn.Opt("-Background")
    btn.Text := 'Tab锁'
  }
  ButtonClick('Tab锁')
}



; 按键功能（全局生效）---------------------------------------------------------------------------------------------

LCtrl::LWin ; 左ctrl → 左win
LWin::LAlt ; 左win → 左alt
LAlt::LCtrl ; 左alt → 左ctrl

AppsKey::RButton ; 菜单键 → 鼠标右键
CapsLock::RButton ; 大写锁定 → 鼠标右键

Ins::return ; Ins 按键失效

^F1::Run "notepad" ; Ctrl F1：打开记事本

; 输入法中英文键盘切换
NumLock::{
  Send "{Ctrl down}{Space}"
  Send "{Ctrl up}"
}



; 输入法切换（全局生效） -------------------------------------------------------------------------------------------
firstPress := false
$/::{
  ; 单击时firstPress为真，延时1000
  ; 时限内再次按下（After函数未触发），更新延时为1，立即执行函数，firstPress更改为假

  Global firstPress
  firstPress := !firstPress
  SetTimer(After, firstPress ? -300 : -1)

  ; KeyWait('/') ; 等待松开按键，避免长按触发。（与按键本身特性有关，所以仅部分按键生效）
}

$a::
$b::
$c::
$d::
$e::
$f::
$g::
$h::
$i::
$j::
$k::
$l::
$m::
$n::
$o::
$p::
$q::
$r::
$s::
$t::
$u::
$v::
$w::
$x::
$y::
$z::key(ThisHotkey)

key(ThisHotkey) {
  if A_PriorHotkey = '$/' and firstPress {
      SetTimer(After, -1)
      sleep 100
  }
  Key := SubStr(ThisHotkey,2)
  send Key
}

After() {
  Global firstPress
  if firstPress {
      Send "{LWin down}{Space}"
      Send "{LWin up}"
  } else {
      send '/'
  }
  firstPress := false
}



; 按键功能（局部生效） ---------------------------------------------------------------------------------------------

; 创建只有在指定程序处于活动状态时才生效的热键，使用ahk_exe指定进程名 
#HotIf WinActive("ahk_exe Photoshop.exe")
.::Send "^v"
,::{
  Send "{F1}"
  sleep 50
  Send "^c"
  sleep 50
  Send "{Enter}"
  sleep 50
  Send "^+!s"
  sleep 200
  Send "{Enter}"
}
RAlt::^+!s  ; 右alt → 保存web图片


; 按组使热键生效
GroupAdd 'copy123', "ahk_exe Photoshop.exe"
GroupAdd 'copy123', "ahk_exe notepad.exe"
GroupAdd 'copy123', "ahk_exe Code.exe"
GroupAdd 'copy123', "ahk_exe pycharm64.exe"
GroupAdd 'copy123', "ahk_exe explorer.exe"
GroupAdd 'copy123', "ahk_exe chrome.exe"
GroupAdd 'copy123', "ahk_exe DingTalk.exe"
GroupAdd 'copy123', "ahk_exe WeChat.exe"
GroupAdd 'copy123', "ahk_exe AutoHotkey64.exe"
GroupAdd 'copy123', "ahk_exe wps.exe"
#HotIf WinActive("ahk_group copy123")
1::Send "^c"
2::Send "^v"
3::Send "^x"


#HotIf WinActive("ahk_exe explorer.exe")
F1::return


; #HotIf 指令会影响脚本中在它后面的所有热键和热字串, 直到下一个 #HotIf 指令
#HotIf
