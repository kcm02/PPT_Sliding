; AutoHotkey 스크립트 예제

#Persistent ; 스크립트를 계속 실행 상태로 유지
SetTitleMatchMode, 2 ; 윈도우 제목의 일부분으로 윈도우를 찾을 수 있도록 설정

; 현재 활성화된 창의 핸들을 저장할 변수
originalWindow := ""

; Ctrl + Right Arrow를 눌렀을 때 Page Down 키 입력을 한쇼 2022에 보냄
^Right::
; 현재 활성화된 창의 핸들을 저장
originalWindow := WinExist("A")
IfWinExist, 슬라이드 쇼
{
    WinActivate ; 한쇼 2022 창을 활성화
    Send, {PgDn}
    Sleep, 100 ; 잠시 대기
    ; 원래 활성화된 창으로 포커스 복원
    WinActivate, ahk_id %originalWindow%
}
return

; Ctrl + Left Arrow를 눌렀을 때 Page Up 키 입력을 한쇼 2022에 보냄
^Left::
; 현재 활성화된 창의 핸들을 저장
originalWindow := WinExist("A")
IfWinExist, 슬라이드 쇼
{
    WinActivate ; 한쇼 2022 창을 활성화
    Send, {PgUp}
    Sleep, 100 ; 잠시 대기
    ; 원래 활성화된 창으로 포커스 복원
    WinActivate, ahk_id %originalWindow%
}
return
=