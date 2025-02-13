# frozen_string_literal: true

class TaxCalculatorFactory
  EXEMPT_FROM_BASIC_SALES_TAX_CATEGORIES = [:book, :food, :medical]

  def self.for_item(category:, imported:)
    calculators = []
    calculators << BasicSalesTaxCalculator.new unless EXEMPT_CATEGORIES.include?(category)
    calculators << ImportTaxCalculator.new if imported
    calculators
  end
end
