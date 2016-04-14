class AddFieldsToRequestHistory < ActiveRecord::Migration
  def change
    add_reference :request_histories, :role, index: true, foreign_key: true
    add_reference :request_histories, :junior_enterprise, index: true, foreign_key: true
  end
end
