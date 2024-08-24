	#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
	; #Warn  ; Enable warnings to assist with detecting common errors.
	SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
	SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

	; Note the following hotkey prefixes (^ Ctrl) (! Alt) (+ Shift)
	; HID Remapper from https://www.jfedor.org/hid-remapper-config/

	; Set your Home Assistant API key and base URL
	HomeAssistantAPIKey := "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiIzOTI2ZWI5NmY2NjM0ODQxYjljZWM5ZWY1MTRlYjcxOSIsImlhdCI6MTcyMzgyNDgzNCwiZXhwIjoyMDM5MTg0ODM0fQ.c6PH3CxsasAMo7yiYb1jvmfUQq0GjipLohKeMEI8R6Y"
	HomeAssistantBaseURL := "http://192.168.0.221:8123/api/services"

	; ############# Quick Launchers #############

	; No action assigned for F13
	F13::return

	; Move window left with F14
	F14::
		Send, #{Left} ; Simulate Windows + Left Arrow
		
	return



	; No action assigned for F15
	F15::
	 Send, #{Up} ; Simulate Windows + Right Arrow`
	 
	return

	; Move window right with F16
	F16::
		 Send, #{Right} ; Simulate Windows + Right Arrow
		 
	return

	; No action assigned for F17
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

	; No action assigned for F18
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

	; Open tab 1 and specific tabs with F21
	F21::
		Send, #1 ; Open Chrome
		Sleep 500
		Run, "C:\Program Files\Google\Chrome\Application\chrome.exe" --new-tab "https://swayam.gov.in/"
		Sleep 500
		Run, "C:\Program Files\Google\Chrome\Application\chrome.exe" --new-tab "https://calendar.google.com/calendar/u/0/r/tasks"
	return

	; Open games folder and Discord with F22
	F22::
		Run, explorer.exe "C:\Users\saikr\OneDrive\Desktop\games" ; 
		Sleep 500
		Run, "C:\Users\saikr\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Discord Inc\Discord.lnk" ; 
	return

	; No action assigned for F23
	F23::return

	; No action assigned for F24
	F24::return

	; ####### Home Automation with Home Assistant #######

	; Control tube light (Home Assistant) 
	!+F23::
		Run, curl -X POST -H "Authorization: Bearer %HomeAssistantAPIKey%" -H "Content-Type: application/json" %HomeAssistantBaseURL%/api/services/script/ahk_tube,,hide
	return

	; Control fan (Home Assistant) 
	!+F24::
		Run, curl -X POST -H "Authorization: Bearer %HomeAssistantAPIKey%" -H "Content-Type: application/json" %HomeAssistantBaseURL%/api/services/script/ahk_fan,,hide
	return

