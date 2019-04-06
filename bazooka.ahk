#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Persistent
#IfWinActive, ahk_class D3 Main Window Class
#SingleInstance force
#MaxThreadsPerHotkey 2
SetDefaultMouseSpeed, 0
SetBatchLines, -1

RayOfFrost(x)
{
	if (x == "U") 
	{
		SendInput {4 Up}
	}
	else if (x == "D")
	{
		SendInput {4 Down}
	}
}

WaveOfForce(x)
{
	if (x == "U") 
	{
		SendInput {1 Up}
	}
	else if (x == "D")
	{
		SendInput {1 Down}
	}
}

Electrocute(x)
{
	if (x == "U") 
	{
		SendInput {2 Up}
	}
	else if (x == "D")
	{
		SendInput {2 Down}
	}
}

Meteor(x)
{
	if (x == "U") 
	{
		SendInput {3 Up}
	}
	else if (x == "D")
	{
		SendInput {3 Down}
	}
}

WaitForArchon()
{
	count := 1.0
	while ( count < 20.0 )
	{
		Send 1
		Sleep 1000
		count += 1.0
	}
	count += 0.1
	sleep 100
}

doMacro(x)
{
	SendInput {LShift Down}
	Sleep 50
	MouseClick, Right, , , , , D
	Sleep 100
	MouseClick, Right, , , , , U
	SendInput {LShift Up}
	RayOfFrost("U")
	;Sleep 20100
	WaitForArchon()

	if (x == 1) ; do occulus
	{
		MouseClick, Left, , , , , D
		MouseClick, Left, , , , , U
		Sleep 590
		WaveOfForce("D")
		Sleep 10
		WaveOfForce("U")
		Sleep 50
		Electrocute("D")
		Sleep 3100
		Electrocute("U")
		Meteor("D")
		Sleep 10
		Meteor("U")
		sleep 90
	}
	else
	{
		sleep 3850
	}
	Electrocute("D")
	Sleep 1000
	Electrocute("U")
	Sleep 50
	RayOfFrost("D")
	Sleep 1000
	RayOfFrost("U")
	Sleep 1350
	MouseClick, Left, , , , , D
	MouseClick, Left, , , , , U
	Sleep 490
	WaveOfForce("D")
	Sleep 100
	WaveOfForce("U")
	Electrocute("D")
	Sleep 1600
	Electrocute("U")
	Sleep 1000
	Meteor("D")
	Sleep 10
	Meteor("U")
	Sleep 90
	Electrocute("D")
	Sleep 1000
	Electrocute("U")	
	Sleep 50
	RayOfFrost("D")
	Sleep 100

}

$5::
	Stoggle := !Stoggle
	Loop
	{
		if Stoggle
		{
			doMacro(0)
		}
		else
		{
			break
		}
	}
return

$8::
	toggle := !toggle
	Loop
	{
		if toggle
		{
			doMacro(1)
		}
		else
		{
			break
		}
	}
return