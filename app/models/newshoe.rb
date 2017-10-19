class Newshoe < ActiveRecord::Base
  belongs_to :user
  validates :name, :amount, presence: true 
  has_one :purchase
end
