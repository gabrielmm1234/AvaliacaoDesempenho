class EvaluationsController < ApplicationController
  respond_to :html, :js
  before_action :set_evaluation, only: [:salvar,:responder,:show,:edit,:update,:destroy]
  load_and_authorize_resource :only => [:index, :show, :new, :edit, :create, :update, :destroy]

  # GET /evaluations
  # GET /evaluations.json
  def index
    @evaluations = Evaluation.accessible_by(current_ability, :read)
  end

  # GET /evaluations/1
  # GET /evaluations/1.json
  def show
  end

  def responder
    respond_to do |format|
      if @evaluation.locked
        format.html { redirect_to avaliar_path, notice: 'O tempo para responder expirou.' }
      else
        format.html
      end
    end
  end

  def salvar
    evaluation = Evaluation.find(params[:id])

    params[:answer].each do |question, option|
      answer = Answer.find_or_initialize_by(question_id: question, evaluation_id: params[:id])
      answer.update_attributes(
        evaluation_id: evaluation.id,
        question_id: question,
        answer_option_id: option
      )
    end

=begin
    if answers.nil? do
      params[:answer].each do |question, option|
        Answer.create(evaluation_id: evaluation.id, question_id: question, answer__option_id: option)
      end
    else
      params[:answer].each do |question, option|
        answer = Answer.find_by(question_id: question)
        answer.update(option_id: option)
      end
    end
=end
    evaluation.update_attribute(:done, true)
  end

  def evaluation
    @evaluations = current_user.avaliacoes_aplicadas
  end

  # GET /evaluations/new
  def new
    @evaluation = Evaluation.new
  end

  # GET /evaluations/1/edit
  def edit
  end

  # POST /evaluations
  # POST /evaluations.json
  def create
    @evaluation = Evaluation.new(evaluation_params)

    respond_to do |format|
      if @evaluation.save
        format.html { redirect_to @evaluation, notice: 'Avaliação criada.' }
        format.json { render :show, status: :created, location: @evaluation }
      else
        format.html { render :new }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evaluations/1
  # PATCH/PUT /evaluations/1.json
  def update
    respond_to do |format|
      if @evaluation.update(evaluation_params)
        format.html { redirect_to @evaluation, notice: 'Avaliação atualizada.' }
        format.json { render :show, status: :ok, location: @evaluation }
      else
        format.html { render :edit }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluations/1
  # DELETE /evaluations/1.json
  def destroy
    @evaluation.destroy
    respond_to do |format|
      format.html { redirect_to evaluations_url, notice: 'Avaliação deletada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluation
      @evaluation = Evaluation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evaluation_params
      params.require(:evaluation).permit(:usuario_avaliado_id, :usuario_avaliador_id, :date, :done, :evaluation_model_id)
    end
end
