Rails.application.routes.draw do
  devise_for :staffs, :controllers => { :sessions => "staffs/sessions" }, skip: [:registrations]
  devise_for :clients, :controllers => { :sessions => "clients/sessions" }, skip: [:registrations]

  scope :staffs do
    root to: 'staffs/landing#index', as: :staffs_root
  end

  scope :clients do
    root to: 'clients/landing#index', as: :clients_root
  end
end
