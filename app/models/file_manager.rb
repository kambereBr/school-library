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
                        'id' => person.id,
                      })
    end
    File.write(PERSON_PATH, temp_array.to_json)
  end
  
  
  def load_person
    return unless File.exist?(PERSON_PATH)

    json_to_str = File.read(PERSON_PATH)
    @person = JSON.parse(json_to_str).map do |person_data|
      Person.new(person_data['age'], person_data['name'])
    end
  rescue StandardError => e
    puts "Error loading Person : #{e.message}"
  end

  def save_rental
    temp_array = []
    books_array = []
    @rentals.each do |rental|
      rental.book.rentals.each do |book| 
        books_array.push({
          'title' => book.book.title,
          'author' => book.book.author,
        })
        end
      temp_array.push({
                        'person' => {
                          'age' => rental.person.age,
                          'name' => rental.person.name,
                          'id' => rental.person.id,
                        },
                        'book' => books_array,
                        'date' => rental.date,
                      })
    end
    File.write(RENTALS_PATH, temp_array.to_json)
  end

  def load_rental
    return unless File.exist?(RENTALS_PATH)

   
    json_to_str = File.read(RENTALS_PATH)
    @rentals = JSON.parse(json_to_str).map do |rental_data|
      # book = @books.find { |book| book.title == rental_data["book"]["title"] }
      # person = @person.find { |per| per.id == rental_data["person"]["id"] }
      puts rental_data["person"]
      puts rental_data["book"]
      Rental.new(rental_data["person"], rental_data["book"], rental_data["date"])
    end
  # rescue StandardError => e
  #   puts "Error loading Rental : #{e.message}"
  end  
end
