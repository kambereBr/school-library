class Rental
  attr_accessor :date
  attr_reader :person, :book

  def initialize(person, book, date)
    @date = date
    @person = person
    person.rental.push(self)
    @book = book
    book.rental.push(self)
  end
end
