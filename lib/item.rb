# frozen_string_literal: true

class Item
  attr_accessor(
    :name,
    :quantity,
    :price,
    :category,
    :imported
  )

  def initialize(name:, quantity:, price:, category:, imported: false)
    @name = name
    @quantity = quantity
    @price = price
    @category = category
    @imported = imported

    @tax_calculators =
      TaxCalculatorFactory.for_item(
        category: category,
        imported: imported,
      )
  end

  def total_tax
    total_rate = @tax_calculators.sum(&:rate)
    tax = price * (total_rate/100.0)
    round_to_nearest_five_cents(tax) * quantity
  end

  def total_price
    (price * quantity) + total_tax
  end

  private

  def round_to_nearest_five_cents(amount)
    (amount * 20).ceil / 20.0
  end
end
