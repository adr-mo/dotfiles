if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_greeting ""
if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_greeting ""

set -U fish_user_paths /Users/Adrien/.rd/bin:/Users/Adrien/.local/bin:/usr/local/opt/mysql-client@8.4/bin $fish_user_paths

starship init fish | source

set --export EZA_CONFIG_DIR "/Users/Adrien/.config/eza"

set --export FZF_DEFAULT_OPTS "
    --height=99%
    --layout=reverse
    --pointer='█'
    --scrollbar='▌'
    --highlight-line
    --border=none \
    --color=bg+:#2d3f76 \
    --color=bg:#000000 \
    --color=border:#589ed7 \
    --color=fg:#c8d3f5 \
    --color=gutter:#1e2030 \
    --color=header:#ff966c \
    --color=hl+:#65bcff \
    --color=hl:#65bcff \
    --color=info:#545c7e \
    --color=marker:#ff007c \
    --color=pointer:#ff007c \
    --color=prompt:#65bcff \
    --color=query:#c8d3f5:regular \
    --color=scrollbar:#589ed7 \
    --color=separator:#ff966c \
    --color=spinner:#ff007c \
    "

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/usr/local/bin/"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
