#Requires AutoHotkey v2.0
#SingleInstance Force ; 强制脚本只能有一个实例在运行
ProcessSetPriority 'B'
MyGui := Gui('+AlwaysOnTop +ToolWindow', 'TopAutoKeyboard')

tabList := ['Code','PY','PS','浏览器','文件夹','其他'] ; 列表元素需要与 procMap 的value对应
version := 'version 1.1.2'
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
tabBtn1_1 := MyGui.AddButton('     x+0 w50 h30 Default', '选词')
tabBtn1_2 := MyGui.AddButton('yp   x+3 wp  hp  Default', '翻译')
tabBtn1_3 := MyGui.AddButton('yp   x+3 wp  hp  Default', '行↑')
tabBtn1_4 := MyGui.AddButton('yp   x+3 wp  hp  Default', '行↓')
tabBtn1_5 := MyGui.AddButton('yp   x+3 wp  hp  Default', '查找')
tabBtn1_6 := MyGui.AddButton('yp   x+3 wp  hp  Default', '替换')
tabBtn1_7 := MyGui.AddButton('xm+2 y+3 wp  hp  Default', '删行')
tabBtn1_8 := MyGui.AddButton('yp   x+3 wp  hp  Default', '注释')
tabBtn1_1.OnEvent("Click", selectedText_code) ; 选中光标附近的一个单词，可执行多次，更改选区
tabBtn1_2.OnEvent("Click", translate_code) ; 翻译选中文本
tabBtn1_3.OnEvent("Click", moveUp_code) ; 整行向上移动
tabBtn1_4.OnEvent("Click", moveDown_code) ; 整行向下移动
tabBtn1_5.OnEvent("Click", Find_code) ; 查找
tabBtn1_6.OnEvent("Click", replace_code) ; 替换
tabBtn1_7.OnEvent("Click", deleteEntireRow_code) ; 整行删除
tabBtn1_8.OnEvent("Click", commented_code) ; 注释代码

Tab.UseTab(2)
tabBtn2_1 := MyGui.AddButton('     x+0 w50 h30 Default', '选词')
tabBtn2_2 := MyGui.AddButton('yp   x+3 wp  hp  Default', '翻译')
tabBtn2_3 := MyGui.AddButton('yp   x+3 wp  hp  Default', '替换译')
tabBtn2_4 := MyGui.AddButton('yp   x+3 wp  hp  Default', '行↑')
tabBtn2_5 := MyGui.AddButton('yp   x+3 wp  hp  Default', '行↓')
tabBtn2_6 := MyGui.AddButton('yp   x+3 wp  hp  Default', '删行')
tabBtn2_7 := MyGui.AddButton('xm+2 y+3 wp  hp  Default', '复制行')
tabBtn2_8 := MyGui.AddButton('yp   x+3 wp  hp  Default', '注释')
tabBtn2_1.OnEvent("Click", selectedText_py) ; 选中光标附近的一个单词，可执行多次，更改选区
tabBtn2_2.OnEvent("Click", translate_py) ; 显示选中文本的翻译
tabBtn2_3.OnEvent("Click", replaceTranslation_py) ; 替换翻译选中文本
tabBtn2_4.OnEvent("Click", moveUp_py) ; 整行向上移动
tabBtn2_5.OnEvent("Click", moveDown_py) ; 整行向下移动
tabBtn2_6.OnEvent("Click", deleteEntireRow_py) ; 整行删除
tabBtn2_7.OnEvent("Click", copyEntireRow_py) ; 整行复制
tabBtn2_8.OnEvent("Click", commented_py) ; 注释代码

