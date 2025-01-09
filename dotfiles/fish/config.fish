starship init fish | source

set fish_greeting
set -gx GPG_TTY (tty)

alias emerge "sudo emerge"
alias eselect "sudo eselect"
alias emaint "sudo emaint"
alias flatpak "sudo flatpak"
alias neofetch "fastfetch"
alias joefetch "fastfetch"
alias pfetch "fastfetch"
alias flashrom "sudo flashprog"
alias flashprog "sudo flashprog"

set -U fish_user_paths /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /bin /sbin $HOME/.local/bin/ $HOME/.cargo/bin/ $fish_user_paths

function bind_bang
    switch (commandline --current-token)[-1]
    case "!"
        commandline --current-token -- $history[1]
        commandline --function repaint
    case "*"
        commandline --insert !
    end
end

function fish_user_key_bindings
    bind ! bind_bang
end

