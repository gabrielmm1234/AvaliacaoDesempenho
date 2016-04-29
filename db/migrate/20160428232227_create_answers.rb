class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :evaluation, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.references :answer_option, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
