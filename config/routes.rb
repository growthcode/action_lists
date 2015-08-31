# == Route Map
#
#                         Prefix Verb   URI Pattern                                              Controller#Action
#                           root GET    /                                                        pages#home
#               new_user_session GET    /users/sign_in(.:format)                                 devise/sessions#new
#                   user_session POST   /users/sign_in(.:format)                                 devise/sessions#create
#           destroy_user_session DELETE /users/sign_out(.:format)                                devise/sessions#destroy
#                  user_password POST   /users/password(.:format)                                devise/passwords#create
#              new_user_password GET    /users/password/new(.:format)                            devise/passwords#new
#             edit_user_password GET    /users/password/edit(.:format)                           devise/passwords#edit
#                                PATCH  /users/password(.:format)                                devise/passwords#update
#                                PUT    /users/password(.:format)                                devise/passwords#update
#       cancel_user_registration GET    /users/cancel(.:format)                                  devise/registrations#cancel
#              user_registration POST   /users(.:format)                                         devise/registrations#create
#          new_user_registration GET    /users/sign_up(.:format)                                 devise/registrations#new
#         edit_user_registration GET    /users/edit(.:format)                                    devise/registrations#edit
#                                PATCH  /users(.:format)                                         devise/registrations#update
#                                PUT    /users(.:format)                                         devise/registrations#update
#                                DELETE /users(.:format)                                         devise/registrations#destroy
#                          plans GET    /plans(.:format)                                         plans#index
#                                POST   /plans(.:format)                                         plans#create
#                       new_plan GET    /plans/new(.:format)                                     plans#new
#                      edit_plan GET    /plans/:id/edit(.:format)                                plans#edit
#                           plan GET    /plans/:id(.:format)                                     plans#show
#                                PATCH  /plans/:id(.:format)                                     plans#update
#                                PUT    /plans/:id(.:format)                                     plans#update
#                                DELETE /plans/:id(.:format)                                     plans#destroy
#                                GET    /plans/:plan_id/tasks/:id/edit_modal(.:format)           tasks#edit_modal
#                    update_task PATCH  /plans/:plan_id/tasks/:id(.:format)                      tasks#update
#                   destroy_task DELETE /plans/:plan_id/tasks/:id(.:format)                      tasks#destroy
#                     plan_tasks POST   /plans/:plan_id/tasks(.:format)                          tasks#create
#          sort_inbox_plan_tasks POST   /plans/:plan_id/tasks/sort_inbox(.:format)               tasks#sort_inbox
#     sort_positioned_plan_tasks POST   /plans/:plan_id/tasks/sort_positioned(.:format)          tasks#sort_positioned
#              plans_wizard_list GET    /plans/:plan_id/tasks_wizard/list(.:format)              tasks_wizard#list
#        create_list_task_wizard POST   /plans/:plan_id/task_wizard/create_task(.:format)        tasks_wizard#create_task
#              plans_wizard_rate GET    /plans/:plan_id/tasks_wizard/rate(.:format)              tasks_wizard#rate
#        update_rate_task_wizard PATCH  /plans/:plan_id/tasks_wizard/:id/rate_update(.:format)   tasks_wizard#rate_update
#            plans_wizard_assign GET    /plans/:plan_id/tasks_wizard/assign(.:format)            tasks_wizard#assign
#      update_assign_task_wizard PATCH  /plans/:plan_id/tasks_wizard/:id/assign_update(.:format) tasks_wizard#assign_update
# create_role_assign_task_wizard POST   /plans/:plan_id/tasks_wizard/create_role(.:format)       tasks_wizard#create_role
#           plans_wizard_include GET    /plans/:plan_id/tasks_wizard/include(.:format)           tasks_wizard#include
#          plans_wizard_position GET    /plans/:plan_id/tasks_wizard/position(.:format)          tasks_wizard#position
#       plans_wizard_preparation GET    /plans/:plan_id/tasks_wizard/preparation(.:format)       tasks_wizard#preparation
#

Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :plans

  get 'plans/:plan_id/tasks/:id/edit_modal', to: 'tasks#edit_modal'
  patch 'plans/:plan_id/tasks/:id', to: 'tasks#update', as: :update_task
  delete 'plans/:plan_id/tasks/:id', to: 'tasks#destroy', as: :destroy_task
  post 'plans/:plan_id/tasks', to: 'tasks#create', as: :plan_tasks
  post 'plans/:plan_id/tasks/sort_inbox', to: 'tasks#sort_inbox', as: :sort_inbox_plan_tasks
  post 'plans/:plan_id/tasks/sort_positioned', to: 'tasks#sort_positioned', as: :sort_positioned_plan_tasks

  get 'plans/:plan_id/tasks_wizard/list', to: 'tasks_wizard#list', as: 'plans_wizard_list'
  post 'plans/:plan_id/task_wizard/create_task', to: 'tasks_wizard#create_task', as: 'create_list_task_wizard'

  get 'plans/:plan_id/tasks_wizard/rate', to: 'tasks_wizard#rate', as: 'plans_wizard_rate'
  patch 'plans/:plan_id/tasks_wizard/:id/rate_update', to: 'tasks_wizard#rate_update', as: 'update_rate_task_wizard'

  get 'plans/:plan_id/tasks_wizard/assign', to: 'tasks_wizard#assign', as: 'plans_wizard_assign'
  patch 'plans/:plan_id/tasks_wizard/:id/assign_update', to: 'tasks_wizard#assign_update', as: 'update_assign_task_wizard'
  post 'plans/:plan_id/tasks_wizard/create_role', to: 'tasks_wizard#create_role', as: 'create_role_assign_task_wizard'

  get 'plans/:plan_id/tasks_wizard/include', to: 'tasks_wizard#include', as: 'plans_wizard_include'
  patch 'plans/:plan_id/tasks_wizard/:id/include_toggle', to: 'tasks_wizard#include_toggle', as: 'update_include_task_wizard'
  post 'plans/:plan_id/tasks_wizard/include_sort', to: 'tasks_wizard#include_sort', as: 'sort_include_task_wizard'

  get 'plans/:plan_id/tasks_wizard/position', to: 'tasks_wizard#position', as: 'plans_wizard_position'
  get 'plans/:plan_id/tasks_wizard/preparation', to: 'tasks_wizard#preparation', as: 'plans_wizard_preparation'
end
