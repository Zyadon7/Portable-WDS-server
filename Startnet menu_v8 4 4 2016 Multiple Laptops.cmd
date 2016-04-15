wpeinit
@ECHO OFF

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::								                                    ::
::                	 Portable WDS Server	                        ::
::								                                    ::							
::								                                    ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::								                                    ::
::	WRITTEN BY A1C Zachary Smit - RAF LAKENHEATH 48CS/SCOSC         ::
::								                                    ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

color 2

CLS

:MENU

TITLE 48CS/SCOSC Re-imaging Tool
ECHO 48CS/SCOSC Re-imaging Tool
ECHO ============= Choose Image =============
ECHO =================
ECHO 1.  Tower
ECHO =================
ECHO 2.  Laptop
ECHO =================
ECHO 3.  Capture New Image
ECHO =================
ECHO 4.  Passive/ no script
ECHO ==========PRESS Q TO QUIT==========
ECHO.

SET INPUT=
SET /P INPUT=Please select a number:

IF /I ‘%INPUT%’==’1’ GOTO Selection1
IF /I ‘%INPUT%’==’2’ GOTO Selection2
IF /I ‘%INPUT%’==’3’ GOTO Selection3
IF /I ‘%INPUT%’==’4’ GOTO Selection4
IF /I ‘%INPUT%’==’Q’ GOTO Quit
CLS

ECHO ============INVALID INPUT============
ECHO ————————————-
ECHO Please select a number from the Main
ECHO Menu [1-4] or select Q to quit.
ECHO ————————————-
ECHO ======PRESS ANY KEY TO CONTINUE======

PAUSE > NUL
GOTO MENU
CLS
:Selection1

diskpart /s diskpart.txt

imagex /apply f:\Deploy\tower.wim 1 w:\
CLS

bcdboot.exe w:\windows /s S:\
CLS

GOTO Quit

:Selection2

ECHO ============= Select Laptop Model =============
ECHO =================
ECHO 1.  Dell Latitude
ECHO =================
ECHO 2.  HP Probook 640 G1
ECHO =================
ECHO 3.  Lenovo Thinkpad T420I
ECHO =================
ECHO 4.  Main Menu
ECHO ==========PRESS Q TO QUIT==========
ECHO.

SET Laptop_model=
SET /P Laptop_model=Please select a number:

IF /I ‘%Laptop_model%’==’1’ GOTO Laptop1
IF /I ‘%Laptop_model%’==’2’ GOTO Laptop2
IF /I ‘%Laptop_model%’==’3’ GOTO Laptop3
IF /I ‘%Laptop_model%’==’4’ GOTO Menu
IF /I ‘%Laptop_model%’==’Q’ GOTO Quit
CLS

ECHO ============INVALID INPUT============
ECHO ————————————-
ECHO Please select a number from the Main
ECHO Menu [1-4] or select Q to quit.
ECHO ————————————-
ECHO ======PRESS ANY KEY TO CONTINUE======

PAUSE > NUL
GOTO MENU
CLS

:Selection3

CLS
ECHO ==================
ECHO What is the drive letter you want to capture?
ECHO It is usually C for laptops and D for towers
ECHO.
ECHO =================
SET INPUT=
SET /P letter=Drive Letter:

CLS

SET INPUT=
SET /P name=Enter a name for the image file and press enter 

CLS

imagex /compress none /capture %letter%:\ f:\deploy\%name%.wim "%name%"
PAUSE>NUL
CLS
GOTO :MENU

:Selection4
cmd.exe
pause>nul
GOTO :MENU

:Laptop1

diskpart /s diskpart.txt

imagex /apply f:\Deploy\Dell_Latitude.wim 1 w:\
CLS

bcdboot.exe w:\windows /s S:\
CLS

GOTO Quit

:Laptop2

diskpart /s diskpart.txt

imagex /apply f:\Deploy\HP_Probook_640_G1.wim 1 w:\
CLS

bcdboot.exe w:\windows /s S:\
CLS

GOTO Quit

:Laptop3

diskpart /s diskpart.txt

imagex /apply f:\Deploy\Lenovo_thinkpad_T420i.wim 1 w:\
CLS

bcdboot.exe w:\windows /s S:\
CLS

GOTO Quit

:Quit

CLS

ECHO ==============Upon system restart, boot from internal hard drive===============
ECHO ==================
ECHO ==================
ECHO =============PRESS ANY KEY TO CONTINUE==============

PAUSE>NUL

EXIT