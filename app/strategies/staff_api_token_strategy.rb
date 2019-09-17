class StaffApiTokenStrategy < Warden::Strategies::Base
  def valid?
    api_token.present?
  end

  def authenticate!
    staff = Staff.find_by(api_token: api_token)

    if staff
      success!(staff)
    else
      fail!('Invalid email or password')
    end
  end

  private

  def api_token
    ApiTokenService.call
  end
end
