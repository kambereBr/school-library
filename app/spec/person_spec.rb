require_relative '../models/person'
require_relative '../models/book'
require_relative '../models/rental'

describe '#Person' do
  let(:new_person) { Person.new(22, 'Javier') }
  let(:new_person2) { Person.new(26, 'Obiba') }
  let(:new_book) { Book.new('The Gatsby', 'F. Scott Fitzgerald') }


  it 'Should Create a person' do
    expect(new_person.name).to eq('Javier')
    expect(new_person.age).to eq(22)
  end

  it 'can_use_services should return true when age is >= 18' do
    expect(new_person.can_use_services?).to eq(true)
  end

  it 'correct_name should return the name' do
    expect(new_person.correct_name).to eq('Javier')
  end

  it 'description should return return classname, Name, ID, Age' do
    new_person.id = 123
    expect(new_person.description).to eq('[Person] Name: Javier, ID: 123, Age: 22')
  end

  it 'add_rental should push rental to rentals' do
    rental = Rental.new(new_person, new_book, '10/12/2023')
    new_person.add_rental(rental)
    expect(new_person.rentals[0]).to eql(rental)
  end

  it 'rentals_description should return details of each rental' do
    Rental.new(new_person, new_book, '10/12/2023')

    expect(new_person.rentals_description).to eq("Date: 10/12/2023, Book 'The Gatsby' by F. Scott Fitzgerald\n")
  end
end
