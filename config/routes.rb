Rails.application.routes.draw do
  namespace 'admin'do
    devise_for :staffs, controllers: { sessions: "staffs/sessions" }
  end

  namespace 'clients' do
    devise_for :clients, controllers: { sessions: "clients/sessions" }
  end

  root to: 'landing#index'
end
