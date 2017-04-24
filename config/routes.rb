# == Route Map
#
#               Prefix Verb   URI Pattern               Controller#Action
#                 root GET    /                         main#index
#     new_user_session GET    /users/sign_in(.:format)  devise/sessions#new
#         user_session POST   /users/sign_in(.:format)  devise/sessions#create
# destroy_user_session DELETE /users/sign_out(.:format) devise/sessions#destroy
#

Rails.application.routes.draw do
  root 'main#index'

  devise_for :users
end
