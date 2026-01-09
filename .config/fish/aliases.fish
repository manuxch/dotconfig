alias cam 'nohup mpv rtsp://admin:1234qwer@192.168.1.37 &>/dev/null &'
# conexiones al iflysib
alias iy 'ssh -p22 manuel@10.100.0.145'
alias sutn 'ssh mcarlevaro@10.2.2.4'
alias slurm 'ssh mcarlevaro@10.100.0.202'
alias vpn 'cd ~/Tools/mcarlevaro && sudo openvpn client.conf'
# alias to show the date
alias da='date "+%y-%m-%d %a %t %z"'
# alias to show weather
alias meteo='curl wttr.in'
# cd into the old directory
alias bd='cd "$oldpwd"'
# remove a directory and all files
alias rmd='/bin/rm  --recursive --force --verbose '
# alias's for multiple directory listing commands
alias ls lsd
alias labc 'ls -- -p -lap' #alphabetical sort
alias lf "ls -lh | egrep -v '^d'" # files only
alias ldir "ls -l | egrep '^d'" # directories only
alias latr "ls -latrh" # ordenados por antiguedad
alias sl ls
alias la 'ls -afh' # compact view, show hidden
alias ll 'ls -alh'
alias l 'ls -ah'
alias l1 'ls -1h'
alias lf 'ls -fh'
alias c clear
alias h '"history | grep "'
alias p '"ps aux | grep "'
alias topcpu '"/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"'
alias f '"find . | grep "'
alias ipview '"netstat -anpl | grep :80 | awk {print \$5} | cut -d\":\" -f1 | sort | uniq -c | sort -n | sed -e s/^ *// -e s/ *\$//"'
alias diskspace '"du -S | sort -n -r |more"'
alias folders 'du -h --max-depth 1'
alias folderssort 'find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree 'tree -CAhF --dirsfirst'
alias treed 'tree -CAFd'
# alias para actualizar el sistema
alias aptupgd 'sudo apt-get update && sudo apt-get dist-upgrade -v && sudo apt-get autoremove'

# alias para correr freecad 
alias freecad 'QT_QPA_PLATFORM=xcb freecad'
