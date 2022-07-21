force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
	  color_prompt=
  fi
fi

# git integration
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# custom prompt
if [ "$color_prompt" = yes ]; then
    PS1='\[\033[1;35m\]\u\[\033[00m\]:\w\[\033[1;35m\]$(parse_git_branch)\[\033[00m\]\$ '
else
    PS1='\u:\w$(parse_git_branch)\$ '
fi
unset color_prompt force_color_prompt