SetWorkingDir A_ScriptDir
#Include "Src\TESTUtils.ahk"

; General
; FormationCount := 9
; -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

; Specialization button choices & colors
InitialPosXSpecButton := 352
PosXSpecButtonInterval := 131
PosYSpecButton := 1035
SleepDurationSpecializing := 850
SleepDurationSpecChoice := 500
SleepDurationUpgrading := 35

SpecButtonPink := 0xA22D7E
SpecButtonGray := 0x4B4E4B
SpecButtonLightGray := 0x4E4D4E
SpecButtonLightGrayTwo := 0x4A4D4A

SpecButtonBlue := 0x375CBD
SpecButtonLightBlue := 0x318ADE
SpecButtonRed := 0x970010
SpecButtonOrange := 0xD35800
SpecButtonPurple := 0x890CE9
SpecButtonGreen := 0x298200
SpecButtonGreenTwo := 0x29A600
; -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

; More than 1 specialization definitions
; AsharraChoice := {
; 
; }

; AsharraPageColors := 
; {
;     0x050D49: 1
;     0x887F71: 2
; }

AsharraPageDetectPosX := 950
AsharraPageDetectPosY := 700
; -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

; Specialization choice positions
PosYSpecChoice := 791

PosXSpecChoiceOneOfTwo := 835
PosXSpecChoiceTwoOfTwo := 1085

PosXSpecChoiceOneOfThree := 709
PosXSpecChoiceTwoOfThree := 959
PosXSpecChoiceThreeOfThree := 1259

PosXSpecChoiceOneOfFive := 459
PosXSpecChoiceTwoOfFive := 709
PosXSpecChoiceThreeOfFive := 959
PosXSpecChoiceFourOfFive := 1209
PosXSpecChoiceFiveOfFive := 1459
; -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

; Specialization window color positions
PosYSpecWindowColor := 224
PosXSpecWindowColor := 957

SpecWindowColor := 0x292826
; -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

; Positions of specialization window close button
PosXSpecWindowCloseTwoChoice := 1210
PosXSpecWindowCloseThreeChoice := 1335
PosXSpecWindowCloseFiveChoice := 1584
PosYSpecWindowClose := 256
; -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

F24::Reload

F23::ExitApp

; This script is to level all champions in team 3 "SUPER SPEED"
#HotIf WinActive("ahk_exe IdleDragons.exe")
F13:: 
{
    Loop 
    {
        CurrentSlot := 0
        Loop 9
        {
            ; Iterates || Gets leveling button position || Gets color of leveling button || Continues on empty character slots || Levels current character
            CurrentSlot++

            If(LevelSkipRestart(CurrentSlot))
            {
                Continue
            }
            ; -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
            ; Grabs Specialization Window Color || Checks for & closes specialization window
            CurrentSpecWindowColor := PixelGetColor(PosXSpecWindowColor, PosYSpecWindowColor)

            If(CurrentSpecWindowColor = SpecWindowColor)
            {
                Click  PosXSpecWindowCloseTwoChoice, PosYSpecWindowClose 
                Sleep  SleepDurationLvling 
                Click  PosXSpecWindowCloseThreeChoice, PosYSpecWindowClose 
                Sleep  SleepDurationLvling 
                Click  PosXSpecWindowCloseFiveChoice, PosYSpecWindowClose 
                Sleep  SleepDurationLvling
            }
            ; -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
            ; Gets specialization button positon || Gets color of specialization button || Continues if no upgrade or specialization || 
            CurrentPosXSpec := ((CurrentSlot - 1) * PosXSpecButtonInterval) + InitialPosXSpecButton
            CurrentSpecButtonColor := PixelGetColor(CurrentPosXSpec, PosYSpecButton)

            If(CurrentSpecButtonColor = SpecButtonGray Or CurrentSpecButtonColor = SpecButtonLightGray Or CurrentSpecButtonColor = SpecButtonLightGrayTwo)
            {
                Continue
            }
            ; -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
            ; Chooses specialization if possible ||
            If(CurrentSlot != 6 And CurrentSpecButtonColor = SpecButtonPink)
            {
                Click  CurrentPosXSpec ,  PosYSpecButton 
                Sleep  SleepDurationSpecializing 

                If(CurrentSlot = 1 Or CurrentSlot = 4 Or CurrentSlot = 5)
                {
                    Click  PosXSpecChoiceOneOfTwo ,  PosYSpecChoice 
                }
                Else If(CurrentSlot = 9)
                {
                    Click  PosXSpecChoiceTwoOfTwo ,  PosYSpecChoice 
                }
                Else If(CurrentSlot = 3)
                {
                    Click  PosXSpecChoiceOneOfThree ,  PosYSpecChoice 
                }
                Else If(CurrentSlot = 2)
                {
                    Click  PosXSpecChoiceTwoOfThree ,  PosYSpecChoice 
                }
                Else If(CurrentSlot = 7)
                {
                    Click  PosXSpecChoiceOneOfFive ,  PosYSpecChoice 
                }
                Else If(CurrentSlot = 8)
                {
                    Click  PosXSpecChoiceThreeOfThree ,  PosYSpecChoice 
                }
                
                Sleep  SleepDurationSpecChoice
                Continue
            }
            ; -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
            ; Clicks specialization button if an upgrade is available
            If(CurrentSpecButtonColor = SpecButtonBlue
            Or CurrentSpecButtonColor = SpecButtonLightBlue
            Or CurrentSpecButtonColor = SpecButtonOrange
            Or CurrentSpecButtonColor = SpecButtonPurple
            Or CurrentSpecButtonColor = SpecButtonRed
            Or CurrentSpecButtonColor = SpecButtonGreen
            Or CurrentSpecButtonColor = SpecButtonGreenTwo)
            {
                Click  CurrentPosXSpec ,  PosYSpecButton 
                Sleep  SleepDurationUpgrading 
                Continue
            }
            ; -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
            
        } 
    }
}

