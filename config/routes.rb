# == Route Map
#
#               Prefix Verb   URI Pattern                        Controller#Action
#                 root GET    /                                  main#index
#     new_user_session GET    /admin/sign_in(.:format)           devise/sessions#new
#         user_session POST   /admin/sign_in(.:format)           devise/sessions#create
# destroy_user_session DELETE /admin/sign_out(.:format)          devise/sessions#destroy
#       admin_settings GET    /admin/settings(.:format)          admin/settings#index
#                      POST   /admin/settings(.:format)          admin/settings#create
#    new_admin_setting GET    /admin/settings/new(.:format)      admin/settings#new
#   edit_admin_setting GET    /admin/settings/:id/edit(.:format) admin/settings#edit
#        admin_setting GET    /admin/settings/:id(.:format)      admin/settings#show
#                      PATCH  /admin/settings/:id(.:format)      admin/settings#update
#                      PUT    /admin/settings/:id(.:format)      admin/settings#update
#                      DELETE /admin/settings/:id(.:format)      admin/settings#destroy
#          admin_users GET    /admin/users(.:format)             admin/users#index
#                      POST   /admin/users(.:format)             admin/users#create
#       new_admin_user GET    /admin/users/new(.:format)         admin/users#new
#      edit_admin_user GET    /admin/users/:id/edit(.:format)    admin/users#edit
#           admin_user GET    /admin/users/:id(.:format)         admin/users#show
#                      PATCH  /admin/users/:id(.:format)         admin/users#update
#                      PUT    /admin/users/:id(.:format)         admin/users#update
#                      DELETE /admin/users/:id(.:format)         admin/users#destroy
#           admin_root GET    /admin(.:format)                   admin/users#index
#

Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'main#index'

  devise_for :users, path: :admin

  namespace :admin do
    root to: 'settings#index'

    resources :settings
    resources :users
    resources :dummies do
      put :sort, on: :collection
    end
  end
end
