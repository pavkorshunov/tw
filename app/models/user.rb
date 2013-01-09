# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
     attr_accessible   :email, :name, :password, :password_confirmation   #Attributes which can be modify
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_secure_password

  validates :name,  
                    :presence => true,
                    :length =>{ :maximum => 50 }
  validates :email, 
                    :presence => true,
                    :format   => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
  validates :password,
                    :presence => true, 
                    :confirmation => true,
                    :length => { :within => 6..40 }
  validates :password_confirmation,
                    :presence => true
 end
