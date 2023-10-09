require_relative 'app/models/launcher'

# The entry point method
def main
  puts "\nWelcome to School Library App!"
  puts "\n"
  all_books = []
  all_person = []
  all_rentals = []

  loop do
    choice = Launcher.new.option_list
    Launcher.new.use_cases(choice, all_books, all_person, all_rentals)
  end
end

main
