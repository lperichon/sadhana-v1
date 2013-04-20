desc "Cron task ran by heroku daily"
task :cron => ['sadhana:one_sec_a_day', 'saas:daily', 'sadhana:clear_deleted_practices']