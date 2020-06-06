class Users::SessionsController < Devise::SessionsController
  def new_guest
    user = User.find(1)
    user.update(usernoid:'@gurst_user',email: 'guest@example.com',name: 'ゲストユーザー',age:20,sex:'MEN',tall:170,profile:'初めましてゲストユーザーです。主に最新のメンズファッションを投稿していくので良かったらいいね、コメント待っています。') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end