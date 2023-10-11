require 'json'
require_relative 'book'

class FileManager
  attr_accessor :books, :person, :rentals, :files

  BOOKS_PATH = 'app/storage/books_json.json'.freeze
  PERSON_PATH = 'app/storage/person_json.json'.freeze
  RENTALS_PATH = 'app/storage/rentals_json.json'.freeze

  def initialize
    @books = []
    @person = []
    @rentals = []
    @files = [BOOKS_PATH, PERSON_PATH, RENTALS_PATH]
    create_files(@files)
  end

  def create_files(files)
    files.each do |file|
      unless File.exist?(file)
        File.open(file, 'w')
        File.write(file, [], mode: 'a')
      end
    end
  end

  def save_data
    save_person
    puts 'Person saved !'
    save_books
    puts 'Books saved !'
    save_rental
    puts 'Rental saved !'
  rescue StandardError => e
    puts "Error saving Data : #{e.message}"
  end

  def save_books
    temp_array = []
    @books.each do |book|
      temp_array.push({
                        'title' => book.title,
                        'author' => book.author
                      })
    end
    File.write(BOOKS_PATH, temp_array.to_json)
  end

  def load_books
    return unless File.exist?(BOOKS_PATH)

    json_to_str = File.read(BOOKS_PATH)
    @books = JSON.parse(json_to_str).map do |book_data|
      Book.new(book_data['title'], book_data['author'])
    end
  rescue StandardError => e
    puts "Error loading Books : #{e.message}"
  end

  def save_person
    temp_array = []
    @person.each do |person|
      temp_array.push({
                        'age' => person.age,
                        'name' => person.name,
                        'id' => person.id
                      })
    end
    File.write(PERSON_PATH, temp_array.to_json)
  end

  def load_person
    return unless File.exist?(PERSON_PATH)

    json_to_str = File.read(PERSON_PATH)
    @person = JSON.parse(json_to_str).map do |person_data|
      person = Person.new(nil, nil)
      person.age = person_data['age']
      person.name = person_data['name']
      person.id = person_data['id']
      person
    end
  rescue StandardError => e
    puts "Error loading Person : #{e.message}"
  end

  def save_rental
    temp_array = []
    @rentals.each do |rental|
      temp_array.push({
                        'person' => {
                          'age' => rental.person.age,
                          'name' => rental.person.name,
                          'id' => rental.person.id
                        },
                        'book' => {
                          'title' => rental.book.title,
                          'author' => rental.book.author
                        },
                        'date' => rental.date
                      })
    end
    File.write(RENTALS_PATH, temp_array.to_json)
  end

  def load_rental
    return unless File.exist?(RENTALS_PATH)

    json_to_str = File.read(RENTALS_PATH)
    @rentals = JSON.parse(json_to_str).map do |rental_data|
      person = Person.new(rental_data['person']['age'], rental_data['person']['name'])
      person.id = rental_data['person']['id']
      book = Book.new(rental_data['book']['title'], rental_data['book']['author'])
      rental = Rental.new(person, book, rental_data['date'])
      rental
    end
    # rescue StandardError => e
    #   puts "Error loading Rental : #{e.message}"
  end
end
