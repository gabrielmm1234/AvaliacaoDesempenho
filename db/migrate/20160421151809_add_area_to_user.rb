class AddAreaToUser < ActiveRecord::Migration
  def change
    add_reference :users, :area, index: true, foreign_key: true
  end
end
