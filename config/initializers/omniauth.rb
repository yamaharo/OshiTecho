Rails.application.config.middleware.use OmniAuth::Builder do
  provider :cognito,
           ENV["COGNITO_CLIENT_ID"],           # ユーザープールのアプリクライアントID
           ENV["COGNITO_CLIENT_SECRET"],       # ユーザープールのアプリクライアントシークレット
           client_options: {
             site: "https://cognito-idp.#{ENV["AWS_REGION"]}.amazonaws.com",
             authorize_url: "#{ENV["COGNITO_DOMAIN"]}/oauth2/authorize",
             token_url: "#{ENV["COGNITO_DOMAIN"]}/oauth2/token"
           },
           scope: "openid profile email"      # 必要なスコープ
end
