class AddHintDataToPrefectures < ActiveRecord::Migration[7.1]
  def change
    add_column :prefectures, :region, :string
    add_column :prefectures, :coastal, :boolean
  end
end
