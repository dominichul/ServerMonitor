class Site < ApplicationRecord

	require "http"
	require "openssl"
	require "ipaddress"

	belongs_to :user
	attr_accessor :autoLocate
	before_save :downcase_email
	IP_REGEX = /^([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}$/
	validates :ipaddress, :presence => true, :format => { :with => Regexp.union(Resolv::IPv4::Regex, Resolv::IPv6::Regex), message: "is invalid"}
	validates :description, length: { maximum: 255 }
	validates :latitude , numericality: { greater_than_or_equal_to:  -90, less_than_or_equal_to:  90 }
	validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :callout, format: {  with: VALID_EMAIL_REGEX  }


		def check_server
			begin
				res = HTTP.timeout(:global, :write => 1, :connect => 2, :read => 1).head("http://#{self.ipaddress}")
				if res.code.to_i < 500
					self.update_attributes(:status => true, :lastchecked => Time.now)
				else
					self.update_attributes(:status => false, :lastchecked => Time.now)
				end
			rescue Exception => ex
				self.update_attributes(:status => false, :lastchecked => Time.now)
			end
		end

		def scheduled_check(client, fromNumber)
			begin
				res = HTTP.timeout(:global, :write => 1, :connect => 2, :read => 1).head("http://#{self.ipaddress}")
				if res.code.to_i < 500
					self.update_attributes(:status => true, :lastchecked => Time.now)
				else
					self.update_attributes(:status => false, :lastchecked => Time.now)
					self.delay(:queue => 'serverchecks').send_sms(client, fromNumber) #change queue to sendsms once deployed. Heroku only allows for 1 worker process
				end
			rescue Exception => ex
				self.update_attributes(:status => false, :lastchecked => Time.now)
				self.delay(:queue => 'serverchecks').send_sms(client, fromNumber) #change queue to sendsms once deployed. Heroku only allows for 1 worker process
			end
		end

		def check_autoLocate
			if autoLocate == "1"
				coords = getCoordinatesFromIP
				if !coords[0].nil?
					self.longitude = coords[0].longitude
					self.latitude = coords[0].latitude
				else
					self.longitude = nil
					self.latitude = nil
				end
			end		
		end

		def send_sms(client, fromNumber)
			puts "Entered send_sms for address: #{self.id}"
			client.messages.create(
      			to: "+15872230517",
      			from: fromNumber,
      			body: "Your server #{self.ipaddress} is down"
    		)
		end

		#static methods
		def self.check_server(address)
			begin
				res = HTTP.timeout(:global, :write => 1, :connect => 2, :read => 1).head("http://#{address}")
				if res.code.to_i < 500
					return true
				else
					return false
				end

			rescue Exception => ex
					return false
			end
		end

	private
		def downcase_email
			callout.downcase!
		end

		def getCoordinatesFromIP
			if( Regexp.union(Resolv::IPv4::Regex, Resolv::IPv6::Regex).match?(ipaddress))
				Geocoder.search(ipaddress)
			else
				return nil
			end
		end

end