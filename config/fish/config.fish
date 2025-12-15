if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting

set -U fish_user_paths /opt/homebrew/opt/php@8.2/bin
set fish_user_paths /opt/homebrew/opt/php@8.2/sbin /opt/homebrew/opt/php@8.2/bin
set -U fish_user_paths /Users/Adrien/.rd/bin:/Users/Adrien/.local/bin:/opt/homebrew/opt/mysql-client@8.4/bin:/opt/homebrew/opt/mysql@8.4/bin $fish_user_paths
set -Ux FZF_DEFAULT_OPTS "\
--highlight-line \
--info=inline-right \
--ansi \
--layout=reverse \
--border=none \
--color=bg+:#262f33 \
--color=bg:#1e2528 \
--color=border:#b2caed \
--color=fg:#f8f9e8 \
--color=gutter:#1e2528 \
--color=header:#f5d098 \
--color=hl+:#b3e3ca \
--color=hl:#b3e3ca \
--color=info:#96b4aa \
--color=marker:#f3c0e5 \
--color=pointer:#f3c0e5 \
--color=prompt:#b3e3ca \
--color=query:#f8f9e8:regular \
--color=scrollbar:#b2caed \
--color=separator:#f5d098 \
--color=spinner:#f3c0e5
"

set -l foreground f8f9e8
set -l selection 374145
set -l comment 96b4aa
set -l red f57f82
set -l orange f5d098
set -l yellow f5d098
set -l green cbe3b3
set -l purple f3c0e5
set -l cyan b3e3ca
set -l pink f6cee5

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

starship init fish | source
zoxide init fish | source
fzf --fish | source
