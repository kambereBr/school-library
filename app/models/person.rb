require_relative 'nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :age, :name, :rentals, :parent_permission

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
    if @rentals.length.positive?
      @rentals.each do |rental|
        puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}"
      end
    else
      puts 'No record found'
    end
  end

  private

  def of_age?
    @age >= 18
  end
end
