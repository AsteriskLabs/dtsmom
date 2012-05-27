class Update < ActiveRecord::Base
  attr_accessible :comment
  belongs_to :order
  belongs_to :admin
end
