; Functions!! LET'S GOOO

; Leveling position & color
InitialPosXLvling := 322
PosXLvlingInterval := 131
PosYLvling := 1060
SleepDurationLvling := 35

CurrentLvlingButtonColorClickOrNot :=
{
    0x310005: False,    ; No character color
    0x4A9E29: True,     ; Green
    0x4DAC26: True,     ; LightGreen
    0x5F924C: True,     ; PaleGreen
    0x619A4A: True,     ; PaleLightGreen
    0x477FC0: True,     ; Blue
    0x5E7FA6: True      ; LightBlue
}
; -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

; Iterates || Gets leveling button position || Gets color of leveling button || Continues on empty character slots || Levels current character
LevelSkipRestart(CurrentSlot)
{
    CurrentPosXLvling := ((CurrentSlot - 1) * PosXLvlingInterval) + InitialPosXLvling

    CurrentLvlingButtonColor := PixelGetColor(CurrentPosXLvling, PosYLvling)

    If(CurrentLvlingButtonColorClickOrNot.HasProp(CurrentLvlingButtonColor))
    {
        If(CurrentLvlingButtonColorClickOrNot.%CurrentLvlingButtonColor%)
        {
            Click CurrentPosXLvling, PosYLvling 
            Sleep SleepDurationLvling
            Return False
        }
        Else
        {
            Return True
        }
    }
    Else
    {
        Return False
    }
}
; -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-