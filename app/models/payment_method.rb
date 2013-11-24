class PaymentMethod < ActiveRecord::Base
	has_many :donations
end
