require_relative '../config/environment'

puts "Welcome to The App"

MAIN_MENU_COMMANDS = ["Sign In","Create Account", "Add a Residence", "Find Current Polling Place", "Create a Review", "Exit" ]
i = 2

current_user = nil

while i < 3
  if current_user
    puts "You are currently logged in as #{current_user.first_name} #{current_user.last_name}."
  end
  puts "You are on Main Menu. Enter a command:"
  MAIN_MENU_COMMANDS.each do |command|
    puts command
  end
  result = gets.chomp.downcase

  case result
  when "exit"
    exit #SEEYA.

  when "sign in"
    puts "Enter a user id number: "
    user_id = gets.chomp
    found_user = User.all.find_by(id: user_id)
    if found_user
      puts "Welcome #{found_user.first_name} #{found_user.last_name}."
      current_user = found_user
    else
       puts "No account found. Are you sure you can type. You might have to be able to type to vote in some states. Keep that in mind, please.."
    end

  when "create account"
    puts "Please Enter First Name"
      first_name = gets.chomp
    puts "Please Enter Last Name"
      last_name = gets.chomp
    puts "Email"
      email = gets.chomp
    puts "Age"
      age = gets.chomp
    current_user = User.create(first_name: first_name, last_name: last_name, email: email, age: age)
    puts "Account successfully created. Welcome: #{first_name} #{last_name}. Your user id is: #{current_user.id}."


  when "add a residence"
    if current_user
    puts "Please enter your street number: "
      street_number = gets.chomp
    puts "Street Name: "
      street_name = gets.chomp
    puts "Zip Code"
      zip_code = gets.chomp
      current_user.create_residence(street_number: street_number, street_name: street_name, zip_code: zip_code, is_primary: true)
    puts "Residence added."
  else
    puts "Please sign in or create a current account to add a residence"
  end

  when "find current polling place"
    if current_user
      if current_user.primary_residence
        puts "#{current_user.find_current_polling_place.name}"
        puts "#{current_user.find_current_polling_place.address}"
        puts "#{current_user.find_current_polling_place.council_district}"
      else
        puts "No primary residence found. Please add a residence."
      end
    else
      puts "You are NOT A USER you dont GET to find a polling place. Create an account."
    end

  when "create a review"
    if  current_user && current_user.find_current_polling_place
      puts "Please enter a title: "
      title = gets.chomp
      puts "Message Body: "
      title = gets.chomp
      puts "Please estimate the wait time in minutes: "
      wait_time = gets.chomp
      puts "Please rate the service of the pollworkers on a scale of 1 to 10."
      service = gets.chomp
      current_user.create_review(title: title, message: message, wait_time: wait_time, service: service)
      puts "Review created."
    else
      "You don't have an account OR do not currently have a polling place via a residence. Please make sure you have both and try again."
    end
  end
end
