# frozen_string_literal: true

require_relative '../lib/item.rb'

RSpec.describe Item do
  describe '#total_tax and #total_price' do
    context 'with non-imported exempt item' do
      let(:item) do
        Item.new(
          name: 'book',
          price: 12.49,
          quantity: 2,
          category: :book,
          imported: false,
        )
      end

      it { expect(item.total_tax).to eq(0.0) }
      it { expect(item.total_price).to eq(24.98) }
    end

    context 'with imported exempt item' do
      let(:item) do
        Item.new(
          name: 'imported chocolate',
          price: 10.00,
          quantity: 1,
          category: :food,
          imported: true,
        )
      end

      it { expect(item.total_tax).to eq(0.50) }
      it { expect(item.total_price).to eq(10.50) }
    end

    context 'with non-imported non-exempt item' do
      let(:item) do
        Item.new(
          name: 'music CD',
          price: 14.99,
          quantity: 1,
          category: :other,
          imported: false,
        )
      end

      it { expect(item.total_tax).to eq(1.50) }
      it { expect(item.total_price).to eq(16.49) }
    end
  end
end
