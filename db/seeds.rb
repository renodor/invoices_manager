# frozen_string_literal:true

User.destroy_all
Invoice.destroy_all
LineItem.destroy_all

user = User.create!(
  email: 'renaud.dor@gmail.com',
  password: 'Azerty123',
  first_name: 'Renaud',
  last_name: 'Dor',
  address1: '10 Rue de par ici',
  zipcode: '00000',
  city: 'Cool City',
  country: 'France',
  website: 'www.renodor.co',
  siren: '803 043 918',
  bic: 'AAAAAAAA',
  iban: 'FR76 0000 0000 0000 0000 0000 000'
)

client = Client.create!(
  name: 'Cool Client',
  address1: '10 Rue de là bas',
  zipcode: '00000',
  city: 'Cool City',
  country: 'France'
)

5.times do |n|
  invoice = Invoice.create!(
    name: "Cool Invoice #{n + 1}",
    number: "#{Time.current.year}#{n + 1}",
    date: DateTime.current,
    title: 'Services de développement web',
    user: user,
    client: client
  )

  2.times do |i|
    LineItem.create!(
      description: "Cool Line Item #{i + 1}",
      quantity: i + 1,
      unit_price: rand(0..100.00),
      invoice: invoice
    )
  end
end
