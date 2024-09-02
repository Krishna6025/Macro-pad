	#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
	; #Warn  ; Enable warnings to assist with detecting common errors.
	SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
	SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

	;(^ Ctrl) (! Alt) (+ Shift)
	; HID Remapper from https://www.jfedor.org/hid-remapper-config/

	; Set your Home Assistant API key and base URL
	HomeAssistantAPIKey := "API key"
	HomeAssistantBaseURL := "Hme assistant URL"

	; ############# Quick Launchers #############

	; No action yet
	F13::return

	; Move window left with F14
	F14::
		Send, #{Left} 
		
	return



	; window full with F15
	F15::
	 Send, #{Up} ;  
	 
	return

	; Move window right with F16
	F16::
		 Send, #{Right} ; 
		 
	return

	; AFK shortcut for GTA online
	F17::
	ToggleF17 := !ToggleF17 ; Toggle the state

    if (ToggleF17) {
        SetTimer, PressD, 10000 ; Set a timer to run every 300,000 ms (5 minutes)
    } else {
        SetTimer, PressD, Off ; Turn off the timer
    }
return

PressD:
	Send, {d down} ; Hold down the letter D
        Sleep, 1000 ; Wait for 1 second (1000 ms)
        Send, {d up} ; Release the letter D
return

	; No action yet
	F18::return

	; Close all open application windows with F20
	F20::
		; Iterate over all open windows and close them
		WinGet, id, List
		Loop, %id%
		{
			this_id := id%A_Index%
			WinClose, ahk_id %this_id%
		}
	return

	; Study mode with F21
	F21::
		Send, #1 ; Open Chrome
		Sleep 696
		Run, "C:\Program Files\Google\Chrome\Application\chrome.exe" --new-tab "https://swayam.gov.in/"
		Sleep 696
		Run, "C:\Program Files\Google\Chrome\Application\chrome.exe" --new-tab "https://calendar.google.com/calendar/u/0/r/tasks"
	return

	; Game mode with F22
	F22::
		Run, explorer.exe "C:\Users\saikr\OneDrive\Desktop\games" ; 
		Sleep 696
		Run, "C:\Users\saikr\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Discord Inc\Discord.lnk" ; 
	return

	;No action yet
	F23::return

	; No action yet
	F24::return

	; ####### Home Automation with Home Assistant #######

	; work in progress to get it to work perfectly

	; Control tube light (Home Assistant) 
	!+F23::
		Run, curl -X POST -H "Authorization: Bearer %HomeAssistantAPIKey%" -H "Content-Type: application/json" %HomeAssistantBaseURL%/api/services/script/ahk_tube,,hide
	return

	; Control fan (Home Assistant) 
	!+F24::
		Run, curl -X POST -H "Authorization: Bearer %HomeAssistantAPIKey%" -H "Content-Type: application/json" %HomeAssistantBaseURL%/api/services/script/ahk_fan,,hide
	return

