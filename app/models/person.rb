require_relative 'nameable'

class Person < Nameable
  attr_accessor :id, :age, :name, :rentals, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals.push(rental)
  end

  def description
    "[#{self.class.name}] Name: #{name}, ID: #{id}, Age: #{age}"
  end

  def rentals_description
    description = ''
    if @rentals.length.positive?
      @rentals.each do |rental|
        description.concat("Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}\n")
      end
    else
      description = 'No record found'
    end
    description
  end

  def filter_user_rentals(all_rentals, user_id)
    array_rentals = []
    all_rentals.each do |rental|
      array_rentals.push(Rental.new(rental.person, rental.book, rental.date)) if rental.person.id == user_id
    end
    array_rentals
  end

  private

  def of_age?
    @age >= 18
  end
end
