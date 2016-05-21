class RequestHistory < ActiveRecord::Base
  belongs_to :profile
  belongs_to :junior_enterprise
  belongs_to :role
  belongs_to :area

  validates_presence_of :email, :name, :junior_enterprise_id, :role_id, :area_id
end
