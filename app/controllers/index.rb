get '/' do
"hello world i am deploying!!!!!"
end

# IN case of error in rspec error in production in heroku deployment
# begin
#   require 'rspec/core/rake_task'
# rescue LoadError => e
#   puts "Running in Production #{3}"
# always check rake -T so now i know my rake file is running
# end

# heroku logs to see the server error
# heroku run rake db:migrate (you can run almost anything on heroku)
# heroku run rake db:seed


# ssh public key and private key

# psql

# \connect snacker_Dev
