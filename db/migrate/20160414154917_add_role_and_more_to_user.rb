class AddRoleAndMoreToUser < ActiveRecord::Migration
  def change
    add_reference :users, :role, index: true, foreign_key: true
    add_reference :users, :junior_enterprise, index: true, foreign_key: true
  end
end
