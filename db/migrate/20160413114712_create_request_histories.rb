class CreateRequestHistories < ActiveRecord::Migration
  def change
    create_table :request_histories do |t|
      t.string :name
      t.string :email
      t.references :profile, index: true, foreign_key: true
      t.boolean :approved

      t.timestamps null: false
    end
  end
end
