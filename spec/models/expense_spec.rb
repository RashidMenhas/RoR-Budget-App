require 'rails_helper'

RSpec.describe Expense, type: :model do
  before :each do
    @user = User.create(name: 'RashidMenhas')
    @transaction = @user.expenses.build(author: @user, name: 'Bat', amount: 100)
  end

  context 'This Testing validations' do
    it 'is valide with all valid attributes' do
      expect(@transaction).to be_valid
    end

    it 'is not valid without transaction name' do
      @transaction.name = nil
      expect(@transaction).to_not be_valid
    end

    it 'is not valid without transaction amount' do
      @transaction.amount = nil
      expect(@transaction).to_not be_valid
    end

    it 'has amount, which is numeric data type' do
      expect(@transaction.amount).to be_kind_of Numeric
    end
  end

  context 'This Testing associations' do
    it 'is belongs to user' do
      assoc = Expense.reflect_on_association(:author)
      expect(assoc.macro).to eq :belongs_to
    end
    it 'is has_many association with group_expenses' do
      assoc = Expense.reflect_on_association(:group_expenses)
      expect(assoc.macro).to eq :has_many
    end
  end
end
