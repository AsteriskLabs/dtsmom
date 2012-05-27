class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  # :registerable
  devise :google_authenticatable, :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :gauth_enabled, :gauth_tmp, :gauth_tmp_datetime, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :gauth_enabled, :gauth_tmp, :gauth_tmp_datetime, :title, :body
  has_many :comments
  has_many :orders
end
