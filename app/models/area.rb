class Area < ActiveRecord::Base
  has_many :users
  belongs_to :evaluation_model
end
