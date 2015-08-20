# == Route Map
#
#                     Prefix Verb   URI Pattern                                     Controller#Action
#                       root GET    /                                               pages#home
#           new_user_session GET    /users/sign_in(.:format)                        devise/sessions#new
#               user_session POST   /users/sign_in(.:format)                        devise/sessions#create
#       destroy_user_session DELETE /users/sign_out(.:format)                       devise/sessions#destroy
#              user_password POST   /users/password(.:format)                       devise/passwords#create
#          new_user_password GET    /users/password/new(.:format)                   devise/passwords#new
#         edit_user_password GET    /users/password/edit(.:format)                  devise/passwords#edit
#                            PATCH  /users/password(.:format)                       devise/passwords#update
#                            PUT    /users/password(.:format)                       devise/passwords#update
#   cancel_user_registration GET    /users/cancel(.:format)                         devise/registrations#cancel
#          user_registration POST   /users(.:format)                                devise/registrations#create
#      new_user_registration GET    /users/sign_up(.:format)                        devise/registrations#new
#     edit_user_registration GET    /users/edit(.:format)                           devise/registrations#edit
#                            PATCH  /users(.:format)                                devise/registrations#update
#                            PUT    /users(.:format)                                devise/registrations#update
#                            DELETE /users(.:format)                                devise/registrations#destroy
#      sort_inbox_plan_tasks POST   /plans/:plan_id/tasks/sort_inbox(.:format)      tasks#sort_inbox
# sort_positioned_plan_tasks POST   /plans/:plan_id/tasks/sort_positioned(.:format) tasks#sort_positioned
#                 plan_tasks GET    /plans/:plan_id/tasks(.:format)                 tasks#index
#                            POST   /plans/:plan_id/tasks(.:format)                 tasks#create
#              new_plan_task GET    /plans/:plan_id/tasks/new(.:format)             tasks#new
#             edit_plan_task GET    /plans/:plan_id/tasks/:id/edit(.:format)        tasks#edit
#                  plan_task GET    /plans/:plan_id/tasks/:id(.:format)             tasks#show
#                            PATCH  /plans/:plan_id/tasks/:id(.:format)             tasks#update
#                            PUT    /plans/:plan_id/tasks/:id(.:format)             tasks#update
#                            DELETE /plans/:plan_id/tasks/:id(.:format)             tasks#destroy
#                      plans GET    /plans(.:format)                                plans#index
#                            POST   /plans(.:format)                                plans#create
#                   new_plan GET    /plans/new(.:format)                            plans#new
#                  edit_plan GET    /plans/:id/edit(.:format)                       plans#edit
#                       plan GET    /plans/:id(.:format)                            plans#show
#                            PATCH  /plans/:id(.:format)                            plans#update
#                            PUT    /plans/:id(.:format)                            plans#update
#                            DELETE /plans/:id(.:format)                            plans#destroy
#

Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :plans do
    resources :tasks do
      collection do
        post :sort_inbox
        post :sort_positioned
      end
    end
  end

end
