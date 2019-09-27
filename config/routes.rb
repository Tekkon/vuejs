Rails.application.routes.draw do
  devise_for :staffs, :controllers => { sessions: 'staffs/sessions' }, skip: [:registrations]
  devise_for :clients, :controllers => { sessions: 'clients/sessions' }, skip: [:registrations]

  scope :staffs do
    root to: 'staffs/landing#index', as: :staffs_root

    get 'current', to: 'staffs/staffs#current', as: :staffs_current

    resources :clients, controller: 'staffs/clients', only: %i[index create destroy]

    resources :organizations, controller: 'staffs/organizations', only: %i[index create destroy]

    resources :organization_types, controller: 'staffs/organization_types', only: %i[index]

    get '/*slug', to: 'staffs/landing#index'
  end

  scope :clients do
    root to: 'clients/landing#index', as: :clients_root

    get 'current', to: 'clients/clients#current', as: :clients_current

    get '/*slug', to: 'clients/landing#index'
  end
end
