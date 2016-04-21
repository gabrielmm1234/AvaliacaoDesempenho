class AddAreaToEvaluationModel < ActiveRecord::Migration
  def change
    add_reference :evaluation_models, :area, index: true, foreign_key: true
  end
end
