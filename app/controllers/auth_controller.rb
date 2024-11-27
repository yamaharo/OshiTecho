require "aws-sdk-cognitoidentityprovider"
class AuthController < ApplicationController
  def sign_up
    # AWS SDKを使用してCognitoにリクエストを送信
    client = Aws::CognitoIdentityProvider::Client.new(region: ENV["AWS_REGION"])

    begin
      # ユーザー登録リクエスト
      resp = client.sign_up({
        client_id: ENV["COGNITO_CLIENT_ID"],
        username: params[:username],
        password: params[:password],
        user_attributes: [
          { name: "email", value: params[:email] }
        ]
      })

      # 成功時のレスポンス
      render json: { message: "User successfully registered. Please check your email to confirm." }, status: :ok
    rescue Aws::CognitoIdentityProvider::Errors::ServiceError => e
      # エラー時のレスポンス
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end

  def login
    client = Aws::CognitoIdentityProvider::Client.new

    begin
      resp = client.initiate_auth({
        client_id: Env["COGNITO_CLIENT_ID"], # アプリクライアントID
        auth_flow: "USER_PASSWORD_AUTH",
        auth_parameters: {
          "USERNAME" => params[:username],
          "PASSWORD" => params[:password]
        }
      })

      render json: {
        access_token: resp.authentication_result.access_token,
        id_token: resp.authentication_result.id_token,
        refresh_token: resp.authentication_result.refresh_token
      }
    rescue Aws::CognitoIdentityProvider::Errors::ServiceError => e
      render json: { error: e.message }, status: :unauthorized
    end
  end
end
