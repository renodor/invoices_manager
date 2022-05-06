# frozen_string_literal:true

class Invoice < ApplicationRecord
  belongs_to :user
  belongs_to :client, optional: true

  validates :name, :number, presence: true

  scope :ordered, -> { order(id: :desc) }
end
