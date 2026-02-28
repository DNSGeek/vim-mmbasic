# MMBasic Syntax for Vim

Vim syntax highlighting and filetype plugin for MMBasic (PicoMite).

## Features

✨ **Complete Syntax Highlighting**
- All MMBasic keywords, functions, and commands
- Control structures (IF, FOR, WHILE, SELECT CASE, etc.)
- Hardware commands (SETPIN, PWM, I2C, SPI, etc.)
- Graphics commands (PIXEL, LINE, CIRCLE, TEXT, etc.)
- WiFi/Network commands for WebMite
- Comments, strings, numbers (decimal, hex, binary, octal)
- Pin names (GP0-GP47)

🎨 **Smart Editing Features**
- Automatic indentation
- Code folding for SUB/FUNCTION blocks
- Matchit support for block structures
- Useful abbreviations (pr→PRINT, inp→INPUT, etc.)
- Case-insensitive keyword matching

📚 **Based on Official Documentation**
- Synchronized with PicoMite User Manual V6.02.00
- Supports all Raspberry Pi Pico variants (RP2040, RP2350, RP2350B)
- Includes WebMite WiFi commands

## Installation

### Manual Installation

Copy the files to your Vim directory:

**Unix/Linux/Mac:**
```bash
mkdir -p ~/.vim/{syntax,ftdetect,ftplugin,doc}
cp syntax/mmbasic.vim ~/.vim/syntax/
cp ftdetect/mmbasic.vim ~/.vim/ftdetect/
cp ftplugin/mmbasic.vim ~/.vim/ftplugin/
cp doc/mmbasic.txt ~/.vim/doc/

# Generate help tags
vim -c 'helptags ~/.vim/doc' -c quit
```

**Windows:**
```cmd
mkdir %USERPROFILE%\vimfiles\syntax
mkdir %USERPROFILE%\vimfiles\ftdetect
mkdir %USERPROFILE%\vimfiles\ftplugin
mkdir %USERPROFILE%\vimfiles\doc

copy syntax\mmbasic.vim %USERPROFILE%\vimfiles\syntax\
copy ftdetect\mmbasic.vim %USERPROFILE%\vimfiles\ftdetect\
copy ftplugin\mmbasic.vim %USERPROFILE%\vimfiles\ftplugin\
copy doc\mmbasic.txt %USERPROFILE%\vimfiles\doc\

vim -c "helptags ~\vimfiles\doc" -c quit
```

### Using a Plugin Manager

**Vim-Plug:**
```vim
Plug 'path/to/mmbasic-vim'
```

**Vundle:**
```vim
Plugin 'path/to/mmbasic-vim'
```

**Pathogen:**
```bash
cd ~/.vim/bundle
git clone path/to/mmbasic-vim
```

## Usage

The plugin automatically activates for files with `.bas` or `.mmb` extensions.

### Syntax Highlighting

Open any MMBasic file:
```bash
vim myprogram.bas
```

Keywords will be highlighted automatically!

### Code Folding

Fold SUB and FUNCTION blocks:
```vim
:set foldmethod=syntax
zc    " Close fold
zo    " Open fold
za    " Toggle fold
```

### Matchit Support

Jump between matching keywords:
```vim
%     " Jump between IF/ENDIF, FOR/NEXT, etc.
```

### Abbreviations

In insert mode:
```
pr<space>   → PRINT
inp<space>  → INPUT
fn<space>   → FUNCTION
sb<space>   → SUB
```

### Settings

The plugin sets these defaults:
- `tabstop=2` - Tab width
- `shiftwidth=2` - Indent width
- `expandtab` - Use spaces instead of tabs
- `autoindent` - Auto-indent new lines
- `smartindent` - Smart indentation

To override in your `.vimrc`:
```vim
autocmd FileType mmbasic setlocal tabstop=4 shiftwidth=4
```

## Example

```basic
' MMBasic Example - LED Blink
OPTION EXPLICIT

CONST LED_PIN = GP21
CONST DELAY = 500

SUB Blink(times AS INTEGER)
  LOCAL i AS INTEGER
  FOR i = 1 TO times
    PIN(LED_PIN) = 1
    PAUSE DELAY
    PIN(LED_PIN) = 0
    PAUSE DELAY
  NEXT i
END SUB

' Main program
SETPIN LED_PIN, DOUT
Blink(10)
PRINT "Done!"
```

## Supported Syntax

### Control Flow
```basic
IF condition THEN
  ' statements
ELSEIF condition THEN
  ' statements  
ELSE
  ' statements
END IF

FOR i = 1 TO 10 STEP 2
  ' statements
NEXT i

DO WHILE condition
  ' statements
LOOP

SELECT CASE variable
  CASE 1
    ' statements
  CASE 2 TO 5
    ' statements
  CASE ELSE
    ' statements
END SELECT
```

### Hardware Control
```basic
' Pin configuration
SETPIN GP21, DOUT
SETPIN GP26, AIN
SETPIN GP0, I2C SDA
SETPIN GP1, I2C SCL

' Digital I/O
PIN(GP21) = 1           ' Set high
x = PIN(GP2)            ' Read pin

' Analog input
voltage = PIN(GP26) * 3.3 / 4095

' PWM output
PWM GP5, 1000, 50       ' 1kHz, 50% duty

' I2C communication
I2C OPEN 100, 1000
I2C WRITE &H48, 0, 1, &H01
I2C CLOSE
```

### Graphics
```basic
CLS                              ' Clear screen
COLOUR 255, 0, 0                ' Red
BOX 10, 10, 100, 100            ' Draw box
CIRCLE 160, 120, 50             ' Draw circle
TEXT 10, 200, "Hello!", "LT", 2 ' Display text
```

## Help

View the full documentation in Vim:
```vim
:help mmbasic
```

## Color Schemes

The syntax file uses standard Vim highlight groups:
- `Statement` - Keywords (IF, FOR, PRINT, etc.)
- `Function` - Built-in functions (SIN, COS, LEN, etc.)
- `Type` - Data types (INTEGER, FLOAT, STRING)
- `Operator` - Operators (AND, OR, NOT, MOD, etc.)
- `Comment` - Comments (' and REM)
- `String` - String literals
- `Number` - Numeric constants
- `Constant` - Pin names (GP0-GP47)

These work with any Vim color scheme!

## Compatibility

**Supports:**
- Vim 7.0 and later
- Neovim
- All PicoMite firmware versions
- WebMite (WiFi versions)

**File Extensions:**
- `.bas` - BASIC files
- `.mmb` - MMBasic files

## Documentation

For complete MMBasic reference:
- **PicoMite Manual**: http://geoffg.net/Downloads/picomite/PicoMite_User_Manual.pdf
- **Official Site**: http://geoffg.net/picomite.html
- **Community**: http://mmbasic.com
- **Forum**: http://www.thebackshed.com/forum/Microcontrollers

## License

Same as Vim itself. See `:help license` in Vim.

## Credits

- **MMBasic**: Geoff Graham & Peter Mather
- **PicoMite**: Peter Mather (matherp)
- **Manual**: Geoff Graham with community input
- **Vim Plugin**: Based on PicoMite User Manual V6.02.00

## Contributing

Issues, suggestions, and improvements welcome!

Based on the official PicoMite User Manual V6.02.00 (February 11, 2026).

---

Happy MMBasic coding in Vim! 🚀
