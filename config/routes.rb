Rails.application.routes.draw do
delete 'tags/:entity_type/:entity_id', to:'entities#destroy'
 
post 'tag', to: 'entities#create'
get 'tags/:entity_type/:entity_id', to:'entities#show'
get 'stats/:entity_type/:entity_id', to:'entities#status_entity'
get 'stats',to:'entities#status_all'

  #resources :entities
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
