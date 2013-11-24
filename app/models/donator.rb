class Donator < ActiveRecord::Base
	has_many :phonenumbers
	has_many :billingaddresses
	has_many :paymentmethods
	has_many :donations
end
