class ClientApiTokenStrategy < Warden::Strategies::Base
  def valid?
    api_token.present?
  end

  def authenticate!
    client = Client.find_by(api_token: api_token)

    if client
      success!(client)
    else
      fail!('Invalid email or password')
    end
  end

  private

  def api_token
    ApiTokenService.call
  end
end
