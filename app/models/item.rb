class Item < ActiveRecord::Base
  attr_accessible :status, :description
  belongs_to :order
end
