class ResultsController < ApplicationController

    def index
      @users = User.all
    end

    def show
      @user = User.find(params[:id])

      @all_evaluation = @user.avaliacoes_aplicadas
      @auto_evaluation = @user.auto_evaluation
      @others_evaluation = @user.others_evaluation

      # auto avaliacao
      @evaluation_questions = Array.new
      @auto_evaluation.evaluation_model.evaluation_factors.each do |f|
        @evaluation_questions.push(f.questions)
      end

      @auto_evaluation_answers = @auto_evaluation.answers
      @auto_eval_ans_hash = Hash.new
      @auto_evaluation_answers.each do |aea|
        @auto_eval_ans_hash[aea.question.id] = aea
      end

      # avaliacao por outra pessoa
      @others_evaluation_questions = Array.new
      @others_evaluation.each do |oe|
        oe.evaluation_model.evaluation_factors.each do |f|
          @others_evaluation_questions.push(f.questions)
        end
      end

      @others_evaluation_answers = Array.new
      @others_evaluation.each do |oe|
         @others_evaluation_answers.push(oe.answers)
      end

      @others_eval_ans_hash = Hash.new(0)
      contador = Hash.new(0)
      @others_evaluation_answers.each_with_index do |aea,i|
        aea.each_with_index do |a,j|
          @others_eval_ans_hash[a.question.id] += @others_evaluation_answers[i][j].answer_option_id
          contador[a.question.id] += 1
        end
      end

      @others_eval_ans_hash.each do |key, value|
        value = value/contador[key]
      end

    end

end
