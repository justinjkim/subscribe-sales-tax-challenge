# frozen_string_literal: true

require_relative '../lib/receipt'

RSpec.describe Receipt do
  let(:items1) do
    [
      { name: 'book', price: 12.49, quantity: 2, category: :book, imported: false },
      { name: 'music CD', price: 14.99, quantity: 1, category: :other, imported: false },
      { name: 'chocolate bar', price: 0.85, quantity: 1, category: :food, imported: false },
    ]
  end
  let(:receipt1) { Receipt.new(items1) }

  let(:items2) do
    [
      { name: 'imported box of chocolates', price: 10.00, quantity: 1, category: :food, imported: true },
      { name: 'imported bottle of perfume', price: 47.50, quantity: 1, category: :other, imported: true },
    ]
  end
  let(:receipt2) { Receipt.new(items2) }

  let(:items3) do
    [
      { name: 'imported bottle of perfume', price: 27.99, quantity: 1, category: :other, imported: true },
      { name: 'bottle of perfume', price: 18.99, quantity: 1, category: :other, imported: false },
      { name: 'packet of headache pills', price: 9.75, quantity: 1, category: :medical, imported: false },
      { name: 'imported boxes of chocolates', price: 11.25, quantity: 3, category: :food, imported: true },
    ]
  end
  let(:receipt3) { Receipt.new(items3) }

  describe '#generate' do
    it 'outputs correct format' do
      expect { receipt1.generate }.to(
        output(
          "2 book: 24.98\n" \
          "1 music CD: 16.49\n" \
          "1 chocolate bar: 0.85\n" \
          "Sales Taxes: 1.50\n" \
          "Total: 42.32\n"
        ).to_stdout)

      expect { receipt2.generate }.to(
        output(
          "1 imported box of chocolates: 10.50\n" \
          "1 imported bottle of perfume: 54.65\n" \
          "Sales Taxes: 7.65\n" \
          "Total: 65.15\n"
        ).to_stdout)

      expect { receipt3.generate }.to(
        output(
          "1 imported bottle of perfume: 32.19\n" \
          "1 bottle of perfume: 20.89\n" \
          "1 packet of headache pills: 9.75\n" \
          "3 imported boxes of chocolates: 35.55\n" \
          "Sales Taxes: 7.90\n" \
          "Total: 98.38\n"
        ).to_stdout)
    end
  end
end
