Rails.application.routes.draw do
  post '/rsas', to: 'rsas#new'
  get '/rsas/:id', to: 'rsas#show'
  post '/rsas/:id/encrypt_messages/', to: 'messages#new'
  get '/rsas/:id/encrypt_messages/:id2', to: 'messages#show'
  post '/rsas/:id/decrypt_messages/', to: 'messages#decrypt_message'
end
