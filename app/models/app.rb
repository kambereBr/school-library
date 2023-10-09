require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

module Library
  # Warnig method that displays a wrong message passed
  def wrong_number_msg
    puts "\n*** [WARNING] You passed a wrong number ***"
    puts "\n"
  end

  # method that checks whether option number is valid or not
  def valid_number?(range, choice)
    unless range.include?(choice)
      wrong_number_msg
      return false
    end
    true
  end

  # Method that displays customized success message
  def success_msg(label)
    puts "\n#{label} Created successfully"
    puts "\n"
  end

  # Method that displays all recorded books
  # list_book: array of books
  # show_index: true|false
  def get_list_books(list_book, show_index)
    puts "\nAll Books:"
    if list_book.length.positive?
      list_book.each.with_index do |book, index|
        book_index = show_index ? "#{index})" : ''
        puts "#{book_index} Title: #{book.title},  Author: #{book.author}"
      end
    else
      puts 'No record found'
    end
    puts "\n"
  end

  # Method that displays all recorded person
  # list_person: array of person
  # show_index: true|false
  def get_list_person(list_person, show_index)
    puts "\nAll People:"
    if list_person.length.positive?
      list_person.each.with_index do |people, index|
        person_index = show_index ? "#{index})" : ''
        puts "#{person_index} #{people.description}"
      end
    else
      puts 'No record found'
    end
    puts "\n"
  end

  # Method that displays all user rental
  # list_person: array of person
  def get_user_rental(list_person)
    puts 'All rentals for a given person id'
    id = gets.chomp
    list_person.each do |person|
      person.rentals_description if person.id == id.to_i
    end
    puts "\n"
  end

  # Method that helps to add new person to the array
  # list_person: array of person
  # choice: string - option value
  def add_new_person(list_person, choice)
    return unless valid_number?(%w[1 2], choice)

    puts 'Age:'
    age = gets.chomp
    puts 'Name:'
    name = gets.chomp
    case choice
    when '1' then create_student(age, name, list_person)
    when '2' then create_teacher(age, name, list_person)
    end
    success_msg('Person')
  end

  def create_student(age, name, list_person)
    student = Student.new(nil, age, name)
    puts 'Has Parent Permission? [Y/N]:'
    par_permission = gets.chomp
    student.parent_permission = (par_permission.upcase == 'Y')
    list_person.push(student)
  end

  def create_teacher(age, name, list_person)
    teacher = Teacher.new(nil, age, name)
    puts 'Specialization:'
    teacher.specialization = gets.chomp
    list_person.push(teacher)
  end

  # Method that helps to add new book to the array
  # list_book: array of books
  def add_new_book(list_book)
    book = Book.new(nil, nil)
    puts 'title:'
    book.title = gets.chomp
    puts 'Author:'
    book.author = gets.chomp
    list_book.push(book)
    success_msg('Book')
  end

  # Method that helps to add new rental to the array
  # list_rental: array of rentals
  # list_book: array of books
  # list_person: array of person
  def create_new_rental(list_rental, list_book, list_person)
    puts 'Select a book from the following list by number'
    get_list_books(list_book, true)
    book_index = gets.chomp
    puts 'Select a person from the following list by number (not id)'
    get_list_person(list_person, true)
    person_index = gets.chomp

    if !list_person[person_index.to_i].nil? && !list_book[book_index.to_i].nil?
      rental = Rental.new(list_person[person_index.to_i], list_book[book_index.to_i], nil)
      puts 'Date:'
      rental_date = gets.chomp
      rental.date = rental_date
      success_msg('Rental')
      list_rental.push(rental)
    else
      wrong_number_msg
    end
  end
end
