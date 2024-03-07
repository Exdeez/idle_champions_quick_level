MouseGrabColorPosX := 876
MouseGrabColorPosY := 1035

F15::
{
    PosColor := PixelGetColor(MouseGrabColorPosX, MouseGrabColorPosY)

    MsgBox PosColor
    Return
}