desc "Cron task ran by heroku daily"
task :cron => ['saas:daily', 'sadhana:clear_deleted_practices']