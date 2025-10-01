# frozen_string_literal: true

# Basket for total calculation
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
    delivery = @delivery_rule.apply(subtotal)
    (subtotal + delivery).floor(2)
  end
end
