# frozen_string_literal:true

10.times do |n|
  Invoice.create(name: "Cool Invoice #{n + 1}")
end
