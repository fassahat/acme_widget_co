# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Basket do
  subject(:basket) do
    described_class.new(
      catalog: Catalog::PRODUCTS,
      delivery_rule: DeliveryStandard.new,
      offers: [OfferRedWidgetHalfPrice.new]
    )
  end

  describe '#total' do
    it 'calculates correct total for B01, G01' do
      basket.add('B01')
      basket.add('G01')
      expect(basket.total).to eq(37.85)
    end

    it 'calculates correct total for R01, R01' do
      basket.add('R01')
      basket.add('R01')
      expect(basket.total).to eq(54.37)
    end

    it 'calculates correct total for R01, G01' do
      basket.add('R01')
      basket.add('G01')
      expect(basket.total).to eq(60.85)
    end

    it 'calculates correct total for B01, B01, R01, R01, R01' do
      basket.add('B01')
      basket.add('B01')
      basket.add('R01')
      basket.add('R01')
      basket.add('R01')
      expect(basket.total).to eq(98.27)
    end
  end
end
