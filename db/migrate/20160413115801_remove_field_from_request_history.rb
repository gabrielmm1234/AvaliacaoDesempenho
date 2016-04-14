class RemoveFieldFromRequestHistory < ActiveRecord::Migration
  def change
    remove_reference :request_histories, :profile, index: true, foreign_key: true
  end
end
