class AnswerOptionQuestion < ActiveRecord::Base

  belongs_to :answer_option
  belongs_to :question
  
end
