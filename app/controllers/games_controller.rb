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

   def answer
  selected_ids = params[:selected_prefecture_ids].split(",").map(&:to_i)

  if selected_ids.length != 3
    redirect_to game_path
    return
  end

  answer_ids = session[:answer_prefecture_ids]

  session[:is_correct] = selected_ids.sort == answer_ids.sort

  redirect_to game_result_path
end

  def result
    @is_correct = session[:is_correct]
    @answer_prefectures = Prefecture.where(
      id: session[:answer_prefecture_ids]
    )
  end


end
