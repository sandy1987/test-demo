require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do
  describe '#update_quality' do
    it 'does not change the name' do
      items = [Item.new('Aged Brie', 0, 0, Date.today + 2.days)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq 'Aged Brie'
    end

    it 'does return the correct quality' do
      items = [Item.new('Conjured', 0, 6, Date.today + 2.days)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq 'Conjured'
      expect(items[0].quality).to 3 
    end

    it 'does return the correct sell_in' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 8, 0, Date.today + 2.days)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 7
    end

    it 'does return the same quality' do
      items = [Item.new('Sulfuras, Hand of Ragnaros', 0, 2, Date.today + 2.days)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to 2
    end

    it 'does return the degrades quality' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 4, Date.today + 2.days)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to 3
    end

    it 'does return the incorrect quality' do
      items = [Item.new('Conjured', 0, 6, Date.today + 2.days)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq 'Conjured'
      expect(items[0].quality).to 2 
    end

    it 'does return the incorrect sell_in' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 8, 0, Date.today + 2.days)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 6
    end

    it 'does return the incorrect quality' do
      items = [Item.new('Sulfuras, Hand of Ragnaros', 0, 2, Date.today + 2.days)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to 3
    end

    it 'does return the incorrect degrades quality' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 4, Date.today + 2.days)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to 1
    end
  end
end