; This function is to level all champions in team 1 "Normal"
#HotIf WinActive("ahk_exe IdleDragons.exe")
F14::
{
    Loop
    {
        CurrentSlot := 0
        Loop 9
        {
            ; Iterates || Skips slot 6 || Gets leveling button position || Gets color of leveling button || Continues on empty character slots || Levels current character
            CurrentSlot++

            If(CurrentSlot = 6)
            {
                CurrentSlot++
            }

            If(LevelSkipRestart(CurrentSlot))
            {
                Continue
            }
            ; -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-        
            ; Grabs Specialization Window Color || Checks for & closes specialization window        
            CurrentSpecWindowColor := PixelGetColor(PosXSpecWindowColor, PosYSpecWindowColor)

            If(CurrentSpecWindowColor = SpecWindowColor)
            {
                Click  PosXSpecWindowCloseTwoChoice ,  PosYSpecWindowClose 
                Sleep  SleepDurationLvling 
                Click  PosXSpecWindowCloseThreeChoice ,  PosYSpecWindowClose 
                Sleep  SleepDurationLvling 
                Click  PosXSpecWindowCloseFiveChoice ,  PosYSpecWindowClose 
                Sleep  SleepDurationLvling 
            }
            ; -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
            ; Gets specialization button positon || Gets color of specialization button || Continues if no upgrade or specialization || 
            CurrentPosXSpec := ((CurrentSlot - 1) * PosXSpecButtonInterval) + InitialPosXSpecButton
            CurrentSpecButtonColor := PixelGetColor(CurrentPosXSpec, PosYSpecButton)

            If(CurrentSpecButtonColor = SpecButtonGray Or CurrentSpecButtonColor = SpecButtonLightGray Or CurrentSpecButtonColor = SpecButtonLightGrayTwo)
            {
                Continue
            }
            ; -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
            ; Chooses specialization if possible ||
            If(CurrentSpecButtonColor = SpecButtonPink)
            {
                Click  CurrentPosXSpec ,  PosYSpecButton 
                Sleep  SleepDurationSpecializing 

                If(CurrentSlot = 1 Or CurrentSlot = 4 Or CurrentSlot = 5 Or CurrentSlot = 2 Or CurrentSlot = 10)
                {
                    Click PosXSpecChoiceOneOfTwo,  PosYSpecChoice 
                }
                Else If(CurrentSlot = 8 Or CurrentSlot = 9)
                {
                    Click PosXSpecChoiceTwoOfTwo,  PosYSpecChoice 
                }
                Else If(CurrentSlot = 3)
                {
                    Click PosXSpecChoiceOneOfThree,  PosYSpecChoice 
                }
                Else If(CurrentSlot = 7)
                {
                    Click PosXSpecChoiceOneOfFive,  PosYSpecChoice 
                }

                Sleep SleepDurationSpecChoice 
                Continue
            }
            ; -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
            ; Clicks specialization button if an upgrade is available
            If(CurrentSpecButtonColor = SpecButtonBlue
            Or CurrentSpecButtonColor = SpecButtonLightBlue
            Or CurrentSpecButtonColor = SpecButtonOrange
            Or CurrentSpecButtonColor = SpecButtonPurple
            Or CurrentSpecButtonColor = SpecButtonRed
            Or CurrentSpecButtonColor = SpecButtonGreen
            Or CurrentSpecButtonColor = SpecButtonGreenTwo)
            {
                Click  CurrentPosXSpec ,  PosYSpecButton 
                Sleep  SleepDurationUpgrading 
                Continue
            }
            ; -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
        } 
    }
}