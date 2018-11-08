class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      case item.name
        when "Aged Brie"
          return aged_brie(item)
        when "Sulfuras, Hand of Ragnaros"
          return sulfuras
        when "Backstage passes to a TAFKAL80ETC concert"
          return backstage_pass(item)
      end
      generic_item(item) if item.name != "Aged Brie" || "Sulfuras, Hand of Ragnaros" || "Backstage passes to a TAFKAL80ETC concert"
      end
  end

  def generic_item(item)
    item.sell_in -=1
    return item.quality if item.quality == 0 # never lowers quality below 0
    item.quality -= 1
    item.quality -= 1 if item.sell_in < 0 # lower again after sell in date
end

  def aged_brie(item)
    return if item.quality >= 50
    item.quality += 1
    return if item.quality >= 50
    item.quality += 1 if item.sell_in <= 0
    item.sell_in -= 1
  end

  def sulfuras
  end

  def backstage_pass(item)
    return item.quality = 0 if item.sell_in == 0
    return if item.quality >= 50
    item.quality += 1 if item.sell_in
    return if item.quality >= 50
    item.quality += 1 if item.sell_in.between?(1, 10)
    return if item.quality >= 50
    item.quality += 1 if item.sell_in.between?(1, 6)
    item.sell_in -= 1
  end

end
