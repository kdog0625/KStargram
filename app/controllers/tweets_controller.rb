class TweetsController < ApplicationController
  
  def index
    @tweets = Tweet.all.order(created_at: :desc).page(params[:page]).per(20)
    @tweet=Tweet.new
    tweet_like_count = Tweet.joins(:likes).group(:tweet_id).count
    tweet_liked_ids = Hash[tweet_like_count.sort_by{ |_, v| -v }].keys
    @tweet_ranking= Tweet.where(id: tweet_liked_ids).limit(3)
  end
  
  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.destroy 
      redirect_to root_path
    else
      render :show
    end
  end

  def edit
    @tweet = Tweet.find(params[:id]) 
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.update(tweet_params)
      redirect_to root_path
    else
      render :edit
    end
  end
 
  def show
    @tweet = Tweet.find(params[:id]) 
    @like = Like.new
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end
  
  def search
    @tweets = Tweet.search(params[:keyword]).order(created_at: :desc).page(params[:page]).per(20)
    @tweet=Tweet.new
    tweet_like_count = Tweet.joins(:likes).group(:tweet_id).count
    tweet_liked_ids = Hash[tweet_like_count.sort_by{ |_, v| -v }].keys
    @tweet_ranking= Tweet.where(id: tweet_liked_ids).limit(5)
  end
  

  private
  def tweet_params
    params.require(:tweet).permit(:name,:image,:title,:season,:text,:sex,:tall,:temp,:typestyle).merge(user_id: current_user.id)
  end

  
end
