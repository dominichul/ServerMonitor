class Site < ApplicationRecord

	require 'openssl'
	OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

	belongs_to :user
	attr_accessor :autoLocate
	before_save :downcase_email
	before_validation :check_autoLocate, on: [:create, :update]
	IP_REGEX = /^([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}$/
	validates :ipaddress, :presence => true, :format => { :with => Regexp.union(Resolv::IPv4::Regex, Resolv::IPv6::Regex)}
	validates :description, length: { maximum: 255 }
	validates :latitude , numericality: { greater_than_or_equal_to:  -90, less_than_or_equal_to:  90 }
	validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :callout, format: {  with: VALID_EMAIL_REGEX  }

	private
		def downcase_email
			callout.downcase!
		end

		def check_autoLocate
			if autoLocate == "1"
				coords = getCoordinatesFromIP
				if !coords.nil?
					self.longitude = coords[0].longitude
					self.latitude = coords[0].latitude
				else
					self.longitude = nil
					self.latitude = nil
				end
			end

		end

		def getCoordinatesFromIP
			if( Regexp.union(Resolv::IPv4::Regex, Resolv::IPv6::Regex).match?(ipaddress))
				Geocoder.search(ipaddress)
			else
				errors.add_to_base("Invalid IP address")
				return nil
			end
		end

end