# frozen_string_literal: true

require_relative 'item'
class Receipt
  def initialize(items)
    @items = items.map do |item_data|
      Item.new(
        name: item_data[:name],
        price: item_data[:price],
        quantity: item_data[:quantity],
        category: item_data[:category],
        imported: item_data[:imported],
      )
    end
  end

  def generate
    @items.each do |item|
      # I would've placed the `format` behind a separate private method like I di
      # with the other private methods below, but I didn't want to spend time
      # thinking about how to pass the item's total price into the format method
      # signature. Maybe I should have just kept all the formatting here in this
      # block...
      puts "#{item.quantity} #{item.name}: #{format('%.2f', item.total_price)}"
    end
    puts "Sales Taxes: #{total_tax_formatted}"
    puts "Total: #{total_amount_formatted}"
  end

  private

  def total_tax_formatted
    format('%.2f', @items.sum(&:total_tax))
  end

  def total_amount_formatted
    format('%.2f', @items.sum(&:total_price))
  end
end
