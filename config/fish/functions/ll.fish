function ll --wraps=ls --wraps='eza --icons -l' --description 'alias ll=eza --icons -l'
    eza --icons -l $argv
end
