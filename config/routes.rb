Rails.application.routes.draw do
  root "homes#index"

  post "games/start", to: "games#start", as: :start_game
  get "games/play", to: "games#play", as: :game
  post "games/answer", to: "games#answer", as: :answer_game
  get "games/result", to: "games#result", as: :game_result
end
