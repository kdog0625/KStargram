class TweetsController < ApplicationController
  
  def index
    @tweets = Tweet.all.order(created_at: :desc).page(params[:page]).per(20)
    @tweet=Tweet.new
    # tweet_like_count = Tweet.joins(:likes).group(:tweet_id).count
    # tweet_liked_ids = Hash[tweet_like_count.sort_by{ |_, v| -v }].keys
    # @tweet_ranking= Tweet.where(id: tweet_liked_ids).limit(5)
  end
  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  
  def new
    @tweet = Tweet.new
  end
  def create
    @tweet = Tweet.create(tweet_params)
  end
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end
  def edit
    @tweet = Tweet.find(params[:id]) 
  end
  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
  end
 
  def show
    @tweet = Tweet.find(params[:id]) 
    # @like = Like.new
    # @comment = Comment.new
    # @comments = @tweet.comments.includes(:user)
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
