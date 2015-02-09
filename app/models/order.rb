class Order < ActiveRecord::Base
  belongs_to :model
  belongs_to :user
  PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]
end
