class CreateJoinTableAnswerOptionQuestion < ActiveRecord::Migration
  def change
    create_join_table :answer_options, :questions do |t|
      # t.index [:answer_option_id, :question_id]
      # t.index [:question_id, :answer_option_id]
    end
  end
end
