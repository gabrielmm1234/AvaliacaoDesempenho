class Answer < ActiveRecord::Base

  belongs_to :evaluation
  belongs_to :question
  belongs_to :answer_option

end
