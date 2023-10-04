require "./app/models/person.rb"
require "./app/models/capitalizeDecorator.rb"
require "./app/models/trimmerDecorator.rb"

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name