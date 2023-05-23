# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#管理者
Admin.create!(
  email: 'admin@admin',
  password: '000000'
  )

#店舗
stores = Store.create!(
  [
    { password: "111111",
      email: "tokyo@example.com",
      name: "東京店",
      postal_code: "1638000",
      phone_number: "111-1111-1111",
      is_deleted: false,
      prefecture_code: 13,
      address_city: "新宿区",
      address_street: "111",
      address_building: "ユリカモメビル"
    },

    { password: "222222",
      email: "osaka@example.com",
      name: "大阪店",
      postal_code: "5408000",
      phone_number: "222-2222-2222",
      is_deleted: false,
      prefecture_code: 27,
      address_city: "大阪市中央区",
      address_street: "111",
      address_building: "百舌鳥モール"
    },

    { password: "333333",
      email: "okinawa@example.com",
      name: "沖縄店",
      postal_code: "9000000",
      phone_number: "333-3333-3333",
      is_deleted: true,
      prefecture_code: 47,
      address_city: "那覇市",
      address_street: "111",
      address_building: "ヤンバルクイナビルディング"
    }
  ]
)

#薬登録
Medicine.create!(
  [
    { name: "エンロクリア錠 15", ingredients_per_tablet: 0.15e2 },
    { name: "エンロクリア錠 50", ingredients_per_tablet: 0.5e2 },
    { name: "エンロクリア錠 100", ingredients_per_tablet: 0.1e3 },
    { name: "イトラコナゾール 50", ingredients_per_tablet: 0.5e2 },
    { name: "イトラコナゾール 100", ingredients_per_tablet: 0.1e3 },
    { name: "モサプリドクエン酸塩 5", ingredients_per_tablet: 0.5e1 },
    { name: "プレドニゾロン錠 1", ingredients_per_tablet: 0.1e1 },
    { name: "プレドニゾロン錠 5", ingredients_per_tablet: 0.5e1 }
  ]
)

#動物種登録
Seed.create!(
  [
    { name: "カピバラ" },
    { name: "フタユビナマケモノ" },
    { name: "フェネック" },
    { name: "ハルクインコンゴウインコ" },
    { name: "コザクラインコ" },
    { name: "ハリスホーク" },
    { name: "メンフクロウ" },
    { name: "ヤギ" },
    { name: "アルパカ" },
    { name: "ミニウサギ" },
    { name: "トンキニーズ" },
    { name: "テンジクネズミ" },
    { name: "ハリネズミ" },
    { name: "キャバリア" },
    { name: "イングリッシュコッカー" },
    { name: "ポメラニアン" },
    { name: "ブリティッシュショートヘア" },
    { name: "アメリカンショートヘア" },
    { name: "該当なし" },
  ]
)

#投薬回数登録
NumberOfTime.create!(
  [
    { name: "1日1回(SID)", dosing_times: 1 },
    { name: "1日2回(BID)", dosing_times: 2 },
    { name: "1日3回(TID)", dosing_times: 3 },
    { name: "1日4回(QID)", dosing_times: 4 }
  ]
)

#天気登録
Weather.create!(
  [
    { name: "快晴" },
    { name: "晴れ" },
    { name: "曇り" },
    { name: "霧" },
    { name: "小雨" },
    { name: "雨" },
    { name: "豪雨" },
    { name: "雪" },
    { name: "台風" },
    { name: "その他" }
  ]
)

#個体登録
@individual = Individual.create!(
      store_id: 2,
      seed_id: 11,
      name: "リク",
      birthday: Date.new(2020, 1, 1),
      age: 0.3e1,
      weight: 0.3e1,
      medication_id: nil,
      medication_status: nil)

@individual.image.attach(io: File.open(Rails.root.join('app/assets/images/tonki.jpg')),filename: 'my_image.jpg')

@individual = Individual.create!(
      store_id: 2,
      seed_id: 5,
      name: "なすび",
      birthday: Date.new(2015, 1, 1),
      age: 0.8e1,
      weight: 0.4e-1,
      medication_id: nil,
      medication_status: nil)

@individual.image.attach(io: File.open(Rails.root.join('app/assets/images/nasu.jpg')),filename: 'my_image.jpg')

@individual = Individual.create!(
      store_id: 2,
      seed_id: 1,
      name: "パピコ",
      birthday: Date.new(2018, 1, 1),
      age: 0.5e1,
      weight: 0.4e2,
      medication_id: nil,
      medication_status: nil)

@individual.image.attach(io: File.open(Rails.root.join('app/assets/images/capybara.jpg')),filename: 'my_image.jpg')

@individual = Individual.create!(
      store_id: 1,
      seed_id: 2,
      name: "フラッシュ",
      birthday: Date.new(2020, 1, 1),
      age: 0.3e1,
      weight: 0.8e1,
      medication_id: nil,
      medication_status: nil)