Tab.UseTab(3)
tabBtn3_1 := MyGui.AddButton('     x+0 w50 h30 Default', '图像')
tabBtn3_2 := MyGui.AddButton('yp   x+3 wp  hp  Default', '画布')
tabBtn3_3 := MyGui.AddButton('yp   x+3 wp  hp  Default', '保存')
tabBtn3_4 := MyGui.AddButton('yp   x+3 wp  hp  Default', '另存')
tabBtn3_5 := MyGui.AddButton('yp   x+3 wp  hp  Default', '放大')
tabBtn3_6 := MyGui.AddButton('yp   x+3 wp  hp  Default', '缩小')
tabBtn3_7 := MyGui.AddButton('xm+2 y+3 wp  hp  Default', '全显')
tabBtn3_8 := MyGui.AddButton('yp   x+3 wp  hp  Default', '等比')
tabBtn3_9 := MyGui.AddButton('yp   x+3 wp  hp  Default', '取选')
tabBtn3_10 := MyGui.AddButton('yp   x+3 wp  hp  Default', '变换')
tabBtn3_11 := MyGui.AddButton('yp   x+3 wp  hp  Default', '命名')
tabBtn3_12 := MyGui.AddButton('yp   x+3 wp  hp  Default', '标尺')
tabBtn3_13 := MyGui.AddButton('xm+2 y+3 wp  hp  Default', '复名')
tabBtn3_14 := MyGui.AddButton('yp   x+3 wp  hp  Default', '粘名')
tabBtn3_15 := MyGui.AddButton('yp   x+3 wp  hp  Default', '剪蒙')
tabBtn3_16 := MyGui.AddButton('yp   x+3 wp  hp  Default', '选区蒙')
tabBtn3_17 := MyGui.AddButton('yp   x+3 wp  hp  Default', '图层蒙')
tabBtn3_18 := MyGui.AddButton('yp   x+3 wp  hp  Default', '参考线')
tabBtn3_19 := MyGui.AddButton('xm+2 y+3 wp  hp  Default', '复制到')
tabBtn3_20 := MyGui.AddButton('yp   x+3 wp  hp  Default', '关闭')
tabBtn3_21 := MyGui.AddButton('yp   x+3 wp  hp  Default', '移动')
tabBtn3_22 := MyGui.AddButton('yp   x+3 wp  hp  Default', '自选')
tabBtn3_23 := MyGui.AddButton('yp   x+3 wp  hp  Default', '选区')
tabBtn3_24 := MyGui.AddButton('yp   x+3 wp  hp  Default', 'CJ')
tabBtn3_25 := MyGui.AddButton('xm+2 y+3 wp  hp  Default', '↑')
tabBtn3_27 := MyGui.AddButton('yp   x+3 wp  hp  Default', '↓')
tabBtn3_26 := MyGui.AddButton('yp   x+3 wp  hp  Default', 'V')
tabBtn3_29 := MyGui.AddButton('yp   x+3 wp  hp  Default', 'H')
tabBtn3_28 := MyGui.AddButton('yp   x+3 wp  hp  Default', '←')
tabBtn3_30 := MyGui.AddButton('yp   x+3 wp  hp  Default', '→')
tabBtn3_1.OnEvent("Click", imageSize_ps) ; 图像大小
tabBtn3_2.OnEvent("Click", canvasSize_ps) ; 画布大小
tabBtn3_3.OnEvent("Click", save_ps) ; 保存文件
tabBtn3_4.OnEvent("Click", saveAs_ps) ; 另存为
tabBtn3_5.OnEvent("Click", enlarge_ps) ; 放大画布
tabBtn3_6.OnEvent("Click", narrow_ps) ; 缩小画布
tabBtn3_7.OnEvent("Click", showAll_ps) ; 缩放至屏幕大小
tabBtn3_8.OnEvent("Click", equalProportion_ps) ; 1:1 显示
tabBtn3_9.OnEvent("Click", deselect_ps) ; 取消选择
tabBtn3_10.OnEvent("Click", CtrlT_ps) ; 变换
tabBtn3_11.OnEvent("Click", rename_ps) ; 图层重命名
tabBtn3_12.OnEvent("Click", ruler_ps) ; 标尺
tabBtn3_13.OnEvent("Click", copyName_ps) ; 复制图层名
tabBtn3_14.OnEvent("Click", pasteName_ps) ; 粘贴图层名
tabBtn3_15.OnEvent("Click", clippingMask_ps) ; 剪贴蒙版
tabBtn3_16.OnEvent("Click", constituencyMask_ps) ; 从选区新建图层蒙版
tabBtn3_17.OnEvent("Click", layerMask_ps) ; 新建图层蒙版
tabBtn3_18.OnEvent("Click", referenceLine_ps) ; 参考线
tabBtn3_19.OnEvent("Click", copy_ps) ; 复制图层或组到指定文档
tabBtn3_20.OnEvent("Click", close_ps) ; 关闭文档
tabBtn3_21.OnEvent("Click", v_ps) ; 移动
tabBtn3_22.OnEvent("Click", Vauto_ps) ; 自动选择一次
tabBtn3_23.OnEvent("Click", m_ps) ; 选区
tabBtn3_24.OnEvent("Click", CJ_ps) ; 通过拷贝新建图层
tabBtn3_25.OnEvent("Click", topAlignment_ps) ; 顶对齐
tabBtn3_27.OnEvent("Click", bottom_ps) ; 底对齐
tabBtn3_26.OnEvent("Click", alignVerticalCenter_ps) ; 垂直居中对齐
tabBtn3_29.OnEvent("Click", alignHorizontalCenter_ps) ; 水平居中对齐
tabBtn3_28.OnEvent("Click", leftAligned_ps) ; 左对齐
tabBtn3_30.OnEvent("Click", rightAligned_ps) ; 右对齐

