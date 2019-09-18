class ApiTokenService
  def self.call
    ENV['HTTP_AUTHORIZATION'].to_s.remove('Bearer ')
  end
end
