class UsersController < ApplicationController
  before_filter :signed_in_user, :only => [:edit, :update, :index]
  before_filter :correct_user,   :only => [:edit, :update]

  def index
    @users = User.paginate(:page => params[:page])
  end
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to the twitter clone!!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] ="Profile updated!"
      sign_in(user)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def signed_in_user
    redirect_to signin_url, :notice => "Please sign in" unless signed_in?
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_url unless current_user?(@user)
  end

end
