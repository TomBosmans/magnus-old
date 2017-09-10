# == Route Map
#
#               Prefix Verb   URI Pattern                        Controller#Action
#             ckeditor        /ckeditor                          Ckeditor::Engine
#                 root GET    /                                  main#index
#     new_user_session GET    /admin/sign_in(.:format)           devise/sessions#new
#         user_session POST   /admin/sign_in(.:format)           devise/sessions#create
# destroy_user_session DELETE /admin/sign_out(.:format)          devise/sessions#destroy
#           admin_root GET    /admin(.:format)                   admin/settings#index
#       admin_settings GET    /admin/settings(.:format)          admin/settings#index
#                      POST   /admin/settings(.:format)          admin/settings#create
#    new_admin_setting GET    /admin/settings/new(.:format)      admin/settings#new
#   edit_admin_setting GET    /admin/settings/:id/edit(.:format) admin/settings#edit
#        admin_setting GET    /admin/settings/:id(.:format)      admin/settings#show
#                      PATCH  /admin/settings/:id(.:format)      admin/settings#update
#                      PUT    /admin/settings/:id(.:format)      admin/settings#update
#                      DELETE /admin/settings/:id(.:format)      admin/settings#destroy
#           admin_maps GET    /admin/maps(.:format)              admin/maps#index
#                      POST   /admin/maps(.:format)              admin/maps#create
#        new_admin_map GET    /admin/maps/new(.:format)          admin/maps#new
#       edit_admin_map GET    /admin/maps/:id/edit(.:format)     admin/maps#edit
#            admin_map GET    /admin/maps/:id(.:format)          admin/maps#show
#                      PATCH  /admin/maps/:id(.:format)          admin/maps#update
#                      PUT    /admin/maps/:id(.:format)          admin/maps#update
#                      DELETE /admin/maps/:id(.:format)          admin/maps#destroy
#          admin_users GET    /admin/users(.:format)             admin/users#index
#                      POST   /admin/users(.:format)             admin/users#create
#       new_admin_user GET    /admin/users/new(.:format)         admin/users#new
#      edit_admin_user GET    /admin/users/:id/edit(.:format)    admin/users#edit
#           admin_user GET    /admin/users/:id(.:format)         admin/users#show
#                      PATCH  /admin/users/:id(.:format)         admin/users#update
#                      PUT    /admin/users/:id(.:format)         admin/users#update
#                      DELETE /admin/users/:id(.:format)         admin/users#destroy
#   sort_admin_dummies PUT    /admin/dummies/sort(.:format)      admin/dummies#sort
#        admin_dummies GET    /admin/dummies(.:format)           admin/dummies#index
#                      POST   /admin/dummies(.:format)           admin/dummies#create
#      new_admin_dummy GET    /admin/dummies/new(.:format)       admin/dummies#new
#     edit_admin_dummy GET    /admin/dummies/:id/edit(.:format)  admin/dummies#edit
#          admin_dummy GET    /admin/dummies/:id(.:format)       admin/dummies#show
#                      PATCH  /admin/dummies/:id(.:format)       admin/dummies#update
#                      PUT    /admin/dummies/:id(.:format)       admin/dummies#update
#                      DELETE /admin/dummies/:id(.:format)       admin/dummies#destroy
#
# Routes for Ckeditor::Engine:
#         pictures GET    /pictures(.:format)             ckeditor/pictures#index
#                  POST   /pictures(.:format)             ckeditor/pictures#create
#          picture DELETE /pictures/:id(.:format)         ckeditor/pictures#destroy
# attachment_files GET    /attachment_files(.:format)     ckeditor/attachment_files#index
#                  POST   /attachment_files(.:format)     ckeditor/attachment_files#create
#  attachment_file DELETE /attachment_files/:id(.:format) ckeditor/attachment_files#destroy
#

Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'main#index'

  devise_for :users, path: :admin

  namespace :admin do
    root to: 'settings#index'

    resources :settings
    resources :maps
    resources :addresses
    resources :users
    resources :dummies do
      put :sort, on: :collection
    end
  end
end
