Rails.application.routes.draw do
  post 'keys/', to: 'keys#create'
end
