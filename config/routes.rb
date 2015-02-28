Rails.application.routes.draw do
  # ru: Связь экшна и перенаправление на ту же стартовую страницу.
  # en: Connect action and redirect to start index page.
  post 'report/handling', path: '/'
  root 'report#index'
end
