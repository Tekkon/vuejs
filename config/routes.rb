Rails.application.routes.draw do
  devise_for :staffs, controllers: { sessions: "staffs/sessions" }
  devise_for :clients, controllers: { sessions: "clients/sessions" }

  root to: 'landing#index'
end
