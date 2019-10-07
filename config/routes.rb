Rails.application.routes.draw do
  devise_for :staffs, :controllers => { sessions: 'staffs/sessions' }, skip: [:registrations]
  as :staff do
    get 'staffs/edit_password' => 'staffs/registrations#edit', :as => 'edit_staff_registration'
    patch 'staffs/update_password' => 'staffs/registrations#update', :as => 'update_staff_registration'
  end

  devise_for :clients, :controllers => { sessions: 'clients/sessions' }, skip: [:registrations]
  as :client do
    get 'clients/edit_password' => 'clients/registrations#edit', :as => 'edit_client_registration'
    patch 'clients/update_password' => 'clients/registrations#update', :as => 'update_client_registration'
  end

  scope :staffs do
    root to: 'staffs/landing#index', as: :staffs_root

    get 'current', to: 'staffs/staffs#current', as: :staffs_current

    resources :clients, controller: 'staffs/clients', only: %i[index create update destroy]

    resources :staffs, controller: 'staffs/staffs', only: %i[index create update destroy]

    resources :organizations, controller: 'staffs/organizations', only: %i[index create destroy]

    resources :organization_types, controller: 'staffs/organization_types', only: %i[index]

    resources :client_organizations, controller: 'staffs/client_organizations', only: %i[index create destroy]

    get '/*slug', to: 'staffs/landing#index'
  end

  scope :clients do
    root to: 'clients/landing#index', as: :clients_root

    get 'current', to: 'clients/clients#current', as: :clients_current

    get '/*slug', to: 'clients/landing#index'
  end
end
