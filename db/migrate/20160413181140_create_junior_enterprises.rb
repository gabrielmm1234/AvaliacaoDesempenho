class CreateJuniorEnterprises < ActiveRecord::Migration
  def change
    create_table :junior_enterprises do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
