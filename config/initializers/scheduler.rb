require 'rufus-scheduler'

scheduler = Rufus::Scheduler::singleton

scheduler.every '1m' do
	Site.all.each do |site|
		site.check_server
	end
end