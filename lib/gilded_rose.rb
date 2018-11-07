class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      @quality = item.quality
      @sell_in = item.sell_in
      generic_item if item.name == "item" || "foo"
      aged_brie if item.name == "Aged Brie"
      # if item.name == "Aged Brie"
      #   return aged_brie
      # end
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        if item.quality > 0
          if item.name != "Sulfuras, Hand of Ragnaros"
            item.quality = item.quality - 1
          end
        end
      else
        if item.quality < 50
          item.quality = item.quality + 1
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
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
      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in = item.sell_in - 1
      end
      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0
              if item.name != "Sulfuras, Hand of Ragnaros"
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
    end
  end
end

def generic_item
  @sell_in -=1
  return if @quality == 0 # never lowers quality below 0
  @quality -= 1
  @quality -= 1 if @sell_in <= 0 # lower again after sell in date
end

def aged_brie
  @sell_in -= 1
  return @quality if @quality >= 50
  @quality += 1
  @quality += 1 if @sell_in <= 0
end
