# frozen_string_literal: true

require_relative '../lib/tax_calculator_factory'

RSpec.describe TaxCalculatorFactory do
  describe '.for_item' do
    context 'with exempt non-imported item' do
      subject { described_class.for_item(category: :book, imported: false) }
      it { expect(subject).to be_empty }
    end

    context 'with exempt imported item' do
      subject { described_class.for_item(category: :food, imported: true) }
      it { expect(subject.map(&:class)).to eq([TaxCalculators::ImportTaxCalculator]) }
    end

    context 'with non-exempt imported item' do
      subject { described_class.for_item(category: :other, imported: true) }
      it { expect(subject.map(&:class)).to eq([TaxCalculators::BasicSalesTaxCalculator, TaxCalculators::ImportTaxCalculator]) }
    end
  end
end
