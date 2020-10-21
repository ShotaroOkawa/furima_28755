user = User.create!(
  nickname: "Seller",
  email: "seller@mail.com",
  password: "password123",
  password_confirmation: "password123",
  family_name: "てすと",
  first_name: "太郎",
  family_name_kana: "テスト",
  first_name_kana: "タロウ",
  birthday: "1990-3-16",
)

user = User.create!(
  nickname: "Purchaser",
  email: "purchaser@mail.com",
  password: "password123",
  password_confirmation: "password123",
  family_name: "てすと",
  first_name: "花子",
  family_name_kana: "テスト",
  first_name_kana: "ハナコ",
  birthday: "1990-3-16",
)

users = User.all
user1, user2 = users

item = Item.new(
  user_id: user1.id, 
  name: "メンズパーカー",
  description: "とても軽量でありながら保湿性の高くこれからの時期に大活躍すること間違いなしのマストアイテムです。
  また、強度があり耐久性が高いのでお手入れしやすくヘビーローテで着用できるのも嬉しいポイント。",
  category_id: 3,
  condition_id: 2,
  delv_fee_id: 2,
  delv_from_id: 2,
  delv_time_id: 2,
  price: 3000,
)
item.image.attach(io: File.open("./db/fixtures/item1.jpg"), filename: "item1.jpg" )
item.save!

item = Item.new(
  user_id: user1.id, 
  name: "マシュマロボア&オーガニックコットン",
  description: "可愛いだけじゃなく、素材も上質。赤ちゃんの頭から、指先、足のつま先まで総裏地の2枚重ねでとってもあたたか。 赤ちゃんが動き回っても、夢中になって遊んでも、脱げたりまくれたりせず、冬の冷たい空気から、守ってくれます。",
  category_id: 4,
  condition_id: 2,
  delv_fee_id: 2,
  delv_from_id: 5,
  delv_time_id: 3,
  price: 5000,
)
item.image.attach(io: File.open("./db/fixtures/item2.jpg"), filename: "item2.jpg" )
item.save!

item = Item.new(
  user_id: user1.id, 
  name: "iMac Retina 4Kディスプレイ",
  description: "何でもできるオールインワン。あなたが思い描くことは、どんなことでもiMacで実現できるでしょう。目を奪うデザイン。操作は限りなくシンプルで思いのまま。そして、あらゆるアイデアを次のレベルへ引き上げるパワフルなツールがたっぷり。",
  category_id: 8,
  condition_id: 2,
  delv_fee_id: 2,
  delv_from_id: 5,
  delv_time_id: 3,
  price: 150000,
)
item.image.attach(io: File.open("./db/fixtures/item3.jpg"), filename: "item3.jpg" )
item.save!

item = Item.new(
  user_id: user1.id, 
  name: "卓球ラケット",
  description: "【高品質国際規格】耐久性に優れた自然ゴムと高品質のスポンジで作られ、適度な厚さと弾力性があり、バランス、回転、制御、速度のために設計されており、ゲームを一歩先に進めるだけでなく、いくつかのレベルを向上させることができます。",
  category_id: 9,
  condition_id: 2,
  delv_fee_id: 2,
  delv_from_id: 32,
  delv_time_id: 3,
  price: 10000,
)
item.image.attach(io: File.open("./db/fixtures/item4.jpg"), filename: "item4.jpg" )
item.save!

item = Item.new(
  user_id: user1.id, 
  name: "ダイニングテーブル",
  description: "家族やお友達とゆったりとした落ち着いた時間を過ごせ、大人4人でもゆったりくつろげる横幅160cmのダイニングテーブル、mion（ミオン）。天板には、堅くて重厚感があり耐久性にとても優れた木材のオーク材の突板を使用。くっきりとした木目や木肌が白いのが特徴。古くからヨーロッパやアメリカでは、家具や床板、船舶、ウイスキー樽などにも使われており、馴染みのある木材を使用しています。表面の塗装は木目を活かし、耐久性を上げるために少し厚めのPU塗装を施しています。",
  category_id: 5,
  condition_id: 2,
  delv_fee_id: 3,
  delv_from_id: 20,
  delv_time_id: 3,
  price: 100000,
)
item.image.attach(io: File.open("./db/fixtures/item5.jpg"), filename: "item5.jpg" )
item.save!