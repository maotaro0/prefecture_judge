class GamesController < ApplicationController
  def start
    candidate_prefectures = Prefecture.order("RANDOM()").limit(10)
    answer_prefectures = candidate_prefectures.sample(3)

    session[:candidate_prefecture_ids] = candidate_prefectures.ids
    session[:answer_prefecture_ids] = answer_prefectures.map(&:id)

    redirect_to game_path
  end

  def play
    @candidate_prefectures = Prefecture.where(
      id: session[:candidate_prefecture_ids]
    )
  end
end
