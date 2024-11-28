require "jwt"
require "net/http"
class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :auth_callback_action?
  helper_method :current_user

  private

  def authenticate_user!
    # ユーザーが認証されていない場合、Cognito の認証画面にリダイレクト
    Rails.logger.debug("current_user: #{current_user}")
    unless current_user
      redirect_url = "#{ENV["COGNITO_DOMAIN"]}/oauth2/authorize?response_type=code&client_id=#{ENV["COGNITO_CLIENT_ID"]}&redirect_uri=#{cognito_redirect_uri}&language=ja"
      Rails.logger.debug("Redirecting to Cognito: #{redirect_url}")
      redirect_to redirect_url, allow_other_host: true
    end
  end

  def cognito_redirect_uri
    # リダイレクト先のURL（Railsのエンドポイント）
    "#{root_url}auth/callback"
  end

  def current_user
    @current_user ||= Profiel.find_by(user_id: session[:user_id].to_s) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def auth_callback_action?
    # `auth/callback` アクションの場合は認証をスキップ
    controller_name == "auth" && action_name == "callback"
  end
end

# class ApplicationController < ActionController::Base
#   # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
#   allow_browser versions: :modern
# end
