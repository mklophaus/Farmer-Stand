
Product.destroy_all
Order.destroy_all
Purchaser.destroy_all
Farmer.destroy_all


p1 = Purchaser.create(
  name:     "Mike",
  email:    "mike@g.com",
  password: "123",
  password_confirmation: "123"
)

p2 = Purchaser.create(
  name:     "Phil",
  email:    "phil@ga.co",
  password: "123",
  password_confirmation: "123"
)

p3 = Purchaser.create(
  name:     "Mike",
  email:    "mk@mk-raps.co",
  password: "123",
  password_confirmation: "123"
)

f1 =Farmer.create(
  name:          "Farmer John",
  email:         "fj@farmers-only.com",
  business_name: "FJ industries",
  postal_code:   90801,
  password:      "123",
  password_confirmation: "123"
)

f2 = Farmer.create(
  name:          "Farmer Bob",
  email:         "fb@farmers-only.com",
  business_name: "Bob Grows Toma-toes",
  postal_code:   90210,
  password:      "123",
  password_confirmation: "123"
)

tomatos = f1.products.create(
  name:     "Tomato",
  category: "Vegetable",
  price: 12.5,
  quantity: 100,
  taste_description: "Red and sweet"
)

oranges = f1.products.create(
  name:     "Orange",
  category: "Fruit",
  price: 1.5,
  quantity: 400,
  taste_description: "Great!"
)

apples = f2.products.create(
  name:     "Apple",
  category: "Fruit",
  price: 4,
  quantity: 200,
  taste_description: "Okay...."
)

onions = f2.products.create(
  name:     "Onions",
  category: "Vegetable",
  price: 1,
  quantity: 50,
  taste_description: "Meh."
)

order234 = p1.orders.create(
  number: "2342134",
  delivery_location: "123 Maple Ave., Los Angeles, 90034"
)

order523 = p2.orders.create(
  number: "5234652",
  delivery_location: "234 Broadway, Los Angeles, CA, 90031"
)

order234.products << [tomatos, apples]
order523.products << oranges
