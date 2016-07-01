class Image < ActiveRecord::Base
	belongs_to :employer
	validates_presence_of :employer
	# mount images
  mount_uploader :file, ImageUploader
  validates_processing_of :file
  validate :file_size_validation

	private
	def file_size_validation	
    errors[:file] << "should be less than 1 MB" if file.size > 1.megabytes
  end
end
