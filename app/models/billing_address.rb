class BillingAddress < ActiveRecord::Base
	has_many :paymentmethods
end
