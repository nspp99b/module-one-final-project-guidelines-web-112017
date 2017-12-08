class Menu
  attr_accessor :current_user, :return_message

  MAIN_MENU_COMMANDS = ["Sign In","Create Account", "Add a Residence", "Find My Polling Place", "Review My Polling Place", "My Polling Place Reviews", "Delete My Last Review", "Sign Out", "Exit"]

  #instantiates the menu
  def start
    #create user and messages
    @current_user = nil
    @return_message = ''
    i = 1
    while i
      clear_screen
      output_return_message
      output_current_user
      main_menu
      switchboard(get_input)
    end
  end

  def exit_program
    exit
  end

  def sign_in
    clear_screen
    user_id = get_input("Enter a user id number: ")
    found_user = User.all.find_by(id: user_id)
    if found_user
      puts "Welcome #{found_user.first_name} #{found_user.last_name}."
      @current_user = found_user
    else
      @return_message =  "No account found. Are you sure you can type? You might have to be able to type to vote in some states. Keep that in mind, please.."
      output_return_message
    end
  end

  def create_account
    clear_screen
    first_name = get_input("Please Enter First Name: ")
    last_name = get_input("Please Enter Last Name: ")
    email = get_input("Please Enter Email: ")
    age = get_input("Please Enter Age: ")
    @current_user = User.create(first_name: first_name, last_name: last_name, email: email, age: age)
    @return_message =  "Account successfully created. Welcome: #{first_name} #{last_name}. Your user id is: #{current_user.id}."
  end

  def add_a_residence
    clear_screen
    if @current_user
      street_number = get_input("Please Enter Your Street Number: ")
      street_name = get_input("Please Enter Your Street Name: ")
      zip_code = get_input("Please Enter your Zip Code: ")
      @current_user.create_residence(street_number: street_number, street_name: street_name, zip_code: zip_code, is_primary: true)
      clear_screen
      @return_message = "Residence Added"
    else
      @return_message = "Please sign in or create a current account to add a residence"
    end
  end

  def find_my_polling_place
    clear_screen
    if @current_user
        if @current_user.primary_residence
          polling_place_id = @current_user.find_current_polling_place
          polling_place = PollingPlace.find_by(id: polling_place_id)
          #current_polling_place = polling_place

          @return_message =
          "\n
          PlaceName: #{polling_place.name}\n
          Address: #{polling_place.address}\n
          CouncilDistrict: #{polling_place.council_district}\n
          Avg Wait Time (mins): #{polling_place.average_wait_time} \n
          Avg Service Rating(1-10): #{polling_place.average_service_rating}
          "
        else
          @return_message = "No primary residence found. Please add a residence."
        end
    else
      @return_message = "You are NOT A USER you dont GET to find a polling place. Create an account."
    end
  end

  def review_my_polling_place
    clear_screen
  end

  def my_polling_place_reviews

  end

  def delete_my_last_review

  end

  def sign_out

  end

  private
  def output_return_message
    if @return_message
      puts return_message
      @eturn_message = ""
    end
  end

  def output_current_user
    if @current_user
      puts "You are currently logged in as #{current_user.first_name} #{current_user.last_name}."
    end
  end

  def clear_screen
    system "clear"
  end

  def main_menu
    puts "You are on Main Menu. Enter a command:"
    MAIN_MENU_COMMANDS.each do |command|
    puts command
  end

  def get_input(query_message='')
    puts query_message
    input = gets.chomp
  end

  def switchboard(input)
    case input

    when "exit"
      self.exit_program
    when "sign in"
      self.sign_in
    when "create account"
      self.create_account
    when "add a residence"
      self.add_a_residence
    when "find my polling place"
      self.find_my_polling_place
    when "review my polling place"
      self.review_my_polling_place
    when "my polling place reviews"
      self.my_polling_place_reviews
    when "delete my last review"
      self.delete_my_last_review
    when "sign out"
      self.sign_out
    end
  end

end
