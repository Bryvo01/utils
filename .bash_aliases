# to temporarily bypass an alias, we preceed the command with a \
# EG: the lis command is aliased, but to use the normal ls command you would type \ls

# get to the UTSA fox servers
alias fox01='ssh -i ~/.ssh/kva578_id_rsa kva578@fox01'
alias fox02='ssh -i ~/.ssh/kva578_id_rsa kva578@fox02'
alias fox03='ssh -i ~/.ssh/kva578_id_rsa kva578@fox03'
alias fox04='ssh -i ~/.ssh/kva578_id_rsa kva578@fox04'

# some ls aliases
alias ls='ls -aFh --color=always' # add color and file type extensions
alias ll='ls -alF'
alias la='ls -Alh' #show hidden files
alias l='ls -CF'
alias lx='ls -lXBh' # sort by extension
alias lk='ls -lSrh' # sort by size
alias lc='ls -lcrh' # sort by change time
alias lu='ls -lurh' # sort by access time
alias lr='ls -lRh' # recursive ls
alias lt='ls -ltrh' # sort by date
alias lm='ls -alh |more' # pipe through 'more'
alias lw='ls -xAh' # wide listing format
alias labc='ls -lap' #alphabetical sort
alias lf="ls -l | egrep -v '^d'" # files only
alias ldir="ls -l | egrep '^d'" # directories only

# alias chmod commands
alias mx='chmod a+x'
alias 000='chmod -R 000'
alias 600='chmod -R 600'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'

# To see if a command is aliased, a file, or a built-in command
alias checkcommand="type -t"

# Show current network connections to the server
alias ipview="netstat -anpl | grep :80 | awk {'print \$5'} | cut -d\":\" -f1 | sort | uniq -c | sort -n | sed -e 's/^ *//' -e 's/ *\$//'"

# Show open ports
alias openports='netstat -nape --inet'

# Alias's for safe and forced reboots
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'

# Alias's to show disk space and space used in a folder
alias diskspace="du -S | sort -n -r |more"
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias mountedinfo='df -hT'

# Alias's for archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

# Show all logs in /var/log
alias logs="sudo find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"

# Search running processes
alias p="ps aux | grep "
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"

# fix my inability to type make correctly
alias maek='make'
alias mke='make'

# fix my sudo issues
alias sudp='sudo'

# other things that show I don't know how to type
alias givm='gvim'
alias cta='cat'
alias gerp='grep'
alias sl='ls'

# directory aliases
alias home='cd ~'
alias root='cd /'
alias dtop='cd ~/Desktop'
alias web='cd /var/www/html'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# random aliases that don't group with others
alias da='date "+%Y -%m-%d %A %T %Z"'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias rmd='/bin/rm --recursive --force --verbose'
alias ps='ps auxf'
alias less='less -R'
alias apt='sudo apt'
alias vi='vim'
alias cpu="grep 'cpu ' /proc/stat | awk '{usage=(\$2+\$4)*100/(\$2+\$4+\$5)} END {print usage}' | awk '{printf(\"%.1f\n\", \$1)}'"
alias kubectl='microk8s kubectl'

# have fun
alias please='sudo'
alias meow='cat'
