Rails.application.routes.draw do
	resources :rsas
	resources :messages
	post '/rsas', to: 'rsas#create'
	get '/rsas/:id', to: 'rsas#show'
	post '/rsas/:id/encrypt_messages/', to: 'messages#create'
	get '/rsas/:id/encrypt_messages/:id2', to: 'messages#show'
	post '/rsas/:id/decrypt_messages/', to: 'messages#decrypt_message'
end
