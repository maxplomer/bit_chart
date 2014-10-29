desc "This task is called by the Heroku scheduler add-on"
task :update_quotes => :environment do
  puts "Updating quotes..."
  Quote.update_quotes
  puts "done."
end