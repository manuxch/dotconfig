if status is-interactive
    # Commands to run in interactive sessions can go here
end

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

fish_add_path $HOME/.local/bin
fish_add_path /opt/ovito-basic-3.12.4-x86_64/bin

zoxide init fish | source
source ~/.config/fish/aliases.fish
