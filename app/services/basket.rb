# frozen_string_literal: true

# app/services/basket.rb
class Basket
  def initialize(catalog:, delivery_rule:, offers: [])
    @catalog = catalog
    @delivery_rule = delivery_rule
    @offers = offers
    @items = []
  end

  def add(product_code)
    raise ArgumentError, "Unknown product code: #{product_code}" unless @catalog.include?(product_code)

    @items << product_code
  end

  def total
    subtotal = @items.sum { |code| @catalog[code][:price] }

    # Strategy: each offer transforms subtotal
    @offers.each do |offer|
      subtotal = offer.apply(@items, subtotal)
    end

    # Strategy: delivery charge depends on subtotal
    subtotal + @delivery_rule.apply(subtotal)
  end
end
