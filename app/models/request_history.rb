class RequestHistory < ActiveRecord::Base
  belongs_to :profile
  belongs_to :junior_enterprise
  belongs_to :role
end
