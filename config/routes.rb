# == Route Map
#
#               Prefix Verb   URI Pattern                     Controller#Action
#                 root GET    /                               main#index
#     new_user_session GET    /admin/sign_in(.:format)        devise/sessions#new
#         user_session POST   /admin/sign_in(.:format)        devise/sessions#create
# destroy_user_session DELETE /admin/sign_out(.:format)       devise/sessions#destroy
#          admin_users GET    /admin/users(.:format)          admin/users#index
#                      POST   /admin/users(.:format)          admin/users#create
#       new_admin_user GET    /admin/users/new(.:format)      admin/users#new
#      edit_admin_user GET    /admin/users/:id/edit(.:format) admin/users#edit
#           admin_user GET    /admin/users/:id(.:format)      admin/users#show
#                      PATCH  /admin/users/:id(.:format)      admin/users#update
#                      PUT    /admin/users/:id(.:format)      admin/users#update
#                      DELETE /admin/users/:id(.:format)      admin/users#destroy
#           admin_root GET    /admin(.:format)                admin/users#index
#

Rails.application.routes.draw do
  root 'main#index'

  devise_for :users, path: :admin

  namespace :admin do
    resources :users

    root to: "users#index"
  end
end
