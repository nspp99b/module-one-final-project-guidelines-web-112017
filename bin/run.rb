require_relative '../config/environment'

puts "Welcome to The App"

COMMANDS = ["Create Account", "Add a Residence", "Find Current Polling Place", "Create a Review", "Exit"]
i = 2
while i < 3

  puts "You are on Main Menu. Enter a command:"
  COMMANDS.each do |command|
    puts command
  end
  result = gets.chomp.downcase

  case result
  when "exit"
    exit
  when "create account"
    puts "Please Enter First Name"
      first_name = gets.chomp
    puts "Please Enter Last Name"
      last_name = gets.chomp
    puts "Email"
      email = gets.chomp
    puts "Age"
      age = gets.chomp
    User.create(first_name: first_name, last_name: last_name, email: email, age: age)
  end
end
