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
end
