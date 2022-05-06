# frozen_string_literal:true

class Client < ApplicationRecord
  validates :name, presence: true

  has_many :invoices, dependent: :nullify
end
