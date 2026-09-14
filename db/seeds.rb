prefectures = [
  { name: "北海道", region: "北海道", coastal: true },

  { name: "青森県", region: "東北", coastal: true },
  { name: "岩手県", region: "東北", coastal: true },
  { name: "宮城県", region: "東北", coastal: true },
  { name: "秋田県", region: "東北", coastal: true },
  { name: "山形県", region: "東北", coastal: true },
  { name: "福島県", region: "東北", coastal: true },

  { name: "茨城県", region: "関東", coastal: true },
  { name: "栃木県", region: "関東", coastal: false },
  { name: "群馬県", region: "関東", coastal: false },
  { name: "埼玉県", region: "関東", coastal: false },
  { name: "千葉県", region: "関東", coastal: true },
  { name: "東京都", region: "関東", coastal: true },
  { name: "神奈川県", region: "関東", coastal: true },

  { name: "新潟県", region: "中部", coastal: true },
  { name: "富山県", region: "中部", coastal: true },
  { name: "石川県", region: "中部", coastal: true },
  { name: "福井県", region: "中部", coastal: true },
  { name: "山梨県", region: "中部", coastal: false },
  { name: "長野県", region: "中部", coastal: false },
  { name: "岐阜県", region: "中部", coastal: false },
  { name: "静岡県", region: "中部", coastal: true },
  { name: "愛知県", region: "中部", coastal: true },

  { name: "三重県", region: "近畿", coastal: true },
  { name: "滋賀県", region: "近畿", coastal: false },
  { name: "京都府", region: "近畿", coastal: true },
  { name: "大阪府", region: "近畿", coastal: true },
  { name: "兵庫県", region: "近畿", coastal: true },
  { name: "奈良県", region: "近畿", coastal: false },
  { name: "和歌山県", region: "近畿", coastal: true },

  { name: "鳥取県", region: "中国", coastal: true },
  { name: "島根県", region: "中国", coastal: true },
  { name: "岡山県", region: "中国", coastal: true },
  { name: "広島県", region: "中国", coastal: true },
  { name: "山口県", region: "中国", coastal: true },

  { name: "徳島県", region: "四国", coastal: true },
  { name: "香川県", region: "四国", coastal: true },
  { name: "愛媛県", region: "四国", coastal: true },
  { name: "高知県", region: "四国", coastal: true },

  { name: "福岡県", region: "九州・沖縄", coastal: true },
  { name: "佐賀県", region: "九州・沖縄", coastal: true },
  { name: "長崎県", region: "九州・沖縄", coastal: true },
  { name: "熊本県", region: "九州・沖縄", coastal: true },
  { name: "大分県", region: "九州・沖縄", coastal: true },
  { name: "宮崎県", region: "九州・沖縄", coastal: true },
  { name: "鹿児島県", region: "九州・沖縄", coastal: true },
  { name: "沖縄県", region: "九州・沖縄", coastal: true }
]

prefectures.each do |prefecture_data|
  prefecture = Prefecture.find_or_initialize_by(name: prefecture_data[:name])

  prefecture.update!(
    region: prefecture_data[:region],
    coastal: prefecture_data[:coastal]
  )
end