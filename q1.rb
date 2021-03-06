#https://note.com/cookpad_mart/n/nad1e61db803f
#https://cookpad-mart-careers.studio.site/engineer
#1くらいは解きたい

class Truck
  def initialize(num_of_unit)
    @truck_weight = Array.new
    @truck_product_id_list = Array.new

    @truck_max = num_of_unit
    @truck_max.times {|t|
      @truck_weight[t] = 0
      @truck_product_id_list[t] = []
    }
  end

  def add(product_id, weight)
    #truck配列の最小数をもつエレメント番号を取得
    elem_num = @truck_weight.index(@truck_weight.min)

    #truck_weight配列に重量を追加
    @truck_weight[elem_num] += weight

    #truck_weight配列のインデックス番号と同じインデックス番号に商品IDを追加
    @truck_product_id_list[elem_num].push product_id
  end

  def view
    @truck_max.times {|t|
      puts "truck_#{t}: #{@truck_weight[t]},  #{@truck_product_id_list[t]}"
    }
  end
end



if ARGV.size < 1
  p '引数が足りません'
  exit
end

number_of_units = 3
t = Truck.new(number_of_units)

#引数をハッシュに変換
ARGV.each {|str|
  a = str.split(':')
  h = Hash[*a]
  h.each {|k, v|
    t.add(k.to_i, v.to_i)
  }
}
t.view

