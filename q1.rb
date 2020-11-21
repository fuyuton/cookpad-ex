#https://note.com/cookpad_mart/n/nad1e61db803f
#https://cookpad-mart-careers.studio.site/engineer
#1くらいは解きたい

if ARGV.size < 1
  p '引数が足りません'
  exit
end

hash = Hash.new
#引数をハッシュに変換
ARGV.each {|str|
  a = str.split(':')
  h = Hash[*a]
  hash = hash.merge(h)
}


truck_weight = Array.new
truck_product_id = Array.new

truck_max = 3
truck_max.times {|t|
  truck_weight[t] = 0
  truck_product_id[t] = []
}

hash.each {|k, v|
  #truck配列の最小数をもつエレメント番号を取得
  elem_num = truck_weight.index(truck_weight.min)

  #truck_weight配列に重量を追加
  truck_weight[elem_num] += v.to_i

  #truck_weight配列のインデックス番号と同じインデックス番号に商品IDを追加
  truck_product_id[elem_num].push k.to_i
}

truck_max.times {|t|
  puts "truck_#{t}: #{truck_weight[t]},  #{truck_product_id[t]}"
}

#このプログラムの欠点は、truck_weightとtruck_product_idが疎のまま実装されていること
#本来この2つは1つのものとして扱えるべき
