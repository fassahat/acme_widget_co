# frozen_string_literal: true

# Standard delivery charge rule for Acme Widget Co.
class DeliveryStandard < DeliveryRule
  def apply(subtotal)
    if subtotal < 50
      4.95
    elsif subtotal < 90
      2.95
    else
      0.0
    end
  end
end
