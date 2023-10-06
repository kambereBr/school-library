require_relative 'nameable'

class Person < Nameable
  attr_reader :id, :rental
  attr_accessor :age, :name

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def rental=(rental)
    @rental.push(rental)
  end

  private

  def of_age?
    @age >= 18
  end
end
