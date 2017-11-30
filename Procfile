web: bundle exec puma -C config/puma.rb
worker1: QUEUE=serverchecks rake jobs:work
worker2: QUEUE=sendsms rake jobs:work