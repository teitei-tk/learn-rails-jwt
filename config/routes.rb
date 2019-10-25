Rails.application.routes.draw do
  namespace :applications do
    post 'keys/', to: 'keys#create'
  end
end
