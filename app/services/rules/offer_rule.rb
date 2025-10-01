# frozen_string_literal: true

# Abstract base class for promotional offer rules.
class OfferRule
  def apply(items, subtotal)
    raise NotImplementedError
  end
end
