class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
            decrease_quality(item)
      else
          increse_quality(item)
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
                increse_quality(item)
            end
            if item.sell_in < 6
                increse_quality(item)
            end
          end
      end

        decrease_sell_in(item)

      if item.sell_in < 0
        if item.name != "Aged Brie"
            decrease_quality(item)
          # else #executes if item name is "Backstage passes.."
            zero_quality(item) # assigns item.quality to zero
        else # if item.name is "Aged Brie"
            increse_quality(item)
        end
      end
    end
  end

  def increse_quality(item)
      item.quality += 1 if quality_below_50?(item)
  end

  def decrease_quality(item)
    return item.quality if sulfuras?(item)
    return item.quality unless quality_positive?(item)
    item.quality -= 1
  end

  def zero_quality(item)
    item.quality = 0 if backstage_passes?(item)
  end

  def decrease_sell_in(item)
    return item.sell_in if sulfuras?(item)
    item.sell_in -= 1
  end

  def quality_below_50?(item)
    item.quality < 50
  end

  def sulfuras?(item)
    item.name == "Sulfuras, Hand of Ragnaros"
  end

  def quality_positive?(item)
    item.quality > 0
  end

  def backstage_passes?(item)
    item.name == "Backstage passes to a TAFKAL80ETC concert"
  end

end
