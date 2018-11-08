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
          sulfuras
        when "Backstage passes to a TAFKAL80ETC concert"
          backstage_pass
      end

      if item.name != "Aged Brie" && item.name !=  "Sulfuras, Hand of Ragnaros" && item.name != "Backstage passes to a TAFKAL80ETC concert"
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
    return @current_item.quality if @current_item
    @quality
  end

  def sell_in
    return @current_item.sell_in if @current_item
    @sell_in
  end

  def aged_brie
    @current_item = Aged_Brie.new(quality, sell_in)
    @current_item.update_quality
  end

  def sulfuras
    @current_item = Sulfuras.new(quality, sell_in)
    @current_item.update_quality
  end

  def backstage_pass
    @current_item = Backstage_Pass.new(quality, sell_in)
    @current_item.update_quality
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

class Sulfuras
  attr_reader :quality, :sell_in

  def initialize(quality, sell_in)
    @quality = quality.to_i
    @sell_in = sell_in.to_i
  end

  def update_quality
  end
end

class Backstage_Pass
  attr_reader :quality, :sell_in

  def initialize(quality, sell_in)
    @quality = quality.to_i
    @sell_in = sell_in.to_i
  end

  def update_quality
    return @quality = 0 if @sell_in == 0
    return if @quality >= 50
    @quality += 1 if @sell_in
    return if @quality >= 50
    @quality += 1 if @sell_in.between?(1, 10)
    return if @quality >= 50
    @quality += 1 if @sell_in.between?(1, 6)
    @sell_in -= 1
  end
end
