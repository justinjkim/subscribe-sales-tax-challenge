# frozen_string_literal: true

module TaxCalculators
  class BasicSalesTaxCalculator
    attr_reader :rate

    def initialize
      @rate = 10
    end
  end
end
