class EvaluationFactorsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_evaluation_factor, only: [:show, :edit, :update, :destroy]

  # GET /evaluation_factors
  # GET /evaluation_factors.json
  def index
    @evaluation_factors = EvaluationFactor.all
  end

  def select
    unless params[:evaluation_model][:id].blank?
      @evaluation_factors = EvaluationModel.find(params[:evaluation_model][:id]).evaluation_factors
    else
      @evaluation_factors = []
    end
  end

  # GET /evaluation_factors/1
  # GET /evaluation_factors/1.json
  def show
  end

  # GET /evaluation_factors/new
  def new
    @evaluation_factor = EvaluationFactor.new
  end

  # GET /evaluation_factors/1/edit
  def edit
  end

  # POST /evaluation_factors
  # POST /evaluation_factors.json
  def create
    @evaluation_factor = EvaluationFactor.new(evaluation_factor_params)

    respond_to do |format|
      if @evaluation_factor.save
        format.html { redirect_to @evaluation_factor, notice: 'Evaluation factor was successfully created.' }
        format.json { render :show, status: :created, location: @evaluation_factor }
      else
        format.html { render :new }
        format.json { render json: @evaluation_factor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evaluation_factors/1
  # PATCH/PUT /evaluation_factors/1.json
  def update
    respond_to do |format|
      if @evaluation_factor.update(evaluation_factor_params)
        format.html { redirect_to @evaluation_factor, notice: 'Evaluation factor was successfully updated.' }
        format.json { render :show, status: :ok, location: @evaluation_factor }
      else
        format.html { render :edit }
        format.json { render json: @evaluation_factor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluation_factors/1
  # DELETE /evaluation_factors/1.json
  def destroy
    @evaluation_factor.destroy
    respond_to do |format|
      format.html { redirect_to evaluation_factors_url, notice: 'Evaluation factor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluation_factor
      @evaluation_factor = EvaluationFactor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evaluation_factor_params
      params.require(:evaluation_factor).permit(:name, evaluation_factors_questions_attributes: [:id, :question_id, :_destroy])
    end
end
