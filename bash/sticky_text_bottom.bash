# Bottom permanent line
LINES=$(tput lines)

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
    # Move cursor to last line in your screen
    tput cup $LINES 0;

    echo -n "--- EXECUTING [$1]  ---"

    # Move cursor to home position, back in virtual window
    tput cup 0 0
}
