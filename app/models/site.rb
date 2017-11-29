class Site < ApplicationRecord

	require "http"
	require "openssl"
	require "ipaddress"
	require "net/http"

	OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

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