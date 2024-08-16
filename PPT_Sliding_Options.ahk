#Persistent
SetTitleMatchMode, 2

; 기본 슬라이드 쇼 제목
slideShowTitle := "슬라이드 쇼"

; GUI 생성
Gui, Add, Text, x20 y20 w120 h20, 슬라이드 쇼 제목:
Gui, Add, Edit, x150 y20 w200 h20 vTitle, %slideShowTitle%
Gui, Add, Button, x150 y60 w100 h30 gSaveSettings, 저장
Gui, Add, Button, x260 y60 w100 h30 gCloseGui, 취소
Gui, Show, w400 h120, 설정
return

SaveSettings:
    Gui, Submit, NoHide
    slideShowTitle := Title
    Gui, Destroy
    return

CloseGui:
    Gui, Destroy
    return

^Right::
originalWindow := WinExist("A")
IfWinExist, %slideShowTitle%
{
    WinActivate
    Send, {PgDn}
    Sleep, 100
    WinActivate, ahk_id %originalWindow%
}
else
{
    MsgBox, % "슬라이드 쇼 창 '" slideShowTitle "'을 찾을 수 없습니다."
}
return

^Left::
originalWindow := WinExist("A")
IfWinExist, %slideShowTitle%
{
    WinActivate
    Send, {PgUp}
    Sleep, 100
    WinActivate, ahk_id %originalWindow%
}
else
{
    MsgBox, % "슬라이드 쇼 창 '" slideShowTitle "'을 찾을 수 없습니다."
}
return
