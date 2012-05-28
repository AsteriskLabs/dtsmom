class Order < ActiveRecord::Base
  attr_accessible :description, :title
  belongs_to :client
  belongs_to :admin
  has_many :updates
  has_many :items
end
