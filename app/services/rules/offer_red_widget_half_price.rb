# frozen_string_literal: true

# Offer rule: Buy one red widget, get the second half price.
class OfferRedWidgetHalfPrice < OfferRule
  def apply(items, subtotal)
    red_count = items.count('R01')
    discount = (red_count / 2) * (Catalog::PRODUCTS['R01'][:price] / 2.0)
    subtotal - discount
  end
end
