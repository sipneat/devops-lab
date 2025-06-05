# Linux Commands

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

## `find`

- `find path -name "pattern"` find files by name
  - `-type` specify the type of thing
    - `f` file
    - `d` directory
  - `-print` print the found files
  - `-delete` delete the found files
  - `-size` size of the file
    - Ex: `find . -size +1M` finds files larger than 1MB
  - `-exec` execute a command on the found files
    - Ex: `find . -name "*.txt" -exec rm {} \;` deletes all `.txt` files

## Bash Scripting

### Basics

- `#!/bin/bash` shebang (first line of the script)
- `chmod +x script` make the script executable
- `./script` run the script
- `export` export a variable to the environment
- `echo` print to the console

### I/O

- `read` read input from the user
- `read -p` prompt the user for input
  - Ex: `read -p "Enter your name: " name` prompts the user for their name
- `read -a` read input into an array
- `read -s` read input silently (no echo)
  - Ex: `read -s -p "Enter your password: " password` reads a password without echoing it

- `printf` format output
  - Ex: `printf "Hello %s\n" $name` prints "Hello John" if the variable `name` is "John"

### Variables

- `var=value` assign a value to a variable
  - Ex: `name="John"` assigns "John" to the variable `name`
  - `name='hi "John"'` nested quotes (also `"hi \"John\""`)
- `echo $var` print the value of a variable

### Conditionals

- `if` statement
  
```bash
if [ condition ]; then
  # code to execute if condition is true
fi
```

- `case` conditional statement

```bash
case $var in
  pattern1)
    # code to execute if pattern1 matches
    ;;
  pattern2)
    # code to execute if pattern2 matches
    ;;
  *)
    # code to execute if no patterns match
    ;;
esac
```

### Loops

- `for` loop

```bash
for var in list; do
  # code to execute for each item in the list
done
```

```bash
for ((i=0; i<5; i++)); do
  # code to execute for each iteration
done
```

- `while` loop

```bash
while [ condition ]; do
  # code to execute while condition is true
done
```

### Functions

- `function` definition

```bash
function_name() {
  # code to execute
  arg1=$1
  return value
}
```

- `function_name` call the function

```bash
function_name arg1 arg2
```

## Systemd and Process Monitoring

- `systemctl` command to manage systemd services
  - `systemctl start service` start a service
  - `systemctl stop service` stop a service
  - `systemctl restart service` restart a service
  - `systemctl status service` check the status of a service
  - `systemctl enable service` enable a service to start on boot
  - `systemctl disable service` disable a service from starting on boot
- `ps` command to list processes
  - `ps aux` list all processes
  - `ps -ef` list all processes with full format
  - `ps -u user` list processes for a specific user
- `top` command to monitor system processes in real-time
- `journalctl` command to view system logs
  - `journalctl -u service` view logs for a specific service
  - `journalctl -f` follow the logs in real-time
  - `journalctl --since "YYYY-MM-DD HH:MM:SS"` view logs since a specific date and time
  - `journalctl --until "YYYY-MM-DD HH:MM:SS"` view logs until a specific date and time
