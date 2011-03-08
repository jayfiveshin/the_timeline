class UsersController < ApplicationController
  before_filter :authenticate,  :except => [:show, :new, :create]
  before_filter :correct_user,  :only => [:edit, :update]
  before_filter :admin_user,    :only => :destroy

  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page])
  end #of index
    
  def show
    @user       = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page])
    @title      = @user.name
  end #of show
  
  def new
    redirect_to(root_path) if signed_in?
    @user = User.new
    @title = "Sign up"
  end #of new
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Timeline!"
      redirect_to @user
    else
      @user.password = nil
      @user.password_confirmation = nil
      @title = "Sign up"
      render 'new'
    end
  end #of create
  
  def edit
    @title = "Edit user"
  end #of edit
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end #of update
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy unless @user.admin?
    flash[:success] = "User destroyed."
    redirect_to users_path
  end #of destroy
  
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(:page => params[:page])
    render 'show_follow'
  end #of following
  
  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(:page => params[:page])
    render 'show_follow'
  end #of followers
  
  private
  
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end #of correct_user
    
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end #of admin_user
end
