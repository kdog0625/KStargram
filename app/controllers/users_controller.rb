class UsersController < ApplicationController
  def index
    @users=User.all.order(created_at: :desc).page(params[:page]).per(20)
  end
  def new
    @user = User.new
  end
  def show
    @user = User.find(params[:id])
    # @tweets=@user.tweets
  end
  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:usernoid, :email,:sex,:image)
  end
end
