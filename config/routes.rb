Rails.application.routes.draw do
  namespace :api do
    resources :movies, except: [:new, :edit]
    post 'movies/:id/votes/:rating' => 'movies#votes'
  end


end
