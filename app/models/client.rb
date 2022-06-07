# frozen_string_literal:true

class Client < ApplicationRecord
  include SoftDeletable

  validates :name, presence: true

  belongs_to :user
  has_many :invoices, dependent: :destroy
end
