require_relative '../models/capitalize_decorator'

describe '#CapitalizeDecorator' do
  let(:person) { Person.new(22, 'javiera') }
  let(:new_capitalize) { CapitalizeDecorator.new(person) }

  it 'correct_name should to capitalize name' do
    expect(new_capitalize.correct_name).to eq('Javiera')
  end
end
