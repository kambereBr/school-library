require_relative '../models/rental'

describe '#Rental' do
  let(:new_person) { Person.new(22, 'Javier') }
  let(:new_book) { Book.new('The Gatsby', 'F. Scott Fitzgerald') }

  it 'Should initialize new rental' do
    new_rental = Rental.new(new_person, new_book, '12/12/2020')

    expect(new_rental.date).to eq('12/12/2020')
    expect(new_rental.person).to eq(new_person)
    expect(new_rental.book).to eq(new_book)
  end
end
