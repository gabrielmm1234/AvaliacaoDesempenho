class AddFieldsToArea < ActiveRecord::Migration
  def change
    add_reference :areas, :evaluation_model, index: true, foreign_key: true
  end
end
