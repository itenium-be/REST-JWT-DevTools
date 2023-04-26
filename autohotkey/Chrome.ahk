#Persistent
#IfWinActive, ahk_exe chrome.exe

; F1: Open chrome://extensions
F1::
openChromePageInNewTab("extensions")
Return


~Esc::
; Esc twice to open/close DevTools
; Default shortcut: Control + Shift + J
If (A_PriorHotKey = A_ThisHotKey and A_TimeSincePriorHotkey < 500)
   Send {F12}
Return


#IfWinActive


; Other chrome:// uris
; chrome://settings
; chrome://history == Control + H
; chrome://downloads == Control + J
; chrome://bookmarks
; chrome://flags --> Enable experimental features
; Complete list: chrome://chrome-urls
; Blog post: https://fossbytes.com/complete-list-of-secret-chrome-urls-uses
openChromePageInNewTab(chromePage) {
	IfWinActive, New Tab
		; Focus address bar
		Send ^l
	else
		; Open new tab
		Send ^t

	SendInput chrome`:`/`/%chromePage%`/{Enter}
}
