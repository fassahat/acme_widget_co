# Acme Widget Co – Basket Proof of Concept

This is a proof of concept implementation of Acme Widget Co’s sales basket system.  
It models a product catalog, delivery charge rules, and promotional offers in a **clean, extensible, and testable way**.

---

## Design Goals

- **Separation of Concerns**
  - `Basket` orchestrates items, totals, and applies rules.
  - `Catalog` defines products and prices.
  - `DeliveryRule` and `OfferRule` subclasses encapsulate pricing logic.

- **Dependency Injection**
  - `Basket` accepts a catalog, delivery rule, and list of offers at initialization.
  - Makes swapping or testing rules easy.

- **Strategy Pattern**
  - Delivery rules and offers implement an `apply` method.
  - New business rules can be added without modifying `Basket`.

- **Extensibility**
  - Add new offers or delivery schemes by subclassing `OfferRule` or `DeliveryRule`.
  - Existing code does not need modification.

- **Testability**
  - Unit tests for rules.
  - Integration tests verify total calculations with offers and delivery.

---

## Implementation

### Core Classes

- `Basket` – main entry point, tracks items and calculates totals.
- `Catalog` – defines available products and their prices.
- `DeliveryRule` (abstract) – base for delivery charge strategies.
- `DeliveryStandard` – implements Acme’s delivery charges.
- `OfferRule` (abstract) – base for promotional strategies.
- `OfferRedWidgetHalfPrice` – implements “buy one Red Widget, get the second half price”.

### Products Catalog

| Code | Name          | Price   |
|------|---------------|---------|
| R01  | Red Widget    | $32.95  |
| G01  | Green Widget  | $24.95  |
| B01  | Blue Widget   | $7.95   |

---

## Example Usage

```ruby
require_relative "config/initializer"

basket = Basket.new(
  catalog: Catalog::PRODUCTS,
  delivery_rule: DeliveryStandard.new,
  offers: [OfferRedWidgetHalfPrice.new]
)

basket.add("B01")
basket.add("G01")
puts basket.total # => 37.85
