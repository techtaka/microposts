class UsersController < ApplicationController
  #以下2つの before_action の順序は重要！
  before_action :set_user, only: [:show, :edit, :update, :followings, :followers]
  before_action :authorize!, only: [edit, :update]

  def show
    @microposts = @user.microposts.order(created_at: :desc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        flash[:success] = "Welcome to the Sample App!"
        redirect_to @user
      else
        render 'new'
      end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "The contents were renewed."
      redirect_to @user
    else
      render 'edit'
    end  
  end

  def followings
    @users = @user.following_users.page(params[:page])
  end

  def followers
    @users = @user.follower_users.page(params[:page])
  end

  def index
    @users = User.all.page(params[:page]).per(5)
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :area,
                                :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def authorize!   # リダイレクトする副作用があるのでそれを強調する意味で "!" を名前に含めています。
    if @user != current_user
      redirect_to root_url, alert: "不正なアクセスです"  # メッセージも出してあげる。（短縮形です）
    end
  end

end