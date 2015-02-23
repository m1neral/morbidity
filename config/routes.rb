Rails.application.routes.draw do
  post 'report/handling', path: '/'
  root 'report#index'
end
