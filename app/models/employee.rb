##########################################
# Table Employee
#
#
# id:                        integer
# email:                     string
# encrypted_password:        string
# reset_password_token:      string
# reset_password_sent_at:    datetime
# remember_created_at:       datetime
# sign_in_count              integer
# current_sign_in_at         datetime
# last_sign_in_at            datetime
# current_sign_in_ip         string
# last_sign_in_ip            string
# created_at                 datetime
# updated_at                 datetime
# first_name                 string
# last_name                  string
###########################################

class Employee < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Association
  belongs_to :city
  has_many :job_applications, class_name: "JobApplication",
                          foreign_key: "employee_id",
                          dependent: :destroy

  has_many :jobs, through: :job_applications, source: :job

  # mount avatar
  mount_uploader :avatar, ImageUploader
  validates_processing_of :avatar
	validate :avatar_size_validation

  # mount resume
  mount_uploader :resume, ResumeUploader
  validates_processing_of :resume
  validate :resume_size_validation

	private
	def avatar_size_validation
		errors[:avatar] << "should be less than 1 MB" if avatar.size > 1.megabytes
	end

  def resume_size_validation
    errors[:resume] << "should be less than 1 MB" if resume.size > 1.megabytes
  end
end
