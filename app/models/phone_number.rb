class PhoneNumber < ActiveRecord::Base
	has_many :paymentmethods
	has_many :causes
end