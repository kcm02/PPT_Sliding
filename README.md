# PPT_Sliding
> _**PPT 슬라이드 쇼 제어 프로그램**_

이 프로그램은 파원포인트, 한쇼 등 PPT 프로그램의 슬라이드 쇼 모드에서 슬라이드를 제어할 수 있도록 설계된 `AutoHotkey` 스크립트입니다. 슬라이드 쇼 창이 백그라운드에 있더라도, 단축키를 통해 페이지를 넘기거나 이전 슬라이드로 돌아갈 수 있습니다.

## 기능

- **Ctrl + Right Arrow**: 다음 슬라이드로 이동 (`Page Down` 키를 슬라이드 쇼에 전송)
- **Ctrl + Left Arrow**: 이전 슬라이드로 이동 (`Page Up` 키를 슬라이드 쇼에 전송)

이 스크립트는 현재 활성화된 창을 잠시 기억해두고, 슬라이드 쇼 창으로 전환한 후 명령을 수행한 다음, 원래 활성화된 창으로 다시 복원합니다.

## 요구 사항

- **ahk 파일 사용 시**: [AutoHotkey](https://www.autohotkey.com/)가 설치되어 있어야 합니다.

- **exe 파일 사용 시**: 별도의 설치 없이 프로그램을 다운받아 실행하면 정상적으로 작동됩니다.

## 설치 및 사용 방법

### 🗂️ exe 파일 사용 시
1. `PPT_Sliding.exe`를 다운받습니다.

2. 위 실행 파일을 실행합니다.

3. PPT 프로그램을 실행 후, 슬라이드 쇼를 시작해 단축키를 사용하여 슬라이드를 제어합니다.

### 📜 ahk 파일 사용 시
1. AutoHotkey를 설치합니다.
2. 아래 스크립트를 텍스트 파일에 복사한 후, 파일의 확장자를 `.ahk`로 저장합니다.

    ```ahk
    ; Persistent 스크립트를 계속 실행 상태로 유지
    #Persistent
    SetTitleMatchMode, 2 ; 윈도우 제목의 일부분으로 윈도우를 찾을 수 있도록 설정

    ; 현재 활성화된 창의 핸들을 저장할 변수
    originalWindow := ""

    ; Ctrl + Right Arrow를 눌렀을 때 Page Down 키 입력을 슬라이드 쇼에 보냄
    ^Right::
    ; 현재 활성화된 창의 핸들을 저장
    originalWindow := WinExist("A")
    IfWinExist, 슬라이드 쇼
    {
        WinActivate ; 슬라이드 쇼 창을 활성화
        Send, {PgDn}
        Sleep, 100 ; 잠시 대기
        ; 원래 활성화된 창으로 포커스 복원
        WinActivate, ahk_id %originalWindow%
    }
    return

    ; Ctrl + Left Arrow를 눌렀을 때 Page Up 키 입력을 슬라이드 쇼에 보냄
    ^Left::
    ; 현재 활성화된 창의 핸들을 저장
    originalWindow := WinExist("A")
    IfWinExist, 슬라이드 쇼
    {
        WinActivate ; 슬라이드 쇼 창을 활성화
        Send, {PgUp}
        Sleep, 100 ; 잠시 대기
        ; 원래 활성화된 창으로 포커스 복원
        WinActivate, ahk_id %originalWindow%
    }
    return
    ```

3. 스크립트를 실행합니다.
4. PPT 프로그램을 실행 후, 슬라이드 쇼를 시작해 단축키를 사용하여 슬라이드를 제어합니다.

## 주의 사항

- 이 스크립트는 "슬라이드 쇼"라는 이름을 가진 창을 대상으로 동작합니다. 만약 슬라이드 쇼 창의 이름이 다르다면, 스크립트를 수정하여 창 이름을 변경해야 합니다.

## 라이선스

이 프로젝트는 자유롭게 사용, 수정, 배포할 수 있습니다.
