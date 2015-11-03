
Purchaser.destroy_all
Farmer.destroy_all

Purchaser.create(
  name:     "Phil",
  email:    "phil@ga.co",
  password: "123",
  password_confirmation: "123"
)

Purchaser.create(
  name:     "Mike",
  email:    "mk@mk-raps.co",
  password: "123",
  password_confirmation: "123"
)

Farmer.create(
  name:          "Farmer John",
  email:         "fj@farmers-only.com",
  business_name: "FJ industries",
  postal_code:   90801,
  password:      "123",
  password_confirmation: "123"
)

Farmer.create(
  name:          "Farmer Bob",
  email:         "fb@farmers-only.com",
  business_name: "Bob Grows Toma-toes",
  postal_code:   90210,
  password:      "123",
  password_confirmation: "123"
)
