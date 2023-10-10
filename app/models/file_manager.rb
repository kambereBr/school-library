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
    save_books
    puts 'Books saved !'
  rescue StandardError => e
    puts "Error saving Data : #{e.message}"
  end

  def load_data
    load_books
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

  private

  def load_books
    return unless File.exist?(BOOKS_PATH)

    json_to_str = File.read(BOOKS_PATH)
    @books = JSON.parse(json_to_str).map do |book_data|
      Book.new(book_data['title'], book_data['author'])
    end
  rescue StandardError => e
    puts "Error loading Books : #{e.message}"
  end
end
