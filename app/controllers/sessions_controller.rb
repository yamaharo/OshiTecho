class SessionsController < ApplicationController
  def new
    # ログインしているかどうかをチェック
    if user_logged_in? == true
      redirect_to root_path  # ログインしていたら、ホーム画面へ
    else
      redirect_to "/auth/cognito"  # まだログインしていなければ、Cognitoへ
    end
  end

  def create
    # 認証が成功した後にCognitoから返されるユーザー情報を取得
    user_info = request.env["omniauth.auth"]

    # ここでユーザー情報をセッションに保存する
    session[:user_id] = user_info["uid"]
    session[:user_email] = user_info["info"]["email"]

    redirect_to root_path, notice: "認証に成功しました" # 認証後にトップページにリダイレクト
  end

  def failure
    # 認証失敗時の処理
    redirect_to root_path, alert: "認証に失敗しました"
  end

  private

  def user_logged_in?
    # セッションなどを使って、ユーザーがログインしているかどうかを判断
    session[:user_id].present?
  end
end
