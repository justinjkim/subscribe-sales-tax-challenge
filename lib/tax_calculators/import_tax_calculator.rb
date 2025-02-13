# frozen_string_literal: true

module TaxCalculators
  class ImportTaxCalculator
    attr_reader :rate

    def initialize
      @rate = 5
    end
  end
end
