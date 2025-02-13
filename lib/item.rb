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
end
