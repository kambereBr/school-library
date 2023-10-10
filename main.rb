require_relative 'app/models/launcher'
require_relative 'app/models/file_manager'

# The entry point method
def main
  puts "\nWelcome to School Library App!"
  puts "\n"
  launcher = Launcher.new
  all_books = launcher.books
  all_person = []
  all_rentals = []

  loop do
    choice = launcher.option_list
    launcher.use_cases(choice, all_books, all_person, all_rentals)
  end
end

main
