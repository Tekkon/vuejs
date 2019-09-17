class ApiTokenService
  def self.call
    #ENV['HTTP_AUTHORIZATION'].to_s.remove('Bearer ')

    header = request.headers['HTTP_AUTHORIZATION']

    if header
      header.to_s.remove('Bearer ')
    end
  end
end
