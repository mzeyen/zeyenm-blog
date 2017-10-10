class UsersController < ApplicationController
  
  # GET /users/new
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Willkommen #{@user.username} bei zeyenm.de"
      redirect_to articles_path
    else
      render 'new'
    end
  end
  
  def edit 
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Daten für #{@user.username} erfolgreich geändert"
      redirect_to articles_path
    else
      render 'edit'
    end
  end
  
  def show 
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.all
  end
  
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end