Tab.UseTab(4)
tabBtn4_1 := MyGui.AddButton('     x+0 w50 h30 Default', '刷新')
tabBtn4_2 := MyGui.AddButton('yp   x+3 wp  hp  Default', '关闭')
tabBtn4_3 := MyGui.AddButton('yp   x+3 wp  hp  Default', '密码')
tabBtn4_4 := MyGui.AddButton('yp   x+3 wp  hp  Default', '新')
tabBtn4_5 := MyGui.AddButton('yp   x+3 wp  hp  Default', '重开')
tabBtn4_6 := MyGui.AddButton('yp   x+3 wp  hp  Default', '无痕')
tabBtn4_7 := MyGui.AddButton('xm+2 y+3 wp  hp  Default', '右')
tabBtn4_8 := MyGui.AddButton('yp   x+3 wp  hp  Default', '左')
tabBtn4_1.OnEvent("Click", refresh_chrome) ; 刷新
tabBtn4_2.OnEvent("Click", close_chrome) ; 关闭选项卡
tabBtn4_3.OnEvent("Click", password_chrome) ; 打开密码箱
tabBtn4_4.OnEvent("Click", new_chrome) ; 新建选项卡
tabBtn4_5.OnEvent("Click", reopen_chrome) ; 重新打开关闭的选项卡
tabBtn4_6.OnEvent("Click", newTraceless_chrome) ; 新建无痕窗口
tabBtn4_7.OnEvent("Click", rightTab_chrome) ; 切换到右侧选项卡
tabBtn4_8.OnEvent("Click", leftTab_chrome) ; 切换到左侧选项卡

Tab.UseTab(5)
tabBtn5_1 := MyGui.AddButton('     x+0 w50 h30 Default', '关闭')
tabBtn5_2 := MyGui.AddButton('yp   x+3 wp  hp  Default', '新夹')
tabBtn5_3 := MyGui.AddButton('yp   x+3 wp  hp  Default', '命名')
tabBtn5_4 := MyGui.AddButton('yp   x+3 wp  hp  Default', 'PS')
tabBtn5_5 := MyGui.AddButton('yp   x+3 wp  hp  Default', '列')
tabBtn5_6 := MyGui.AddButton('yp   x+3 wp  hp  Default', '详情')
tabBtn5_7 := MyGui.AddButton('xm+2 y+3 wp  hp  Default', '大')
tabBtn5_8 := MyGui.AddButton('yp   x+3 wp  hp  Default', '超大')
tabBtn5_9 := MyGui.AddButton('yp   x+3 wp  hp  Default', '保存')
tabBtn5_10 := MyGui.AddButton('yp   x+3 wp  hp  Default', '新txt')
tabBtn5_11 := MyGui.AddButton('yp   x+3 wp  hp  Default', '上级')
tabBtn5_1.OnEvent("Click", close_explorer) ; 关闭窗口
tabBtn5_2.OnEvent("Click", newFolder_explorer) ; 新建文件夹
tabBtn5_3.OnEvent("Click", renameFile_explorer) ; 重命名文件
tabBtn5_4.OnEvent("Click", psOpenFile_explorer) ; PS 打开文件
tabBtn5_5.OnEvent("Click", list_explorer) ; 文件查看方式：列表
tabBtn5_6.OnEvent("Click", information_explorer) ; 文件查看方式：详细信息
tabBtn5_7.OnEvent("Click", largeIcons_explorer) ; 文件查看方式：大图标
tabBtn5_8.OnEvent("Click", extraLargeIcons_explorer) ; 文件查看方式：越大图标
tabBtn5_9.OnEvent("Click", save_explorer) ; 保存文件
tabBtn5_10.OnEvent("Click", newTxt_explorer) ; 当前目录新建TXT
tabBtn5_11.OnEvent("Click", returnToThePreviousLevelDirectory_explorer) ; 返回上一级目录

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
BtnA5 := MyGui.AddButton('yp x+3 wp  hp  Default', '记事本')
BtnA6 := MyGui.AddButton('yp x+3 wp  hp  Default', '浏览器')
BtnA1.OnEvent("Click", hotkeySwitch) ; 禁用/启用所有的热键和热字串
BtnA2.OnEvent("Click", tabLock_) ; 锁定/解锁Tab选项卡
BtnA3.OnEvent("Click", Reload_) ; 重启脚本
BtnA4.OnEvent("Click", Close_) ; 退出脚本
BtnA5.OnEvent("Click", openNotepad) ; 打开记事本
BtnA6.OnEvent("Click", openBrowser) ; 打开浏览器



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
  static procMap := Map('Code','Code','pycharm64','PY','Photoshop','PS','Illustrator','PS','chrome','浏览器','WeChat','文件夹','explorer','文件夹','2345PicViewer','文件夹','wps','文件夹','notepad','文件夹')
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



