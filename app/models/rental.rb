class Rental
  attr_accessor :date, :person, :book

  def initialize(person, book, date)
    @date = date
    @person = person
    person.rental << self
    @book = book
    book.rental << self
  end
end
