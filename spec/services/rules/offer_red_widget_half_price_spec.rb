# frozen_string_literal: true

require 'spec_helper'

# Mock catalog so tests are self-contained
module Catalog
  PRODUCTS = {
    'R01' => { name: 'Red Widget', price: 32.95 }
  }.freeze
end

RSpec.describe OfferRedWidgetHalfPrice do
  subject(:rule) { described_class.new }

  describe '#apply' do
    it 'applies no discount when there are no red widgets' do
      expect(rule.apply([], 0.0)).to eq(0.0)
      expect(rule.apply(['B01'], 10.0)).to eq(10.0)
    end

    it 'applies no discount with only one red widget' do
      subtotal = Catalog::PRODUCTS['R01'][:price]
      expect(rule.apply(['R01'], subtotal)).to eq(subtotal)
    end

    it 'applies half price on the second red widget' do
      subtotal = 2 * Catalog::PRODUCTS['R01'][:price]
      expected = subtotal - (Catalog::PRODUCTS['R01'][:price] / 2.0)
      expect(rule.apply(%w[R01 R01], subtotal)).to eq(expected)
    end

    it 'applies discount once for three red widgets' do
      subtotal = 3 * Catalog::PRODUCTS['R01'][:price]
      expected = subtotal - (Catalog::PRODUCTS['R01'][:price] / 2.0)
      expect(rule.apply(%w[R01 R01 R01], subtotal)).to eq(expected)
    end

    it 'applies discount twice for four red widgets' do
      subtotal = 4 * Catalog::PRODUCTS['R01'][:price]
      expected = subtotal - (2 * (Catalog::PRODUCTS['R01'][:price] / 2.0))
      expect(rule.apply(%w[R01 R01 R01 R01], subtotal)).to eq(expected)
    end
  end
end
