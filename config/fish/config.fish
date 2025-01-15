if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_greeting ""

set -U fish_user_paths /Users/Adrien/.rd/bin:/Users/Adrien/.local/bin:/usr/local/opt/mysql-client@8.4/bin $fish_user_paths

starship init fish | source

# Gruvbox Color Palette
set -l foreground d4be98
set -l selection 665c54
set -l comment 928374
set -l red fb4934
set -l orange fe8019
set -l yellow fabd2f
set -l green b8bb26
set -l purple d3869b
set -l cyan 83a598
set -l pink d3869b

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_option $pink
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
set -g fish_pager_color_selected_background --background=$selection

set --export EZA_CONFIG_DIR "/Users/Adrien/.config/eza"
### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/Adrien/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