; 自定义托盘菜单 ---------------------------------------------------------------------------------------

Tray := A_TrayMenu
Tray.Delete("&Open")
Tray.Delete("&Help")
Tray.Delete("&Window Spy")
Tray.Delete("&Edit Script")
Tray.Delete("3&")
Tray.Rename("&Reload Script" , "重载脚本")
Tray.Rename("&Suspend Hotkeys" , "挂起热键")
Tray.Rename("&Pause Script" , "暂停脚本")
Tray.Insert("1&", "显示主程序", displayMainProgram)
Tray.Insert("6&",) ; 添加分隔线

displayMainProgram(*) {
    WinActivate "TopAutoKeyboard"
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

openNotepad(*) {
  Run "notepad"
  ButtonClick('BtnA5')
}

openBrowser(*) {
  if WinExist("ahk_exe chrome.exe")
    WinActivate
  else
    Run "C:\Program Files\Google\Chrome\Application\chrome.exe"
  ButtonClick('BtnA6')
}



; Tab 函数 -----------------------------------------------------------------------------------------------

selectedText_code(*) {
  Send "!{Esc}"
  Send '!+{Right}'
  ButtonClick('tabBtn1_1')
}

deleteEntireRow_code(*) {
  Send "!{Esc}"
  Send "^+K"
  ButtonClick('tabBtn1_7')
}

translate_code(*) {
  Send "!{Esc}"
  Send '^+t'
  ButtonClick('tabBtn1_2')
}

moveUp_code(*) {
  Send "!{Esc}"
  Send '!{Up}'
  ButtonClick('tabBtn1_3')
}

moveDown_code(*) {
  Send "!{Esc}"
  Send '!{Down}'
  ButtonClick('tabBtn1_4')
}

Find_code(*) {
  Send "!{Esc}"
  Send '^f'
  ButtonClick('tabBtn1_5')
}

replace_code(*) {
  Send "!{Esc}"
  Send '^h'
  ButtonClick('tabBtn1_6')
}

commented_code(*) {
  commented
  ButtonClick('tabBtn1_8')
}

commented(*) {
  Send "!{Esc}"
  Send '^/'
}

selectedText_py(*) {
  Send "!{Esc}"
  Send '^w'
  ButtonClick('tabBtn2_1')
}

moveUp_py(*) {
  Send "!{Esc}"
  Send '!+{Up}'
  ButtonClick('tabBtn2_4')
}

moveDown_py(*) {
  Send "!{Esc}"
  Send '!+{Down}'
  ButtonClick('tabBtn2_5')
}

deleteEntireRow_py(*) {
  Send "!{Esc}"
  Send '^y'
  ButtonClick('tabBtn2_6')
}

copyEntireRow_py(*) {
  Send "!{Esc}"
  Send '^d'
  ButtonClick('tabBtn2_7')
}

translate_py(*) {
  Send "!{Esc}"
  Send '^+y'
  ButtonClick('tabBtn2_2')
}

replaceTranslation_py(*) {
  Send "!{Esc}"
  Send '^+x'
  ButtonClick('tabBtn2_3')
}

commented_py(*) {
  commented
  ButtonClick('tabBtn2_8')
}

imageSize_ps(*) {
  Send "!{Esc}"
  Send "^!i"
  ButtonClick('tabBtn3_1')
}

canvasSize_ps(*) {
  Send "!{Esc}"
  Send '^!c'
  ButtonClick('tabBtn3_2')
}

save_ps(*) {
  Send "!{Esc}"
  Send '^s'
  ButtonClick('tabBtn3_3')
}

saveAs_ps(*) {
  Send "!{Esc}"
  Send '^+s'
  ButtonClick('tabBtn3_4')
}

enlarge_ps(*) {
  Send "!{Esc}"
  Send '^{NumpadAdd}'
  ButtonClick('tabBtn3_5')
}

narrow_ps(*) {
  Send "!{Esc}"
  Send '^{NumpadSub}'
  ButtonClick('tabBtn3_6')
}

showAll_ps(*) {
  Send "!{Esc}"
  Send '^0'
  ButtonClick('tabBtn3_7')
}

equalProportion_ps(*) {
  Send "!{Esc}"
  Send '^1'
  ButtonClick('tabBtn3_8')
}

deselect_ps(*) {
  Send "!{Esc}"
  Send '^d'
  ButtonClick('tabBtn3_9')
}

CtrlT_ps(*) {
  Send "!{Esc}"
  Send '^t'
  ButtonClick('tabBtn3_10')
}

rename_ps(*) {
  Send "!{Esc}"
  Send '{F1}'
  ButtonClick('tabBtn3_11')
}

ruler_ps(*) {
  Send "!{Esc}"
  Send "^r"
  ButtonClick('tabBtn3_12')
}

copyName_ps(*) {
  Send "!{Esc}"
  sleep 50
  Send "{F1}"
  sleep 50
  Send "^c"
  sleep 50
  Send "{Enter}"
  ButtonClick('tabBtn3_13')
}

pasteName_ps(*) {
  Send "!{Esc}"
  sleep 50
  Send "{F1}"
  sleep 50
  Send "^v"
  sleep 50
  Send "{Enter}"
  ButtonClick('tabBtn3_14')
}

clippingMask_ps(*) {
  Send "!{Esc}"
  Send '^!g'
  ; Send "{Ctrl down}{Alt down}g"
  ; Send "{Ctrl up}{Alt up}"
  ButtonClick('tabBtn3_15')
}

constituencyMask_ps(*) {
  Send "!{Esc}"
  Send "^'"
  ButtonClick('tabBtn3_16')
}

layerMask_ps(*) {
  Send "!{Esc}"
  Send "^+/"
  ButtonClick('tabBtn3_17')
}

referenceLine_ps(*) {
  Send "!{Esc}"
  Send "^;"
  ButtonClick('tabBtn3_18')
}

copy_ps(*) {
  Send "!{Esc}"
  Send "{F8}"
  ButtonClick('tabBtn3_19')
}

close_ps(*) {
  close
  ButtonClick('tabBtn3_20')
}

v_ps(*) {
  Send "!{Esc}"
  Send "v"
  ButtonClick('tabBtn3_21')
}

Vauto_ps(*) {
  Run A_WorkingDir "\Vauto_ps.ahk"
  ButtonClick('tabBtn3_22')
}

m_ps(*) {
  Send "!{Esc}"
  Send "m"
  ButtonClick('tabBtn3_23')
}

CJ_ps(*) {
  Send "!{Esc}"
  Send "^j"
  ButtonClick('tabBtn3_24')
}

topAlignment_ps(*) {
  Send "!{Esc}"
  Send "{F11}"
  ButtonClick('tabBtn3_25')
}

alignVerticalCenter_ps(*) {
  Send "!{Esc}"
  Send "{F10}"
  ButtonClick('tabBtn3_26')
}

bottom_ps(*) {
  Send "!{Esc}"
  Send "{F12}"
  ButtonClick('tabBtn3_27')
}

leftAligned_ps(*) {
  Send "!{Esc}"
  Send "^{F11}"
  ButtonClick('tabBtn3_28')
}

alignHorizontalCenter_ps(*) {
  Send "!{Esc}"
  Send "{F9}"
  ButtonClick('tabBtn3_29')
}

rightAligned_ps(*) {
  Send "!{Esc}"
  Send "^{F12}"
  ButtonClick('tabBtn3_30')
}

refresh_chrome(*) {
  Send "!{Esc}"
  Send '^r'
  ButtonClick('tabBtn4_1')
}

close_chrome(*) {
  close
  ButtonClick('tabBtn4_2')
}

close(*) {
  Send "!{Esc}"
  Send '^w'
}

password_chrome(*) {
  Send "!{Esc}"
  Send '^+l'
  ButtonClick('tabBtn4_3')
}

new_chrome(*) {
  Send "!{Esc}"
  Send '^t'
  ButtonClick('tabBtn4_4')
}

reopen_chrome(*) {
  Send "!{Esc}"
  Send '^+t'
  ButtonClick('tabBtn4_5')
}

newTraceless_chrome(*) {
  Send "!{Esc}"
  Send '^+n'
  ButtonClick('tabBtn4_6')
}

rightTab_chrome(*) {
  Send "!{Esc}"
  Send '^{Tab}'
  ButtonClick('tabBtn4_7')
}

leftTab_chrome(*) {
  Send "!{Esc}"
  Send '^+{Tab}'
  ButtonClick('tabBtn4_8')
}

close_explorer(*) {
  close
  ButtonClick('tabBtn5_1')
}

newFolder_explorer(*) {
  Send "!{Esc}"
  Send '^+n'
  ButtonClick('tabBtn5_2')
}

renameFile_explorer(*) {
  Send "!{Esc}"
  Send '{f2}'
  ButtonClick('tabBtn5_3')
}

psOpenFile_explorer(*) {
  Send "!{Esc}"
  Send '{AppsKey}p'
  ButtonClick('tabBtn5_4')
}

list_explorer(*) {
  Send "!{Esc}"
  Send '^!5'
  ButtonClick('tabBtn5_5')
}

information_explorer(*) {
  Send "!{Esc}"
  Send '^!6'
  ButtonClick('tabBtn5_6')
}

largeIcons_explorer(*) {
  Send "!{Esc}"
  Send '^!2'
  ButtonClick('tabBtn5_7')
}

extraLargeIcons_explorer(*) {
  Send "!{Esc}"
  Send '^!1'
  ButtonClick('tabBtn5_8')
}

save_explorer(*) {
  Send "!{Esc}"
  Send '^s'
  ButtonClick('tabBtn5_9')
}

newTxt_explorer(*) {
  ; 无法在电脑桌面新建txt，必须是目录才行。
  Send "!{Esc}"
  path := explorerGetPath()
  if path {
    stem  := path '\temp' FormatTime(, 'yyMMdd_HHmm') '_' ; 文件路径
    index := 1
    Loop
    filePath := Format('{}{:03}.txt', stem, index++) ; 附加唯一的3位数字
    Until !FileExist(filePath)
    FileAppend '', filePath ; 创建文件
    ButtonClick('tabBtn5_10')
  }
}
explorerGetPath(hwnd := 0) {
  ; Static winTitle := 'ahk_class CabinetWClass'
  ; hWnd ?    explorerHwnd := WinExist(winTitle ' ahk_id ' hwnd)
  ;      : ((!explorerHwnd := WinActive(winTitle)) && explorerHwnd := WinExist(winTitle))

  explorerHwnd := WinActive('ahk_class CabinetWClass') ; 检查指定的窗口是否激活
  If explorerHwnd
   For window in ComObject('Shell.Application').Windows
    Try If window && window.hwnd && window.hwnd = explorerHwnd
     Return window.Document.Folder.Self.Path
  Return False
}

returnToThePreviousLevelDirectory_explorer(*) {
  Send "!{Esc}"
  Send '!{Up}'
  ButtonClick('tabBtn5_11')
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

; Ins::return ; Ins 按键失效
Ins::{
  send '{Esc}'
}

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
GroupAdd 'copy123', "ahk_exe Illustrator.exe"
GroupAdd 'copy123', "ahk_exe notepad.exe"
GroupAdd 'copy123', "ahk_exe Code.exe"
GroupAdd 'copy123', "ahk_exe pycharm64.exe"
GroupAdd 'copy123', "ahk_exe explorer.exe"
GroupAdd 'copy123', "ahk_exe chrome.exe"
GroupAdd 'copy123', "ahk_exe DingTalk.exe"
GroupAdd 'copy123', "ahk_exe WeChat.exe"
GroupAdd 'copy123', "ahk_exe AutoHotkey64.exe"
GroupAdd 'copy123', "ahk_exe wps.exe"
GroupAdd 'copy123', "ahk_exe 2345PicViewer.exe"
GroupAdd 'copy123', "ahk_exe sublime_text.exe"
GroupAdd 'copy123', "ahk_exe wechatdevtools.exe"
#HotIf WinActive("ahk_group copy123")
1::Send "^c"
2::Send "^v"
3::Send "^x"
4::Send "^a"


#HotIf WinActive("ahk_exe explorer.exe")
F1::return


; #HotIf 指令会影响脚本中在它后面的所有热键和热字串, 直到下一个 #HotIf 指令
#HotIf
