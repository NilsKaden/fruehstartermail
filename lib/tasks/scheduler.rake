desc "This task is called by the Heroku scheduler add-on daily to check for birthdays and send mails"

task :check => :environment do
    puts "Checking invoked by Heroku"
    User.check_all
    puts "check done"
end