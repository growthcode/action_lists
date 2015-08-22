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
#                      plans GET    /plans(.:format)                                plans#index
#                            POST   /plans(.:format)                                plans#create
#                   new_plan GET    /plans/new(.:format)                            plans#new
#                  edit_plan GET    /plans/:id/edit(.:format)                       plans#edit
#                       plan GET    /plans/:id(.:format)                            plans#show
#                            PATCH  /plans/:id(.:format)                            plans#update
#                            PUT    /plans/:id(.:format)                            plans#update
#                            DELETE /plans/:id(.:format)                            plans#destroy
#                            GET    /plans/:plan_id/tasks/:id/edit_modal(.:format)  tasks#edit_modal
#                 plan_tasks POST   /plans/:plan_id/tasks(.:format)                 tasks#create
#      sort_inbox_plan_tasks POST   /plans/:plan_id/tasks/sort_inbox(.:format)      tasks#sort_inbox
# sort_positioned_plan_tasks POST   /plans/:plan_id/tasks/sort_positioned(.:format) tasks#sort_positioned
#

Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :plans

  get 'plans/:plan_id/tasks/:id/edit_modal', to: 'tasks#edit_modal'
  post 'plans/:plan_id/tasks', to: 'tasks#create', as: :plan_tasks
  post 'plans/:plan_id/tasks/sort_inbox', to: 'tasks#sort_inbox', as: :sort_inbox_plan_tasks
  post 'plans/:plan_id/tasks/sort_positioned', to: 'tasks#sort_positioned', as: :sort_positioned_plan_tasks
end
