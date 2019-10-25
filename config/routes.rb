Rails.application.routes.draw do
  namespace :applications do
    post 'keys/:id', to: 'keys#create'
  end
end
