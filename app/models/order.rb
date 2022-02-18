# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :customer
  has_one :shipping_address, as: :addressable, class_name: 'ShippingAddress', dependent: :destroy
  has_many :line_items, dependent: :destroy

  validates :number, :date, :payment_type, :line_items, :shipping_address, presence: true
  validates :number, uniqueness: true

  enum payment_type: { cash: 'cash', credit_card: 'credit_card', check: 'check', other: 'other' }

  accepts_nested_attributes_for :line_items
end
