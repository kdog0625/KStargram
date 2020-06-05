class UsersController < ApplicationController
  def index
    @users=User.all.order(created_at: :desc).page(params[:page]).per(20)
  end
  def new
    @user = User.new
  end
  def created
  end
  def show
    @user = User.find(params[:id])
    @tweets=@user.tweets
  end
  def profile
    @user = User.find(params[:id])
    @tweets=@user.tweets
  end
 

  def search
    @user = User.search(params[:keyword]).order(created_at: :desc).page(params[:page]).per(20)
  end
  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

  
end
