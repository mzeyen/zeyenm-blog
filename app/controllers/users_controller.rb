class UsersController < ApplicationController
  
  
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]
  
  # GET /users/new
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Willkommen #{@user.username} bei zeyenm.de"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end
  
  def edit 

  end

  def update
    if @user.update(user_params)
      flash[:success] = "Daten für #{@user.username} erfolgreich geändert"
      redirect_to articles_path
    else
      render 'edit'
    end
  end
  
  def show 
        @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = "User und alle seine Artikel wurden gelöscht!"
    redirect_to users_path
  
  end

  
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end
  
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :admin)
    end
    
    def set_user
      @user = User.find(params[:id])
    end
    
    def require_same_user
      if current_user != @user and !current_user.admin?
        flash[:danger] = "Sie können nur ihren eigenes Profil bearbeiten!"
        redirect_to root_path
      end
    end
    
    def require_admin
      if logged_in? and !current_user.admin?
        flash[:danger] = "Nur Administratoren dürfen diese Aktion ausführen!"
        redirect_to root_path
      end
    end
end
