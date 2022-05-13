# frozen_string_literal:true

User.destroy_all
Invoice.destroy_all
LineItem.destroy_all

user = User.create!(
  username: 'Batman',
  email: 'batman@gmail.com',
  password: 'Azerty123',
  first_name: 'Bruce',
  last_name: 'Wayne',
  address1: '10 Rue de par ici',
  zipcode: '00000',
  city: 'Cool City',
  country: 'France',
  website: 'www.website.co',
  siren: '000 000 000',
  bic: 'AAAAAAAA',
  iban: 'FR76 0000 0000 0000 0000 0000 000'
)

5.times do |n|
  Client.create!(
    name: "Cool Client #{n + 1}",
    address1: "#{n + 1} Rue de là bas",
    zipcode: '00000',
    city: 'Cool City',
    country: 'France',
    user: user
  )
end

5.times do |n|
  invoice = Invoice.create!(
    number: "#{Time.current.year}#{n + 1}",
    date: DateTime.current,
    title: 'Services de développement web',
    user: user,
    client: Client.first
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
