#Requires AutoHotkey v2.0.2
#SingleInstance Force

Komorebic(cmd) {
    RunWait(format("komorebic.exe {}", cmd), , "Hide")
}

!w::
{
	if WinExist("Mozilla Firefox")
		WinActivate
	else
		Run "firefox"
}

!+w:: Run "firefox.exe -private-window"
!Enter:: Run "wt"
!0:: Run "explorer"

!q::Komorebic("close")
!m::Komorebic("minimize")
!+m::Komorebic("restore-windows")
!+y::Komorebic("manage")

; Focus windows
!h::Komorebic("focus left")
!j::Komorebic("focus down")
!k::Komorebic("focus up")
!l::Komorebic("focus right")

!+[::Komorebic("cycle-focus previous")
!+]::Komorebic("cycle-focus next")

; Move windows
!+h::Komorebic("move left")
!+j::Komorebic("move down")
!+k::Komorebic("move up")
!+l::Komorebic("move right")
!+Enter::Komorebic("promote")

; Stack windows
#Left::Komorebic("stack left")
#Down::Komorebic("stack down")
#Up::Komorebic("stack up")
#Right::Komorebic("stack right")
#;::Komorebic("unstack")
#+h::Komorebic("cycle-stack previous")
#+l::Komorebic("cycle-stack next")

; Resize
!#h::Komorebic("resize-axis horizontal increase")
!#l::Komorebic("resize-axis horizontal decrease")
!#j::Komorebic("resize-axis vertical increase")
!#k::Komorebic("resize-axis vertical decrease")

; Manipulate windows
!t::Komorebic("toggle-float")
!f::Komorebic("toggle-monocle")

; Window manager options
!+r::Komorebic("retile")
!p::Komorebic("toggle-pause")

; Layouts
!x::Komorebic("flip-layout horizontal")
!y::Komorebic("flip-layout vertical")

; Workspaces
!1::Komorebic("focus-workspace 0")
!2::Komorebic("focus-workspace 1")
!3::Komorebic("focus-workspace 2")
!4::Komorebic("focus-workspace 3")
!5::Komorebic("focus-workspace 4")
!6::Komorebic("focus-workspace 5")
!7::Komorebic("focus-workspace 6")
!8::Komorebic("focus-workspace 7")

; Move windows across workspaces
!+1::Komorebic("move-to-workspace 0")
!+2::Komorebic("move-to-workspace 1")
!+3::Komorebic("move-to-workspace 2")
!+4::Komorebic("move-to-workspace 3")
!+5::Komorebic("move-to-workspace 4")
!+6::Komorebic("move-to-workspace 5")
!+7::Komorebic("move-to-workspace 6")
!+8::Komorebic("move-to-workspace 7")
