# frozen_string_literal: true

# Load debugging tool
require 'byebug'

# Load any common gems, utilities, or environment setup here
# For example:
# require_relative "../lib/basket"
# require_relative "../lib/product"

# Rules
require_relative '../app/services/rules/delivery_rule'
require_relative '../app/services/rules/delivery_standard'
require_relative '../app/services/rules/offer_rule'
require_relative '../app/services/rules/offer_red_widget_half_price'

# Basket
require_relative '../app/services/basket'

# Catalog
require_relative '../app/services/catalog'
