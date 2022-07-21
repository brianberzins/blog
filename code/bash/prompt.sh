if [ "$color_prompt" = yes ]; then
    PS1='\[\033[1;35m\]\u\[\033[00m\]:\w\[\033[1;35m\]$(parse_git_branch)\[\033[00m\]\$ '
else
    PS1='\u:\w$(parse_git_branch)\$ '
fi