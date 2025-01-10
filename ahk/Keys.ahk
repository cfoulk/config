#Requires AutoHotkey v2.0
#SingleInstance force
ListLines 0
SendMode "Input"
SetWorkingDir A_ScriptDir
KeyHistory 0
#WinActivateForce

ProcessSetPriority "H"

SetWinDelay -1
SetControlDelay -1

MouseFollow := false ; Flag for where or not our mouse follows when switching windows

; For Win + L key to work you must create a new policy in the Registry Editor.
; HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System with DWORD value of 0x01.
; Could also try LOCAL_MACHINE as well if above doesn't work.

; Script is from this repo.
; https://github.com/FuPeiJiang/VD.ahk
#Include VD.ah2

VD.createUntil(4)

return

Esc::CapsLock
CapsLock::Esc


; + SHIFT, # WIN, !ALT, ^ CTRL

^#!r::
{
    TrayTip "Key Script Reloaded", "Reload"
    Reload
}

#q:: ; Win + Q closes active window
{
    win := WinGetTitle("A") ; Get the title of the active window
    try PostMessage(0x112, 0xF060, 0, , win) ; Send the close command
}

#w:: OpenProgram("firefox", "Mozilla Firefox", , "Private Browsing")
#+w:: OpenProgram("firefox.exe -private-window", "Mozilla Firefox Private Browsing")
#e:: OpenProgram("explorer", "ahk_class CabinetWClass")
#Enter:: OpenProgram("alacritty.exe", "Alacritty")
#o::
{
    VpnPath := EnvGet("VPN_PATH")
    VpnExe := EnvGet("VPN_EXE")
    if (VpnPath and VpnExe)
        OpenProgram(VpnPath, "ahk_exe " . VpnExe)
    else
        MsgBox "Problems with VPN"
}

#h:: SwitchFocus("Left")
#l:: SwitchFocus("Right") ; Normally Win + L locks windows but I added a policy in RegEdit... see above
#j:: SwitchFocus("Down")
#k:: SwitchFocus("Up")

#1:: SwitchViewToNumDesktop(1)
#2:: SwitchViewToNumDesktop(2)
#3:: SwitchViewToNumDesktop(3)
#4:: SwitchViewToNumDesktop(4)

#+1:: MoveCurrentWinToDesktop(1)
#+2:: MoveCurrentWinToDesktop(2)
#+3:: MoveCurrentWinToDesktop(3)
#+4:: MoveCurrentWinToDesktop(4)

#y::
{
    CurrentDesktopNum := VD.getCurrentDesktopNum()
    IB := InputBox("Input new name for desktop.", "Desktop Name", "w100 h100", "Desktop " CurrentDesktopNum)

    if (IB.Result = "Cancel")
        return

    VD.setNameToDesktopNum(IB.Value, CurrentDesktopNum)

}

SwitchViewToNumDesktop(Num)
{
    if VD.getCount() < Num
        return

    if VD.getCurrentDesktopNum() == Num
        return

    ; Close Start menu before switching desktops
    if WinActive("ahk_class Windows.UI.Core.CoreWindow")
        WinClose

    VD._SwitchDesktop(Num)
}


MoveCurrentWinToDesktop(Num)
{
    if VD.getCount() < Num
        return

    if VD.getCurrentDesktopNum() == Num
        return

    VD.MoveWindowToDesktopNum("A", Num)
}

OpenProgram(Program, WinTitle := "", WinText := "", ExcludeTitle := "", ExcludeText := "")
{
    if (WinTitle = "" AND WinText = "") {
        MsgBox "No defined WinTitle or WinText"
        return
    }

    FoundWindow := WinExist(WinTitle, WinText, ExcludeTitle, ExcludeText)

    if FoundWindow {
        if WinActive(WinTitle, WinText, ExcludeTitle, ExcludeText)
            WinMinimize(WinTitle, WinText, ExcludeTitle, ExcludeText)
        else
            WinActivate(WinTitle, WinText, ExcludeTitle, ExcludeText)
    } else {
        Run Program
    }
}

; TODO
; Give presidence for previous windows if multiple windows have the same MinPosition

SwitchFocus(direction)
{
    if WinActive("A")
    {
        ActiveWinID := WinGetId("A")
        WinGetClientPos(&CurrentX, &CurrentY, , , "ahk_id " . activeWinID)
    }
    else
    {
        MouseGetPos &CurrentX, &CurrentY
    }
    WinList := WinGetList(, , "Program Manager")

    ClosestWindowID := 0
    MinPosition := 10000
    OffSet := 10000
    title := ""

    for Win in WinList
    {
        if (isSet(ActiveWinID) && Win = ActiveWinID)
            continue

        if (WinGetTransparent("ahk_id " . Win) = 0)
            continue

        if (WinGetTitle("ahk_id " . Win) = "")
            continue

        WinGetClientPos(&TempX, &TempY, &TempW, &TempH, "ahk_id " . Win)

        dx := TempX - CurrentX
        dy := TempY - CurrentY

        if (direction = "Up" && dy < 0 && Abs(dx) <= Abs(dy))
        {
            dist := Sqrt(dx ** 2 + dy ** 2)
            if (dy <= MinPosition && dist < Offset) {
                MinPosition := dy
                OffSet := dist
                ClosestWindowID := Win
                title := WinGetTitle("ahk_id " . Win)
            }
        }
        else if (direction = "Down" && dy > 0 && Abs(dx) <= Abs(dy))
        {
            dist := Sqrt(dx ** 2 + dy ** 2)
            if (dy <= MinPosition && dist < OffSet) {
                MinPosition := dy
                OffSet := dist
                ClosestWindowID := Win
                title := WinGetTitle("ahk_id " . Win)
            }
        }
        else if (direction = "Left" && dx < 0 && Abs(dx) >= Abs(dy))
        {
            dist := Sqrt(dx ** 2 + dy ** 2)
            if (dx <= MinPosition && dist < OffSet) {
                MinPosition := dx
                OffSet := dist
                ClosestWindowID := Win
                title := WinGetTitle("ahk_id " . Win)
            }
        }
        else if (direction = "Right" && dx > 0 && Abs(dx) >= Abs(dy))
        {
            dist := Sqrt(dx ** 2 + dy ** 2)
            if (dx <= MinPosition && dist < OffSet) {
                MinPosition := dx
                OffSet := dist
                ClosestWindowID := Win
                title := WinGetTitle("ahk_id " . Win)
            }
        }
    }

    if (ClosestWindowID != 0)
    {
        WinActivate("ahk_id " . ClosestWindowID)

        if (MouseFollow) {
            WinGetClientPos(&NewX, &NewY, &NewW, &NewH, "ahk_id " . ClosestWindowID)
            XCoord := NewX + (NewW / 2)
            YCoord := NewY + (NewH / 2)
            DllCall("SetCursorPos", "int", XCoord, "int", YCoord)

            ; In case of mouse 'busy' animation bug
            Sleep(50)
            DllCall("User32.dll\mouse_event", "UInt", 0x01, "UInt", -5, "UInt", -5, "UInt", 0, "UInt", 0) ; Left button down
            DllCall("User32.dll\mouse_event", "UInt", 0x01, "UInt", 5, "UInt", 5, "UInt", 0, "UInt", 0) ; Left button up
        }
    }
}
