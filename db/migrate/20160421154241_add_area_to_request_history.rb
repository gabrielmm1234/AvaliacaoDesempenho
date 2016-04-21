class AddAreaToRequestHistory < ActiveRecord::Migration
  def change
    add_reference :request_histories, :area, index: true, foreign_key: true
  end
end
