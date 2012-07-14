module Providers
  class Github
    def initialize(user = nil)
      @user = user
    end

    def client
      OAuth2::Client.new(Rails.configuration.github.token, Rails.configuration.github.secret, {
        :site => 'https://github.com/',
        :authorize_url => '/login/oauth/authorize',
        :token_url => '/login/oauth/access_token'
      })
    end

    def redirect_uri(request)
      port = request.port.to_i
      "#{request.scheme}://#{(port == 80 || port == 443) ? request.host : request.host_with_port }/oauth/github/callback"
    end

    def authorize_uri(request)
      client.auth_code.authorize_url(:redirect_uri => redirect_uri(request))
    end

    def find_or_create_user(code, request)
      token = client.auth_code.get_token(code, :redirect_uri => redirect_uri(request))
      User.find_by_access_token(token.token) || create_user(token)
    end

    def create_user(token)
      token.client.site = 'https://api.github.com'
      github_user = token.get('/user').parsed
      user = User.new({
        :username     => github_user['login'],
        :avatar_url   => github_user['avatar_url']
      })
      user.access_token = token.token
      user.provider     = 'github'
      user.save
      user
    end
  end
end
