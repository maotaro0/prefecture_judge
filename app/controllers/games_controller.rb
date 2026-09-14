class GamesController < ApplicationController
  def start
    candidate_prefectures = Prefecture.order("RANDOM()").limit(10)
    answer_prefectures = candidate_prefectures.sample(3)

    session[:candidate_prefecture_ids] = candidate_prefectures.ids
    session[:answer_prefecture_ids] = answer_prefectures.map(&:id)

    session[:used_hint_keys] = []

    redirect_to game_path
  end

  def play
    @candidate_prefectures = 
      Prefecture.where(id: session[:candidate_prefecture_ids])
  
    @answer_prefectures =
      Prefecture.where(id: session[:answer_prefecture_ids])

    @coastal_answer_count =
      @answer_prefectures.count { |prefecture| prefecture.coastal }
    
    regions = [
     "北海道",
     "東北",
     "関東",
     "中部",
     "近畿",
     "中国",
     "四国",
     "九州・沖縄"
     ]

    @region_answer_counts = {}

    regions.each do |region|
      @region_answer_counts[region] =
       @answer_prefectures.count { |prefecture| prefecture.region == region }
    end
    
    @hints = [
     {
      key: "coastal",
      text: "海に面している都道府県",
      count: @coastal_answer_count
     }
    ]

    @region_answer_counts.each do |region, count|
     text =
       if region == "北海道"
        "北海道にある都道府県"
       else
        "#{region}地方にある都道府県"
       end

    @hints << {
      key: "region_#{region}",
      text: text,
      count: count
    }
    end

    session[:used_hint_keys] ||= []

    available_hints =
      @hints.reject do |hint|
       session[:used_hint_keys].include?(hint[:key])
     end

   if available_hints.empty?
      session[:used_hint_keys] = []
      available_hints = @hints
    end

   @current_hint = available_hints.sample

   session[:used_hint_keys] << @current_hint[:key]
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
