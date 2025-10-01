# frozen_string_literal: true

require 'spec_helper'

RSpec.describe DeliveryStandard do
  subject(:rule) { described_class.new }

  describe '#apply' do
    it 'charges $4.95 for orders under $50' do
      expect(rule.apply(49.99)).to eq(4.95)
      expect(rule.apply(10.00)).to eq(4.95)
    end

    it 'charges $2.95 for orders between $50 and $89.99' do
      expect(rule.apply(50.00)).to eq(2.95)
      expect(rule.apply(89.99)).to eq(2.95)
    end

    it 'is free for orders of $90 or more' do
      expect(rule.apply(90.00)).to eq(0.0)
      expect(rule.apply(150.00)).to eq(0.0)
    end
  end
end
