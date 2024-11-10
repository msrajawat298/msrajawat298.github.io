Here’s a comprehensive list of useful `vi` (or `vim`) commands for text editing in Linux:

### Basic Navigation:
- `w` - Move cursor forward to the beginning of the next word
- `b` - Move cursor backward to the beginning of the previous word
- `0` - Move to the beginning of the current line
- `$` - Move to the end of the current line
- `gg` - Go to the beginning of the file
- `G` - Go to the end of the file
- `nG` - Go to line number `n`
- `Ctrl+f` - Move one page forward
- `Ctrl+b` - Move one page backward
- `H` - Move cursor to the top of the screen
- `M` - Move cursor to the middle of the screen
- `L` - Move cursor to the bottom of the screen

### Inserting and Editing:
- `i` - Enter insert mode before the cursor
- `I` - Enter insert mode at the beginning of the line
- `a` - Enter insert mode after the cursor
- `A` - Enter insert mode at the end of the line
- `o` - Open a new line below the current line and enter insert mode
- `O` - Open a new line above the current line and enter insert mode
- `Esc` - Exit insert mode
- `r` - Replace a character under the cursor
- `R` - Replace multiple characters starting from the cursor
- `cw` - Change (delete and replace) a word
- `C` - Change (delete and replace) from cursor to the end of the line
- `x` - Delete the character under the cursor
- `dd` - Delete the current line
- `D` - Delete from the cursor to the end of the line
- `yy` - Copy (yank) the current line
- `p` - Paste the copied content after the cursor
- `P` - Paste the copied content before the cursor
- `u` - Undo the last change
- `Ctrl+r` - Redo the last undone change

### Searching and Replacing:
- `/pattern` - Search for `pattern` forward in the file
- `?pattern` - Search for `pattern` backward in the file
- `n` - Move to the next occurrence of the search
- `N` - Move to the previous occurrence of the search
- `:%s/old/new/g` - Replace all occurrences of `old` with `new` in the file
- `:s/old/new/g` - Replace all occurrences of `old` with `new` in the current line
- `:s/old/new/gc` - Replace with confirmation in the current line

### File Operations:
- `:w` - Save the file
- `:w filename` - Save the file as `filename`
- `:q` - Quit `vi`
- `:q!` - Quit `vi` without saving changes
- `:wq` or `ZZ` - Save and quit `vi`
- `:x` - Save and quit (same as `:wq`)
- `:e filename` - Open a new file for editing
- `:x` - Save and exit the file

### Miscellaneous:
- `:set number` - Show line numbers
- `:set nonumber` - Hide line numbers
- `:set autoindent` - Enable automatic indentation
- `:set tabstop=4` - Set tab width to 4 spaces
- `:set expandtab` - Use spaces instead of tabs for indentation
- `:set shiftwidth=4` - Set indentation width to 4 spaces
- `:set paste` - Disable auto-indentation and other formatting (useful when pasting code)

### Visual Mode:
- `v` - Start visual mode (select characters)
- `V` - Start line visual mode (select whole lines)
- `Ctrl+v` - Start block visual mode (select a block of text)
- `d` - Delete the selected text in visual mode
- `y` - Yank (copy) the selected text in visual mode
- `p` - Paste the yanked text

### Advanced Features:
- `:split` or `:sp` - Split the window horizontally
- `:vsplit` or `:vsp` - Split the window vertically
- `Ctrl+w h` - Switch to the left window
- `Ctrl+w j` - Switch to the window below
- `Ctrl+w k` - Switch to the window above
- `Ctrl+w l` - Switch to the right window
- `:tabnew` - Open a new tab
- `:tabnext` - Switch to the next tab
- `:tabprev` - Switch to the previous tab

These commands should cover most tasks when working with `vi`.