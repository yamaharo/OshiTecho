require "jwt"
require "net/http"
class ApplicationController < ActionController::Base
  def authenticate_request!
    token = request.headers["Authorization"]&.split(" ")&.last
    decoded_token = decode_jwt(token)

    if decoded_token
      @current_user = decoded_token["username"]
    else
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end

  private

  def decode_jwt(token)
    jwks_url = "https://cognito-idp.ap-northeast-1.amazonaws.com/ap-northeast-1_bH1AFOp4L/.well-known/jwks.json"
    jwks_raw = Net::HTTP.get(URI(jwks_url))
    jwks = JSON.parse(jwks_raw)

    JWT.decode(token, nil, true, { jwks: jwks }).first
  rescue JWT::DecodeError
    nil
  end
end

# class ApplicationController < ActionController::Base
#   # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
#   allow_browser versions: :modern
# end
