" Vim syntax file
" Language:     MMBasic (for PicoMite and Micromite)
" Maintainer:   MMBasic Community
" Last Change:  2026 Feb 28
" Version:      1.1.0 (Based on PicoMite V6.02.00)

if exists("b:current_syntax")
  finish
endif

" Case insensitive
syn case ignore

" Comments
syn match   mmbasicComment "'\+.*$" contains=mmbasicTodo
syn keyword mmbasicTodo TODO FIXME XXX NOTE contained

" Line numbers (optional in MMBasic)
syn match   mmbasicLineNumber "^\s*\d\+"

" Strings
syn region  mmbasicString start=+"+ skip=+\\"+ end=+"+

" Numbers
syn match   mmbasicNumber "\<\d\+\>"
syn match   mmbasicFloat  "\<\d\+\.\d*\([eE][-+]\?\d\+\)\?\>"
syn match   mmbasicHex    "&[hH][0-9a-fA-F]\+"
syn match   mmbasicBin    "&[bB][01]\+"
syn match   mmbasicOct    "&[oO][0-7]\+"

" Control flow keywords
syn keyword mmbasicConditional IF THEN ELSE ELSEIF ENDIF
syn keyword mmbasicRepeat      FOR TO STEP NEXT DO LOOP WHILE WEND UNTIL
syn keyword mmbasicStatement   SELECT CASE IS
syn keyword mmbasicKeyword     GOTO GOSUB RETURN EXIT CONTINUE
syn keyword mmbasicKeyword     ON ERROR SKIP END

" Program structure
syn keyword mmbasicKeyword     SUB FUNCTION STATIC LOCAL
syn keyword mmbasicType        INTEGER FLOAT STRING AS LENGTH
syn keyword mmbasicStatement   DIM CONST DATA READ RESTORE ERASE

" Operators
syn keyword mmbasicOperator    AND OR NOT XOR MOD INV

" Built-in commands
syn keyword mmbasicStatement   RUN NEW EDIT LIST CLEAR MEMORY FILES
syn keyword mmbasicStatement   LOAD SAVE CHAIN KILL MKDIR RMDIR CHDIR
syn keyword mmbasicStatement   COPY RENAME LIBRARY AUTOSAVE AUTORUN
syn keyword mmbasicStatement   OPTION TROFF TRON VAR WATCHDOG

" I/O commands
syn keyword mmbasicStatement   PRINT INPUT OPEN CLOSE WRITE
syn keyword mmbasicStatement   SEEK LINE GET PUT

" Hardware commands
syn keyword mmbasicHardware    SETPIN PIN PULSIN PULSE PWM SERVO
syn keyword mmbasicHardware    ADC DAC PAUSE SETTICK
syn keyword mmbasicHardware    I2C I2C2 SPI SPI2 SERIAL COM1 COM2
syn keyword mmbasicHardware    INFRARED IR RTC TEMPR HUMID KEYPAD
syn keyword mmbasicHardware    DISTANCE WS2812 DHT22 DS18B20 ONEWIRE
syn keyword mmbasicHardware    PS2 USB GPS BACKLIGHT FRAMEBUFFER
syn keyword mmbasicHardware    GAMEPAD INTERRUPT PORT CPU MEMORY

" Graphics commands
syn keyword mmbasicGraphics    CLS COLOUR COLOR PIXEL LINE BOX RBOX
syn keyword mmbasicGraphics    CIRCLE ARC TRIANGLE TEXT FONT PAGE
syn keyword mmbasicGraphics    BLIT SPRITE POLYGON TILE BITMAP IMAGE
syn keyword mmbasicGraphics    MODE GUI HIDE SHOW DRAW REFRESH LAYER
syn keyword mmbasicGraphics    LOAD SAVE

" WiFi/Network commands (WebMite)
syn keyword mmbasicNetwork     WEB TFTP NTP EMAIL CLIENT SERVER UDP
syn keyword mmbasicNetwork     TCP TRANSMIT MQTT TELNET PING

" Built-in functions
syn keyword mmbasicFunction    ABS ASC ATN BIN$ CALL CHR$ CHOICE
syn keyword mmbasicFunction    CINT COS DATE$ DATETIME$ DAY DEVICE
syn keyword mmbasicFunction    DIR$ DISTANCE EPOCH EOF ERRMSG$ ERRNO
syn keyword mmbasicFunction    EXP FIELD$ FIX FORMAT$ HEX$ INKEY$
syn keyword mmbasicFunction    INPUT$ INSTR INT JSON$ LCASE$ LEFT$
syn keyword mmbasicFunction    LEN LGETBYTE LGETSTR$ LINSTR LOG
syn keyword mmbasicFunction    LCOMPARE LLEN MID$ MMINFO MMCMDLINE$
syn keyword mmbasicFunction    MMPROGNAME$ OCT$ PEEK PI PIXEL RANDOM
syn keyword mmbasicFunction    RGB RIGHT$ RND SGN SIN SPACE$ SQR
syn keyword mmbasicFunction    STR$ STRING$ TAB TAN TIME$ TIMER
syn keyword mmbasicFunction    UCASE$ VAL VERSION

" Special read-only variables
syn keyword mmbasicConstant    MM.DEVICE MM.VER MM.HRES MM.VRES
syn keyword mmbasicConstant    MM.WATCHDOG MM.ERRNO MM.ERRMSG$

" Pin modes (for SETPIN)
syn keyword mmbasicPinMode     DIN DOUT AIN CIN FIN PIN INTH INTL
syn keyword mmbasicPinMode     COUT OFF

" Boolean constants
syn keyword mmbasicBoolean     TRUE FALSE

" Matching pairs
syn region  mmbasicIfBlock     start="\<IF\>" end="\<END\s\+IF\>" contains=ALL fold
syn region  mmbasicForBlock    start="\<FOR\>" end="\<NEXT\>" contains=ALL fold
syn region  mmbasicDoBlock     start="\<DO\>" end="\<LOOP\>" contains=ALL fold
syn region  mmbasicWhileBlock  start="\<WHILE\>" end="\<WEND\>" contains=ALL fold
syn region  mmbasicSelectBlock start="\<SELECT\s\+CASE\>" end="\<END\s\+SELECT\>" contains=ALL fold
syn region  mmbasicSubBlock    start="\<SUB\>" end="\<END\s\+SUB\>" contains=ALL fold
syn region  mmbasicFuncBlock   start="\<FUNCTION\>" end="\<END\s\+FUNCTION\>" contains=ALL fold

" Define highlighting groups
hi def link mmbasicComment        Comment
hi def link mmbasicTodo           Todo
hi def link mmbasicLineNumber     LineNr
hi def link mmbasicString         String
hi def link mmbasicNumber         Number
hi def link mmbasicFloat          Float
hi def link mmbasicHex            Number
hi def link mmbasicBin            Number
hi def link mmbasicOct            Number
hi def link mmbasicConditional    Conditional
hi def link mmbasicRepeat         Repeat
hi def link mmbasicStatement      Statement
hi def link mmbasicKeyword        Keyword
hi def link mmbasicType           Type
hi def link mmbasicOperator       Operator
hi def link mmbasicHardware       Special
hi def link mmbasicGraphics       Special
hi def link mmbasicNetwork        Special
hi def link mmbasicFunction       Function
hi def link mmbasicConstant       Constant
hi def link mmbasicPinMode        Type
hi def link mmbasicBoolean        Boolean

let b:current_syntax = "mmbasic"
