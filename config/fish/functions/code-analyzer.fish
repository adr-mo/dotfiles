function code-analyzer --wraps='./vendor/bin/phpstan analyze --configuration=phpstan.core.neon --level=9 --memory-limit=1G' --description 'alias code-analyzer=./vendor/bin/phpstan analyze --configuration=phpstan.core.neon --level=9 --memory-limit=1G'
  ./vendor/bin/phpstan analyze --configuration=phpstan.core.neon --level=9 --memory-limit=1G $argv
        
end
