Rails.application.routes.draw do
  # devise_for :staffs, path: 'staffs', controllers: { sessions: "staffs/sessions" }
  # devise_for :clients, path: 'clients', controllers: { sessions: "clients/sessions" }

  scope :staffs do
    get 'sign_in', to: 'staffs/sessions#new'
    delete 'sign_out', to: 'staffs/sessions#destroy'
    root to: 'staffs/landing#index'
  end

  scope :clients do
    get 'sign_in', to: 'clients/sessions#new'
    delete 'sign_out', to: 'clients/sessions#destroy'
    root to: 'clients/landing#index'
  end
end
