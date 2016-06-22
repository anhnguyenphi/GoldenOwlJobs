###########################################
#Table Employer
#
#
# id                          integer
# email                       string
# encrypted_password          string
# reset_password_token        string
# reset_password_sent_at      string
# remember_created_at         string
# sign_in_count               integer
# current_sign_in_at          datetime
# last_sign_in_at             datetime
# current_sign_in_ip          string
# last_sign_in_ip             string
# created_at                  datetime
# updated_at                  datetime
# name                        string
# short_description           text
# full_description            text 
# offer												text
# address											string


class Employer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #associations
  has_many :jobs, dependent: :destroy

  #validate
  #validates :name, presence: true


end
