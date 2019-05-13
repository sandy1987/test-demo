class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name != 'Aged Brie' and item.name != 'Backstage passes to a TAFKAL80ETC concert'
        if item.quality >= 0
          if item.name != 'Sulfuras, Hand of Ragnaros'
            item.quality = item.quality - 1
          end
        end
      else
        if item.quality < 50
          item.quality = item.quality + 1
          if item.name == 'Backstage passes to a TAFKAL80ETC concert'
            if item.sell_in < 11
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
          end
        end
      end
      if item.name != 'Sulfuras, Hand of Ragnaros'
        item.sell_in = item.sell_in - 1
      end
      if item.sell_in < 0
        if item.name != 'Aged Brie'
          if item.name != 'Backstage passes to a TAFKAL80ETC concert'
            if item.quality > 0
              if item.name != 'Sulfuras, Hand of Ragnaros'
                item.quality = item.quality - 1
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
      end
      if item.name == "Aged Brie"
        if item.quality < 50
          item.quality = item.quality + 1
        end  
      end 
      if item.name == "Conjured"
        if item.quality > 0
          item.quality = item.quality/2
        end  
      end  
      if item.name == "Backstage passes to a TAFKAL80ETC concert"
        if item.quality < 50
          if [*6..10].include?(selling_date.to_date - Date.today).to_i  
            item.quality = item.quality + 2
          end
          if [*1..5].include?(selling_date.to_date - Date.today).to_i
            item.quality = item.quality + 1
          end
        end  
      end  
      if item.name != 'Sulfuras, Hand of Ragnaros'
        if Date.today > selling_date.to_date
          if item.quality > 0
            item.quality = item.quality/2
          end  
        end
      end
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality, :selling_date

  def initialize(name, sell_in, quality, selling_date)
    @name = name
    @sell_in = sell_in
    @quality = quality
    @selling_date = selling_date
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}, #{selling_date}"
  end
end
