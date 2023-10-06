class Rental
  attr_accessor :date
  attr_accessor :person, :book

  def initialize(person, book, date)
    @date = date
    @person = person
    person.rental << self
    @book = book
    book.rental << self
  end
end
