current_user = nil
return_message = ''
MAIN_MENU_COMMANDS = ["Sign In","Create Account", "Add a Residence", "Find My Polling Place", "Review My Polling Place", "My Polling Place Reviews", "Delete My Last Review", "Sign Out", "Exit"]

i = 1
while i

system "clear"

  #resets return_message
  if return_message
    puts return_message
    return_message = ""
  end

  #outputs current user information to be posted on main menu.

  #Iterates through the Main Menu.
  puts "You are on Main Menu. Enter a command:"
  MAIN_MENU_COMMANDS.each do |command|
    puts command
  end

  result = gets.chomp.downcase
  case result

  when "exit"
    exit #SEEYA.

  when "sign in"


  when "create account"
    system "clear"
    puts "Please Enter First Name: "
    first_name = gets.chomp
    puts "Please Enter Last Name: "
    last_name = gets.chomp
    puts "Email: "
    email = gets.chomp
    puts "Age: "
    age = gets.chomp
    current_user = User.create(first_name: first_name, last_name: last_name, email: email, age: age)
    system "clear"
    return_message =  "Account successfully created. Welcome: #{first_name} #{last_name}. Your user id is: #{current_user.id}."

  when "add a residence"
    system "clear"
    if current_user
      puts "Please enter your street number: "
      street_number = gets.chomp
      puts "Street Name: "
      street_name = gets.chomp
      puts "Zip Code: "
      zip_code = gets.chomp
      current_user.create_residence(street_number: street_number, street_name: street_name, zip_code: zip_code, is_primary: true)
      system "clear"
      return_message =  "Residence added."
    else
      return_message = "Please sign in or create a current account to add a residence"
    end

  when "find my polling place"
    system "clear"
    if current_user
      if current_user.primary_residence
        polling_place_id = current_user.find_current_polling_place
        polling_place = PollingPlace.find_by(id: polling_place_id)
        #current_polling_place = polling_place

        return_message =
        "\n
        PlaceName: #{polling_place.name}\n
        Address: #{polling_place.address}\n
        CouncilDistrict: #{polling_place.council_district}\n
        Avg Wait Time (mins): #{polling_place.average_wait_time} \n
        Avg Service Rating(1-10): #{polling_place.average_service_rating}
        "

      else
        return_message =  "No primary residence found. Please add a residence."
      end
    else
      return_message = "You are NOT A USER you dont GET to find a polling place. Create an account."
    end

  when "review my polling place"
    system "clear"
    if  current_user && current_user.find_current_polling_place
      puts "Please enter a title: "
      title = gets.chomp
      puts "Message Body: "
      message = gets.chomp
      puts "Please estimate the wait time in minutes: "
      wait_time = gets.chomp
      puts "Please rate the service of the pollworkers on a scale of 1 to 10: "
      service = gets.chomp
      current_user.create_review(title: title, message: message, wait_time: wait_time, service: service)
      system "clear"
      return_message =  "Review created."
    else
      system "clear"
      return_message = "You don't have an account OR do not currently have a polling place via a residence. Please make sure you have both and try again."
    end

  when "my polling place reviews"
    system "clear"
    if current_user
      # user_reviews = current_user.reviews
      current_user.reviews.reload
      current_user.reviews.each do |rvw|
        return_message += "\n Polling Place: #{rvw.polling_place.name} \n Title: #{rvw.title}\n Message: #{rvw.message} \n Wait Time(in minutes): #{rvw.wait_time} \n Service Rating(1-10): #{rvw.service}\n\n"
      end
    else
      return_message = "You need to be logged in to see your reviews."
    end

  when "delete my last review"
    system "clear"
    if current_user
      current_user.reviews.last.delete
      current_user.save
      system "clear"
      return_message = "Removed last Review."
    else
      return_message = "You need to be logged in to see your reviews."
    end

  when "sign out"
    current_user = nil
  end
end
