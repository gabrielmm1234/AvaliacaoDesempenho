class RequestHistoriesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_request_history, only: [:show, :edit, :update, :destroy,
                                             :aprovar_requisicao]

  # GET /request_histories
  # GET /request_histories.json
  def index
    @request_histories = RequestHistory.all
  end

  # GET /request_histories/1
  # GET /request_histories/1.json
  def show
  end

  # GET /request_histories/new
  def new
    @request_history = RequestHistory.new
  end

  # GET /request_histories/1/edit
  def edit
  end

  # POST /request_histories
  # POST /request_histories.json
  def create
    @request_history = RequestHistory.new(request_history_params)

    respond_to do |format|
      if @request_history.save
        format.html { redirect_to @request_history, notice: 'Request history was successfully created.' }
        format.json { render :show, status: :created, location: @request_history }
      else
        format.html { render :new }
        format.json { render json: @request_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /request_histories/1
  # PATCH/PUT /request_histories/1.json
  def update
    respond_to do |format|
      if @request_history.update(request_history_params)
        format.html { redirect_to @request_history, notice: 'Request history was successfully updated.' }
        format.json { render :show, status: :ok, location: @request_history }
      else
        format.html { render :edit }
        format.json { render json: @request_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_histories/1
  # DELETE /request_histories/1.json
  def destroy
    @request_history.destroy
    respond_to do |format|
      format.html { redirect_to request_histories_url, notice: 'Request history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # POST /request_histories/1/aprovar_requisicao
  def aprovar_requisicao

    random_password = Devise.friendly_token.first 8

    respond_to do |format|

      if @user = User.create(name: @request_history.name, 
                             email: @request_history.email,
                             role_id: @request_history.role_id,
                             junior_enterprise_id: @request_history.junior_enterprise_id,
                             area_id: @request_history.area_id,
                             password: random_password)

        usuario_comum = Profile.find_by(name: 'Usuário Comum').id
        @user.update_attribute(:profile_id, usuario_comum)

        @request_history.update_attribute(:approved, true)

        format.html { redirect_to request_histories_path, notice: 'O cadastro foi aprovado com sucesso!' }
        UserMailer.user_registered(@user, random_password).deliver_now!
      else
        format.html { redirect_to request_histories_path, notice: 'Algo deu errado :c' }
      end

    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_history
      @request_history = RequestHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_history_params
      params.require(:request_history).permit(:name, :email, :profile_id, :junior_enterprise_id, :role_id, :approved, :area_id)
    end
end
