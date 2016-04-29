class AddLockedToEvaluation < ActiveRecord::Migration
  def change
    add_column :evaluations, :locked, :boolean
  end
end
