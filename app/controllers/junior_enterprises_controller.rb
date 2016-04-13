class JuniorEnterprisesController < ApplicationController
  before_action :set_junior_enterprise, only: [:show, :edit, :update, :destroy]

  # GET /junior_enterprises
  # GET /junior_enterprises.json
  def index
    @junior_enterprises = JuniorEnterprise.all
  end

  # GET /junior_enterprises/1
  # GET /junior_enterprises/1.json
  def show
  end

  # GET /junior_enterprises/new
  def new
    @junior_enterprise = JuniorEnterprise.new
  end

  # GET /junior_enterprises/1/edit
  def edit
  end

  # POST /junior_enterprises
  # POST /junior_enterprises.json
  def create
    @junior_enterprise = JuniorEnterprise.new(junior_enterprise_params)

    respond_to do |format|
      if @junior_enterprise.save
        format.html { redirect_to @junior_enterprise, notice: 'Junior enterprise was successfully created.' }
        format.json { render :show, status: :created, location: @junior_enterprise }
      else
        format.html { render :new }
        format.json { render json: @junior_enterprise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /junior_enterprises/1
  # PATCH/PUT /junior_enterprises/1.json
  def update
    respond_to do |format|
      if @junior_enterprise.update(junior_enterprise_params)
        format.html { redirect_to @junior_enterprise, notice: 'Junior enterprise was successfully updated.' }
        format.json { render :show, status: :ok, location: @junior_enterprise }
      else
        format.html { render :edit }
        format.json { render json: @junior_enterprise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /junior_enterprises/1
  # DELETE /junior_enterprises/1.json
  def destroy
    @junior_enterprise.destroy
    respond_to do |format|
      format.html { redirect_to junior_enterprises_url, notice: 'Junior enterprise was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_junior_enterprise
      @junior_enterprise = JuniorEnterprise.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def junior_enterprise_params
      params.require(:junior_enterprise).permit(:name)
    end
end
