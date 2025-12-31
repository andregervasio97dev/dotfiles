function ll --wraps=eza --description 'alias ll=eza --all --oneline --icons=always --sort Name --group-directories-last --total-size --long --tree'
  command eza --all --oneline --icons=always --sort Name --group-directories-last --total-size --long -h --tree --git-ignore --level 2 $argv
end
