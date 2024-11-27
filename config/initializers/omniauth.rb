Rails.application.config.middleware.use OmniAuth::Builder do
  provider :cognito,
           ENV["COGNITO_CLIENT_ID"],           # ユーザープールのアプリクライアントID
           ENV["COGNITO_CLIENT_SECRET"],       # ユーザープールのアプリクライアントシークレット
           client_options: {
             site: "https://ap-northeast-1bh1afop4l.auth.ap-northeast-1.amazoncognito.com",
             authorize_url: "/oauth2/authorize",
             token_url: "/oauth2/token"
           },
           scope: "openid profile email"      # 必要なスコープ
end

OmniAuth.config.path_prefix = "/auth"
