function code-fixer --wraps='./vendor/bin/php-cs-fixer --config=.php-cs-fixer.dist.php --diff fix' --description 'alias code-fixer=./vendor/bin/php-cs-fixer --config=.php-cs-fixer.dist.php --diff fix'
  ./vendor/bin/php-cs-fixer --config=.php-cs-fixer.dist.php --diff fix $argv
        
end
