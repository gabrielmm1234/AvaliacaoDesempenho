class AddRefToQuestion < ActiveRecord::Migration
  def change
    add_reference :questions, :answer_option, index: true, foreign_key: true
  end
end
