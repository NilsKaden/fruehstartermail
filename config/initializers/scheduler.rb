=begin
require 'rufus-scheduler'

s = Rufus::Scheduler.singleton

# heroku scheduler might be worth looking into

unless defined?(Rails::Console) || File.split($0).last == 'rake'

  # only schedule when not running from the Ruby on Rails console
  # or from a rake task

  # does something every day at 11 AM
  s.cron '00 11 * * *' do
    puts "hello, it's #{Time.now}"
    User.check_all
  end
  
  
  ## this will be changed to a daily check for a birthday
  ## or a check every 29 minutes to keep the process running on heroku
end

=end