class Purchase < ActiveRecord::Base
  belongs_to :newshoe
  belongs_to :user
end
