function fish_prompt
	set -l user (set_color cyan) $USER (set_color ff10f0)" @ "
	set -l pwd (set_color cyan)"["(prompt_pwd --full-length-dirs 2)"]"
	set -l last_status $status
	
	# Git status setup

	set -g __fish_git_prompt_char_cleanstate ✔
	set -g __fish_git_prompt_char_stateseparator ' '
	set -g __fish_git_prompt_showcolorhints true
	set -g __fish_git_prompt_showdirtystate true

	set -g __fish_git_prompt_color cyan
	set -g __fish_git_prompt_color_dirtystate ff10f0
	set -g __fish_git_prompt_color_stagedstate green

	set -g __fish_git_prompt_color_branch cyan 
	set -g __fish_git_prompt_color_branch_dirty ff10f0
	set -g __fish_git_prompt_color_branch_staged green

	set -g __fish_git_prompt_color_cleanstate cyan 
	set -g __fish_git_prompt_color_dirtystate ff10f0 
	set -g __fish_git_prompt_color_stagedstate green 

	set -l git_status (set_color normal) (fish_git_prompt)

	set -l stat
	set -l arrow
	if test $last_status -ne 0
		set stat (set_color red) "[$last_status]"
		set arrow (set_color red) " -> "(set_color normal)
	else
		set arrow (set_color green) " -> "(set_color normal)
	end


	string join '' -- $user $pwd $git_status $stat \n $arrow
end
