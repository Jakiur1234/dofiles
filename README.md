### Some daily uses commands for beginners

| **Command** | **What it does ?** |
| --- | --- |
| j | Go Down |
| k | Go Up |
| h | Go Left |
| l | Go Right |
| i | Insert Mode |
| v | Visual Mode |
| V | Visual Line Mode |
| Ctrl + v | Visual Block Mode |
| $ | Go To End Of The Line |
| :w | Write A File |
| :! command_goes_here | Write command like this |
| :q | Exit The File |
| :q!  | Quit without save chagnes |
| :e hello/name.txt | If the file exist it will open the 
file otherwise it will create. |
| :b 1
:b name.txt | It will switch to buffer 1. By using this you can switch from a buffer to another. |
| Ctrl+6 | To switch the recent buffer |
| :sp | To Split Windows |
| A | Append to end of the line |
| :tabnew | Open a new tab |
| :tabp | Go to previous tab |
| :wa | Write all open files |
| :wqa | Write and quit all open files |
| :qa! | Quit and exit all open files |
| 0 | It will take to the start of the line |
| u | Undo |
| Ctrl+r | Redo |
| f w | It will take the cursor to the next w |
| t w | It will take the cursor to the before the w |
| /name | It will search `name` in the file  |
| :nohlesearch | It will unhighlight the search |
| * | It will search the current word |
| n | Go the next match |
| N | Go to the previous match |
| w | Go the start of the next word |
| e | Go to the end of the next word/current word |
| b | Go to the start of the previous word |
| ge | Go the end of the previous word |
| % | `( name )` This will toggle the cursor between parenthesis |
| v% | In visual mode it will select the all between the parenthesis |
| gg | Go to beginning of the file |
| G | Go the end of the file |
| I | Insert beginning of the line |
| x | Delete one character at a time |
| dw | Delete the current word |
| dW | Delete all between the next word ( with comma semicolon and others ) |
| dd | Delete the current line |
| _/^ | Go to first letter of the line |
| d^ | Delete all from current to beginning |
| d$ | Delete all from current to last of the line |
| d `anything.e.g.)}`  | It will delete until that. |
| dt, `use other sign to delete others` | It will delete current line until the cursor to comma |
| 4dd `Use line numbers to delete how much you want` | It will delete 4 lines |
| cw | Delete word and go to insert mode |
| C / c$ / c^ | Same as D just after done the job it will take you insert mode. |
| yw | Copy word |
| yy | Copy/Yank the current line |
| 5p | Paste 5 Time |
| P | For paste above current line |
| o | Open a new line below |
| O | Open a new line above |
| viw | Select the current word |
| vaw | Select the current word with extra space |
| vi `(` | Select all in the parenthesis |
| `Ctrl + i` `Ctrl + o` | In and out of the jump list |
| :Tutor | `For More………` |

### Copy, Paste, Find and Replace

| Command | What it does ? |
| --- | --- |
| `Ctrl + v` | For visual block mode |
| `Shift + i` | To insert multiple line in visual block mode |
| `c` | In visual block mode press c to remove some existing selected content and add go to insert mode. |
| / `search_anything` | It is use to search anything through a file |
| :%s/ `search` / `replace` / g | Find all replace in that file |
