# csr     cs      Change scrolling region to lines #1 through #2 (P)
# sc saves cursor current position
# rc restores cursor to previous sc
LINES=$(tput lines)

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

	tput sc

    # Move cursor to last line in your screen
	tput cup $LINES 0;
	tput el
    echo -n -e "${output_string}"

	tput rc
}
