class EvaluationModelsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_evaluation_model, only: [:show, :edit, :update, :destroy]

  # GET /evaluation_models
  # GET /evaluation_models.json
  def index
    @evaluation_models = EvaluationModel.all
  end

  # GET /evaluation_models/1
  # GET /evaluation_models/1.json
  def show
  end

  # GET /evaluation_models/new
  def new
    @evaluation_model = EvaluationModel.new 
  end

  # GET /evaluation_models/1/edit
  def edit
  end

  # POST /evaluation_models
  # POST /evaluation_models.json
  def create
    @evaluation_model = EvaluationModel.new(evaluation_model_params)

    respond_to do |format|
      if @evaluation_model.save
        format.html { redirect_to @evaluation_model, notice: 'Evaluation model was successfully created.' }
        format.json { render :show, status: :created, location: @evaluation_model }
      else
        format.html { render :new }
        format.json { render json: @evaluation_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evaluation_models/1
  # PATCH/PUT /evaluation_models/1.json
  def update
    respond_to do |format|
      if @evaluation_model.update(evaluation_model_params)
        format.html { redirect_to @evaluation_model, notice: 'Evaluation model was successfully updated.' }
        format.json { render :show, status: :ok, location: @evaluation_model }
      else
        format.html { render :edit }
        format.json { render json: @evaluation_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluation_models/1
  # DELETE /evaluation_models/1.json
  def destroy
    @evaluation_model.destroy
    respond_to do |format|
      format.html { redirect_to evaluation_models_url, notice: 'Evaluation model was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluation_model
      @evaluation_model = EvaluationModel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evaluation_model_params
      params.require(:evaluation_model).permit(:name, :role_id, :evaluation_factor_ids => [])
    end
end
