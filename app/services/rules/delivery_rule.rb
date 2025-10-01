# frozen_string_literal: true

# Abstract base class for delivery pricing rules.
class DeliveryRule
  def apply(subtotal)
    raise NotImplementedError
  end
end
