# csr     cs      Change scrolling region to lines #1 through #2 (P)
LINES=$(tput lines)
COLS=$(tput cols)

source ~/dotfiles/bash/colors.bash

set_window()
{
    # Create a virtual window that is two lines smaller at the bottom.
	# Clear with tput reset
	clear
    tput csr 0 $(($LINES-2))
}
set_window 

sticky_text()
{
	local output_string="${GREEN}--- EXECUTING [${YELLOW}$1${GREEN}] ---${RESET}"
	local initial_col=$(($COLS - ${#output_string}))

    # Move cursor to last line, centered in your screen
	tput cup $LINES $(($initial_col/2));

    echo -n -e "${output_string}"

    # Move cursor to home position, back in virtual window
    tput cup 0 0
}
