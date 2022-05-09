# frozen_string_literal:true

class Invoice < ApplicationRecord
  belongs_to :user
  belongs_to :client, optional: true
  has_many :line_items, dependent: :destroy

  validates :name, :number, presence: true

  scope :ordered, -> { order(id: :desc) }

  def total_price
    line_items.sum(&:total_price)
  end
end
