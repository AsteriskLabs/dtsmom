class Order < ActiveRecord::Base
  attr_accessible :description, :status, :title
  belongs_to :client
  belongs_to :admin
  has_many :updates
end
