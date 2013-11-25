class Donation < ActiveRecord::Base
	ONETIME = "One Time"
	WEEKLY = "Weekly"
	MONTHLY = "Monthly"
	ANUALLY = "Anually"
	RecurrenceOptions = [ONETIME, WEEKLY, MONTHLY, ANUALLY]
end