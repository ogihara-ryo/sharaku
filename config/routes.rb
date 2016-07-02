# == Route Map
#
#        Prefix Verb URI Pattern              Controller#Action
# welcome_index GET  /welcome/index(.:format) welcome#index
#          root GET  /                        welcome#index
#

Rails.application.routes.draw do
  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
