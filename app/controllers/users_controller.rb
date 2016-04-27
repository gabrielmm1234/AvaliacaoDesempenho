class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: :create

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to users_path, notice:'Usuário atualizado.' }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @user.destroy
        format.html { redirect_to users_path, notice:'Usuário excluído.' }
      end
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name, :profile_id, :area_id)
    end

end