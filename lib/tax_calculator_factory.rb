# frozen_string_literal: true

require_relative 'tax_calculators/basic_sales_tax_calculator'
require_relative 'tax_calculators/import_tax_calculator'
class TaxCalculatorFactory
  EXEMPT_FROM_BASIC_SALES_TAX_CATEGORIES = [:book, :food, :medical]

  def self.for_item(category:, imported:)
    calculators = []
    calculators <<
      TaxCalculators::BasicSalesTaxCalculator.new unless EXEMPT_FROM_BASIC_SALES_TAX_CATEGORIES.include?(category)
    calculators << TaxCalculators::ImportTaxCalculator.new if imported
    calculators
  end
end