@individual.image.attach(io: File.open(Rails.root.join('app/assets/images/sloth.jpg')),filename: 'my_image.jpg')

@individual = Individual.create!(
      store_id: 3,
      seed_id: 7,
      name: "すけさん",
      birthday: Date.new(2017, 1, 1),
      age: 0.6e1,
      weight: 0.4e0,
      medication_id: nil,
      medication_status: nil)

@individual.image.attach(io: File.open(Rails.root.join('app/assets/images/owl.jpg')),filename: 'my_image.jpg')

@individual = Individual.create!(
      store_id: 3,
      seed_id: 17,
      name: "よこづな",
      birthday: Date.new(2019, 1, 1),
      age: 0.4e1,
      weight: 0.0,
      medication_id: nil,
      medication_status: nil)

@individual.image.attach(io: File.open(Rails.root.join('app/assets/images/yokozuna.jpg')),filename: 'my_image.jpg')

@individual = Individual.create!(
      store_id: 3,
      seed_id: 4,
      name: "ライリー",
      birthday: Date.new(2016, 1, 1),
      age: 0.7e1,
      weight: 0.1e1,
      medication_id: nil,
      medication_status: nil)

@individual.image.attach(io: File.open(Rails.root.join('app/assets/images/macaw.jpg')),filename: 'my_image.jpg')

@individual = Individual.create!(
      store_id: 1,
      seed_id: 5,
      name: "もぐ",
      birthday: Date.new(2021, 10, 1),
      age: 0.15e1,
      weight: 0.45e-1,
      medication_id: nil,
      medication_status: nil)

@individual.image.attach(io: File.open(Rails.root.join('app/assets/images/mog.jpg')),filename: 'my_image.jpg')

#日報
Dairy.create!(
  [
    { title: "混雑",
      medication_id: nil,
      store_id: 2,
      weather_id: "1",
      high_temperature: 25,
      low_temperature: 21,
      body: "平日だが、来客が多かった。\r\n気温が高く屋外より屋内施設の利用者が増えたと考えられる。\r\nSCも混雑していた。",
      created_date: Date.new(2023, 5, 18)
    },

    { title: "客数少ない",
      medication_id: nil,
      store_id: 1, weather_id: "1",
      high_temperature: 32,
      low_temperature: 27,
      body: "空っとした暑さで、屋外に出る人が多かったせいか、来客が少なかった。\r\nSC自体も来客が少ない様子。",
      created_date: Date.new(2023, 5, 1)
    },

    { title: "寒い",
      medication_id: nil,
      store_id: 1,
      weather_id: "6",
      high_temperature: 21,
      low_temperature: 15,
      body: "寒暖差が激しい",
      created_date: Date.new(2023, 3, 1)
    },

    { title: "湿度高い",
      medication_id: nil,
      store_id: 3,
      weather_id: "2",
      high_temperature: 25,
      low_temperature: 25,
      body: "一日の温度差ないけど、湿度93％！！",
      created_date: Date.new(2023, 6, 1)
    }
  ]
)

#投薬記録
Medication.create!(
  [

    { individual_id: 3,
      seed_id: nil,
      store_id: 1,
      number_of_tablets: 0.4e1,
      liquid_amount: 0.13e0,
      dosing_start_date: Date.new(2023, 5, 1),
      dosing_end_date: Date.new(2023, 5, 7),
      medication_status: "give",
      body: "真菌疑い",
      give_liquid: 0.5e0,
      several_days: 7,
      weight: 0.4e2,
      condition: "ふけ、ハゲ"
    },

    { individual_id: 5,
      seed_id: nil,
      store_id: 2,
      number_of_tablets: 0.4e0,
      liquid_amount: 0.13e0,
      dosing_start_date: Date.new(2023, 5, 18),
      dosing_end_date: Date.new(2023, 5, 24),
      medication_status: "give",
      body: "口内炎疑い、食欲あり",
      give_liquid: 0.5e-1,
      several_days: 7,
      weight: 0.4e0,
      condition: "口内赤み"
    }

  ]
)

#中間モデル
MedicineRecord.create!(
  [
    { medication_id: 1,
      medicine_id: 4,
      number_of_time_id: 1,
      dosage_indicated: 0.5e1
    },

    { medication_id: 2,
      medicine_id: 1,
      number_of_time_id: 1,
      dosage_indicated: 0.15e2
    }
  ]
)

#コメント
Comment.create!(
  [
    { store_id: 1,
      medication_id: 1,
      comment: "本日で投薬終了します。ふけもなく、毛もしっかり生えてきました。",
      created_at: Date.new(2023, 5, 23)
    },

    { store_id: nil,
      medication_id: 1,
      comment: "投薬終了し、様子を見てください、異常が出た際はまたご相談ください。",
      created_at: Date.new(2023, 5, 23)
    },

    { store_id: 1,
      medication_id: 1,
      comment: "承知いたしました。",
      created_at: Date.new(2023, 5, 23)
    }
  ]
)