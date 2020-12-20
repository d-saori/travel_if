# 商品データ
products = [
  {name: "トマト", price: 100},
  {name: "きゅうり", price: 200},
  {name: "玉ねぎ", price: 300},
  {name: "なす", price: 400}
]

# 定数を設定。ここでの変更がコード全体に反映される
FIRST_PRODUCT_NUM = 31 # 表示する最初の商品の番号(変更可)
LAST_PRODUCT_NUM = (FIRST_PRODUCT_NUM + products.size) - 1 # 表示する最後の商品の番号（変更不可）
DISCOUNT_STANDARD_VALUE = 5 # 割引気を適用する個数の基準値(変更可)
DISCOUNT_RATE = 0.1 # 割引率(変更可)
AFTER_DISCOUNT_RATE = 1 - DISCOUNT_RATE # 割引後の本体価格の割合(変更可)

# 商品を表示
puts "いらっしゃいませ!商品を選んで下さい。"
puts
products.each.with_index(1) { |product, i|
  puts "#{i}.#{product[:name]}(#{product[:price]})円"
}
puts

# 商品を選択
while true
  print "商品の番号を選択 > "
  select_product_num = gets.to_i
  break if select_product_num <= 4 # (1..4).include?(select_product_num)
  puts "1〜4の番号を入力して下さい。"
end
chosen_product = products[select_product_num - 1]
puts

# 個数を決定
puts "#{chosen_product[:name]}ですね。何個買いますか?"
while true
  print "個数を入力 > "
  quantity_of_product = gets.to_i
  break if quantity_of_product > 0
  puts "1個以上選んでください。"
end
puts

# 合計金額を計算
total_price = chosen_product[:price] * quantity_of_product
# discounted_total_price = (total_price * 0.9).floor
if quantity_of_product >= 5
  puts "5個以上なので10％割引となります!"
  total_price *= 0.9
end
puts "合計金額は#{total_price.floor}円です。"
puts "お買い上げありがとうございました!"