# require "aws-sdk-cognitoidentityprovider"
require "rest-client"
class AuthController < ApplicationController
  def callback
    # Cognitoから渡された認証コードを取得
    code = params[:code]

    # 認証コードを使ってアクセストークンを取得する処理
    # ここで Cognito の /oauth2/token API を呼び出してアクセストークンを取得します
    token_response = get_cognito_token(code)

    # アクセストークンを使ってユーザー情報を取得
    user_info = get_user_info(token_response["access_token"])

    # ユーザー情報に基づいてユーザーを作成またはログイン
    Rails.logger.debug("User Info:#{user_info}")
    @current_user = Profiel.find_or_create_by(user_id: user_info["sub"]) do |p|
      p.name = user_info["username"]
    end

    # セッションにユーザーIDを保存
    session[:user_id] = @current_user.user_id
    Rails.logger.debug("session :user_id: #{session[:user_id]}")
    @current_user_name = @current_user.name

    # ログイン後のリダイレクト
    redirect_to root_path, notice: "ログインしました。"
  end

  private

  def get_cognito_token(code)
    # Cognito の /oauth2/token に対して POST リクエストを送信してトークンを取得する
    response = RestClient.post("#{ENV["COGNITO_DOMAIN"]}/oauth2/token", {
      client_id: ENV["COGNITO_CLIENT_ID"],
      client_secret: ENV["COGNITO_CLIENT_SECRET"],
      grant_type: "authorization_code",
      code: code,
      redirect_uri: cognito_redirect_uri
    })

    JSON.parse(response.body)
  end

  def get_user_info(access_token)
    # アクセストークンを使って Cognito からユーザー情報を取得する処理
    response = RestClient.get("#{ENV["COGNITO_DOMAIN"]}/oauth2/userinfo", {
      Authorization: "Bearer #{access_token}"
    })

    JSON.parse(response.body)
  end

  def cognito_redirect_uri
    # 認証後にリダイレクトされる URL
    "#{root_url}auth/callback"
  end


  #   def sign_up
  #     # AWS SDKを使用してCognitoにリクエストを送信
  #     client = Aws::CognitoIdentityProvider::Client.new(region: ENV["AWS_REGION"])

  #     begin
  #       # ユーザー登録リクエスト
  #       resp = client.sign_up({
  #         client_id: ENV["COGNITO_CLIENT_ID"],
  #         username: params[:username],
  #         password: params[:password],
  #         user_attributes: [
  #           { name: "email", value: params[:email] }
  #         ]
  #       })

  #       # 成功時のレスポンス
  #       render json: { message: "User successfully registered. Please check your email to confirm." }, status: :ok
  #     rescue Aws::CognitoIdentityProvider::Errors::ServiceError => e
  #       # エラー時のレスポンス
  #       render json: { error: e.message }, status: :unprocessable_entity
  #     end
  #   end

  #   def login
  #     client = Aws::CognitoIdentityProvider::Client.new

  #     begin
  #       resp = client.initiate_auth({
  #         client_id: Env["COGNITO_CLIENT_ID"], # アプリクライアントID
  #         auth_flow: "USER_PASSWORD_AUTH",
  #         auth_parameters: {
  #           "USERNAME" => params[:username],
  #           "PASSWORD" => params[:password]
  #         }
  #       })

  #       render json: {
  #         access_token: resp.authentication_result.access_token,
  #         id_token: resp.authentication_result.id_token,
  #         refresh_token: resp.authentication_result.refresh_token
  #       }
  #     rescue Aws::CognitoIdentityProvider::Errors::ServiceError => e
  #       render json: { error: e.message }, status: :unauthorized
  #     end
  #   end
end
