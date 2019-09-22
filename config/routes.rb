Rails.application.routes.draw do
  devise_for :staffs, :controllers => { :sessions => "staffs/sessions" }, skip: [:registrations]
  devise_for :clients, :controllers => { :sessions => "clients/sessions" }, skip: [:registrations]

  scope :staffs do
    root to: 'staffs/landing#index', as: :staffs_root
    get 'current', to: 'staffs/staffs#current', as: :staffs_current
    get 'clients', to: 'staffs/clients#index'
    post 'clients', to: 'staffs/clients#create'

    get 'organizations', to: 'staffs/organizations#index'
    post 'organizations', to: 'staffs/organizations#create'
    delete 'organizations/:id', to: 'staffs/organizations#destroy'

    get 'organization_types', to: 'staffs/organization_types#index'
  end

  scope :clients do
    root to: 'clients/landing#index', as: :clients_root
    get 'current', to: 'clients/clients#current', as: :clients_current
  end
end
