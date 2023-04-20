class Expense < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 },
                   uniqueness: { scope: :author, message: 'You already have have an transaction with this name' }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: 'User'
  has_many :group_expenses, dependent: :destroy
  has_many :group, through: :group_expenses, dependent: :destroy
end
