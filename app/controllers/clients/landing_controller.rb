class Clients::LandingController < Clients::BaseController
  before_action :authenticate_client!, except: :list

  def index

  end

  def list
    @list = [
      {
        id: 1,
        title: 'First task'
      },
      {
        id: 2,
        title: 'Second task'
      }
    ]
  end
end
