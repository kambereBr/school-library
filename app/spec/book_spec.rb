require_relative '../models/book'
require_relative '../models/person'
require_relative '../models/rental'

describe Book do
  let(:new_book) { Book.new('The Gatsby', 'F. Scott Fitzgerald') }
  let(:new_person) { Person.new(22, 'Javier') }
  it 'Should Initialize new Book instance with title' do
    expect(new_book.title).to eq('The Gatsby')
    expect(new_book.author).to eq('F. Scott Fitzgerald')
  end

  it 'Should add rentals to the rental array' do
    rental = Rental.new(new_person, new_book, '10/12/2023')
    new_book.add_rental(rental)
    expect(new_book.rentals[0]).to eql(rental)
  end
end
