class Rental
  attr_accessor :date, :person, :book

  def initialize(person, book, date)
    @date = date
    @person = person
    person.rentals << self
    @book = book
    book.rentals << self
  end
end
