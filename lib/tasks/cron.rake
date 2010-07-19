desc "Cron task ran by heroku daily"
task :cron => ['saas:daily']