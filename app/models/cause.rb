class Cause < ActiveRecord::Base
	has_many :donations
	mount_uploader :cause_image, CauseImageUploader
end