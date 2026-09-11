Rails.application.routes.draw do
  root "homes#index"

  post "games/start", to: "games#start", as: :start_game
  get "games/play", to: "games#play", as: :game
end
