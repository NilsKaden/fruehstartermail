require 'rufus-scheduler'

s = Rufus::Scheduler.singleton

puts "Initialized Rufus-Scheduler"


unless defined?(Rails::Console) || File.split($0).last == 'rake'

  # only schedule when not running from the Ruby on Rails console
  # or from a rake task

  s.every '1m' do
    puts "hello, it's #{Time.now}"
    User.check_all
  end
  
  
  ## this will be changed to a daily check for a birthday
  ## or a check every 29 minutes to keep the process running on heroku
end