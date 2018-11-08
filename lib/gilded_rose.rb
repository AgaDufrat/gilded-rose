class GildedRose

  attr_accessor :name, :quality, :sell_in, :item

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      @quality = item.quality
      @sell_in = item.sell_in

      case item.name
        when "Aged Brie"
          aged_brie
        when "Sulfuras, Hand of Ragnaros"
          return sulfuras
        when "Backstage passes to a TAFKAL80ETC concert"
          return backstage_pass(item)
      end

      if item.name != "Aged Brie" && "Sulfuras, Hand of Ragnaros" && "Backstage passes to a TAFKAL80ETC concert"
          generic_item
      end
      item.sell_in = @current_item.sell_in
      item.quality = @current_item.quality
    end
  end

  def generic_item
    @current_item = Generic.new(quality, sell_in)
    @current_item.update_quality
  end

  def quality
    return item.quality if @current_item
    @quality
  end

  def sell_in
    return item.sell_in if @current_item
    @sell_in
  end

  def aged_brie
    @current_item = Aged_Brie.new(quality, sell_in)
    @current_item.update_quality
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

class Generic
  attr_reader :quality, :sell_in

  def initialize(quality, sell_in)
    @quality = quality.to_i
    @sell_in = sell_in.to_i
  end

  def update_quality
    @sell_in -=1
    return @quality if @quality == 0 # never lowers quality below 0
    @quality -= 1
    @quality -= 1 if @sell_in < 0 # lower again after sell in date
  end
end

class Aged_Brie
  attr_reader :quality, :sell_in

  def initialize(quality, sell_in)
    @quality = quality.to_i
    @sell_in = sell_in.to_i
  end

  def update_quality
    return if @quality >= 50
    @quality += 1
    return if @quality >= 50
    @quality += 1 if @sell_in <= 0
    @sell_in -= 1
  end
end
