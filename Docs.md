# This is documentation
https://www.markdownguide.org/cheat-sheet/

- CTRL-Shift P - Opens search menu (Types > in search bar)
- 'Markdown: Open Preview' to see in cazts
- WSL, Ubuntu (Linux Distribution), Github, Windows Terminal, 
    - `sudo apt-get update && sudo apt update && sudo apt upgrade -y` Grabs apt and apt-get (in Ubuntu), then installs them. Run 1 a week
    - `cd code` cd: change directory
    - `ls` ls: list all in current directory
    - \\wsl$
- [Git](https://git-scm.com/doc)
    - `git init` initialized repo where it wasn't
    - `git status` check
    - `git config --global user.name "John Doe"`
    - `git config --global user.name "John Doe"`
    - `git config --global user.email johndoe@example.com`
    - `ssh-keygen -t ed25519 -C "your_email@example.com"`

    - `eval "$(ssh-agent -s)"`
    - `ssh-add ~/.ssh/github_key`
    - `git pull origin main`
    - `git checkout -b development main`

    - `mkdir <name_of_dir>`
    - `git remote set-url origin git@github.com:Exdeez/idle_champions_quick_level.git`
    - `git push`
    - `sudo apt install xdg-utils`
    - `xdg-open .` cross-desktop-group opens current file directory

# AutoHotKeyv2
- Have a Src folder with Utils.ahk and Constants.ahk
- Documentation
    - [MsgBox](https://documentation.help/AHK_H-2.0/MsgBox.htm)

## These are some simple things
```autohotkey 
SetWorkingDir "C:\Users\Rawrz\Desktop\AHK2" 
#Include "Src\TESTUtils.ahk"
```
```autohotkey
Global GlobalVariable := 69                                     ; Makes a variable global. Variables NOT in functions etc are innately Global
```
```autohotkey
Static StaticVariable := 40                                     ; Makes a variable static. Static only runs the first time in a func/loop. Good for toggles?
```
```autohotkey
MyArray := [459, 709, 959, 1209, 1459]                          ; Array example (goes 1-5 NOT 0-4) 
MsgBox "This is the third number in the array: " MyArray[3]     ; Will output a messagebox with "This is the third number in the array: 959"
MsgBox "I like cats...`nRight?", "Important Question", "YN"     ; Will return Yes or No after clicking either option
```
```autohotkey

```
```autohotkey
CurrentLoop := 0

Loop 9 
{
    CurrentLoop++

    If(CurrentSlot = 3)
    {
        Continue                                                ; Starts the next loop
    }

    If(CurrentSlot = 5)
    {
        Break                                                      ; Ends the loop entirely
    }

    MsgBox "Current loop is: " CurrentLoop
}                                                               ; Loops 5 times. 3rd loop won't display a MsgBox. 5th loop will break before MsgBox runs
```
```autohotkey

```
```autohotkey

```
## These are some test program examples!
### This is a simple method call
```autohotkey
PosXSpecFiveChoices := [459, 709, 959, 1209, 1459]
PosYSpecChoice := 791

CharacterInSlot7 := "Minsc"
SpecChoiceForSlot7 := 1

CharacterInSlot7SpecChoice := 
{
    Minsc: MyFunctionToChooseOutOfFive
}

MyFunctionToChooseOutOfFive(ChoiceOutOfFive)
{
    MsgBox "Inside ofMyFunctionToChooseOutOfFive`nThis would have been clicked: " PosXSpecFiveChoices[ChoiceOutOfFive] " " PosYSpecChoice
}

F21::Reload

F22::ExitApp

F15::
{
    SlotSevenSpecializationChoice := CharacterInSlot7SpecChoice.%CharacterInSlot7%
    SlotSevenSpecializationChoice(SpecChoiceForSlot7)
}
```
### This is an example of calling a nested Object
```autohotkey
PosXSpecFiveChoices := [459, 709, 959, 1209, 1459]
PosYSpecChoice := 791

CharacterInSlot7 := "Minsc"
SpecChoiceForSlot7 := 1

StepThreeChooseSpecialization := 3

CharacterInSlot7SpecChoice := 
{
    Minsc: {
        3: MyFunctionToChooseOutOfFive
    } 
}

MyFunctionToChooseOutOfFive(ChoiceOutOfFive)
{
    Click PosXSpecFiveChoices[ChoiceOutOfFive], PosYSpecChoice
    Return "AYOOO!"
}

F21::Reload

F22::ExitApp

; It will make SlotSeven become the MyFunctionToChooseOutOfFive() function. It will click, then MsgBox "AYOOO!"
F15::
{
    SlotSeven := CharacterInSlot7SpecChoice.%CharacterInSlot7%.%StepThreeChooseSpecialization% ; This is the important part!
    MsgBox SlotSeven(SpecChoiceForSlot7)
}
``` 