require 'rufus-scheduler'

scheduler = Rufus::Scheduler::singleton

scheduler.every '2m' do

	puts "SCHEDULER STARTED"

	account_sid = "AC241e3bb37cec6542de4225e9a24c96e9"
    auth_token = "43471435da648c078187b2c75a278749"

    fromNumber = "+15876004945"

   	client = Twilio::REST::Client.new(account_sid, auth_token)

	Site.all.each do |site|
		site.delay(:queue => 'serverchecks').scheduled_check(client, fromNumber)
	end
end