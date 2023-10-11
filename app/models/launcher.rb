require_relative 'app'
require_relative 'file_manager'

class Launcher
  include Library
  attr_accessor :file_manager, :books, :person, :rentals

  def initialize
    @file_manager = FileManager.new
    @books = @file_manager.load_books
    @person = @file_manager.load_person
    @rentals = @file_manager.load_rental
  end

  # Print list of Main options
  def option_list
    puts 'Please choose an option by intering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    gets.chomp
  end

  # Method that manages main option
  # all_rentals: array of rentals
  # all_books: array of books
  # all_person: array of person
  # choice: string - option value
  # rubocop:disable Metrics/CyclomaticComplexity
  def use_cases(choice, all_books, all_person, all_rentals)
    case choice
    when '1' then get_list_books(all_books, false)
    when '2' then get_list_person(all_person, false)
    when '3'
      puts 'Do you want to create a student (1) or a teacher (2) [Input the number] :'
      choice = gets.chomp
      add_new_person(all_person, choice)
    when '4' then add_new_book(all_books)
    when '5' then create_new_rental(all_rentals, all_books, all_person)
    when '6' then get_user_rental(all_person)
    when '7'
      @file_manager.books = all_books
      @file_manager.person = all_person
      @file_manager.rentals = all_rentals
      @file_manager.save_data
      sleep 3
      exit
    else
      wrong_number_msg
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end
