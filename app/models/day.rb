# frozen_string_literal:true

class Day < ApplicationRecord
  belongs_to :invoice

  validates :date, presence: true
  validates :worked, inclusion: { in: [true, false] }
  validates :date, uniqueness: { scope: :invoice_id }

  scope :ordered, -> { order(date: :asc) }
end
