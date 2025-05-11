## `chmod`
- `chmod +x file`
  - makes the script file executable

## `grep`
- grep is basically ctrl+f in command line
- `alias grep='grep --color=auto'`
  - highlights the matched pattern in the output
- `grep -args "pattern" file`
  - `-i` ignores case (Linux vs linux)
  - `-q` quiet mode (no output, return 0 if found, 1 if not)
  - `-r` recursive (search in all files in a directory)
  - `-w` whole word
  - `-n` line number
  - `-C n` print n lines of context

## `awk`
- `awk '{}' file` filters and manipulates outputs
  - `awk '{print $n,$m}'` print the nth and mth fields of each line
    - `$0` whole line
    - `$NF` last field
    - Ex: `date | awk '{print $2,$3,$6}'` prints a readable date
  - `OFS` output field separator
    - Ex: `date | awk 'OFS="-" {print $2,$3,$6}'` prints a readable date with `-` as separator
  - `-F` input field separator
    - Ex: `awk -F: '{print $1,$2}' /etc/passwd` prints $1 and $2 that are separated by `:`
  - `BEGIN` and `END` blocks
    - Ex: `awk 'BEGIN {print "------Start------"} {print $0} END {print "------End------\nyeah"}'` 
  - Expressions
    - Ex: `awk '{$1 > 10 print $0}'` prints lines where the first field is greater than 10

## `sed`
