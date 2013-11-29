class User < ActiveRecord::Base
  rolify
  uniquify :token, length: 48
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  validates_format_of :password, with: /(?=.{5})(?=.{1,}\d)/,
    message: 'must not be less than 5 characters containing one number'
end