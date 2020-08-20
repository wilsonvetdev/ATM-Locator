class ATMlocator

  attr_accessor :prompt, :user
  

  def initialize
    @prompt = TTY::Prompt.new
  end

  def login_or_register
    user_choice = self.prompt.select("Logging in or Registering?",
    [ "Logging-in", "Register" ]
    )
    Messages.login_register_message(user_choice)
  end

  def main_menu
    user.reload
    system "clear"
    puts "-----------------------------------------"
    puts "Hello #{self.user.user_name}, this is the main menu."

    if self.user_bank_list.length != 0
      puts "You are a customer at these banks --#{self.user_bank_list}--".green
    else
      Messages.no_bank_message
    end
    puts "-----------------------------------------"

    self.prompt.select("What would you like to accomplish today?") do |menu|
      menu.choice "Find banks by zipcode", -> { self.list_banks_by_zipcode }
      menu.choice "Add your bank to a list of banks to which you are a customer", -> { self.add_bank_to_list }
      menu.choice "Delete a bank from your list", -> { self.delete_bank_from_list }
      menu.choice "Fetch bank list", -> { self.display_user_bank_list }
      menu.choice "Not what you are looking for? Click here for more.".yellow, -> { self.joke }
      menu.choice "Log off".red, -> { puts "--Have a nice day!--"}
    end
  end

  def list_banks_by_zipcode
    system "clear"
    zipcode_input = prompt.ask("What zipcode do you want to look into?", required: true)

    puts "-----------------------------------------"

    bank_result_array = Bank.where(zipcode: zipcode_input)

    bank_result_array.each do |bank|
      puts bank.id.to_s.red + "--" + bank.bank_name + ", " + bank.street_address + ", " + bank.city + ", " + bank.zipcode
    end

    keypress = prompt.keypress("***Press enter to go back to main menu***".yellow, keys: [:return])
    self.main_menu if keypress
  end

  def user_bank_list
    self.user.banks.map { |bank_instance| "#{bank_instance.bank_name}" }.uniq 
  end #returns an array of uniq bank names associated with user

  def display_user_bank_list
    puts self.user.banks.map { |bank_instance| "#{bank_instance.bank_name}, #{bank_instance.street_address}, #{bank_instance.city}".green }
    keypress = prompt.keypress("***Press enter to go back to main menu***".yellow, keys: [:return])
    self.main_menu if keypress
  end

  def add_bank_to_list
    bank_instance_id = prompt.ask("Please add a bank by their bank id number =] -->", required: true) { |q| q.in("1-5612") }

    new_userbank = Userbank.create(user_id: self.user.id, bank_id: bank_instance_id)

    sleep 1
    
    new_bank = Bank.find(new_userbank.bank_id)
    if !self.user_bank_list.include? new_bank.bank_name 
        puts "Here's the updated bank list for you --> #{self.user_bank_list.uniq << new_bank.bank_name}".green
    else
        Userbank.last.destroy #destroys the newly created Userbank isntance instead of implementing conditional
        puts "Duplication breh."
    end

    keypress = prompt.keypress("***Press enter to go back to main menu***".yellow, keys: [:return])
    self.main_menu if keypress
  end

  def delete_bank_from_list
    puts self.user.banks.map {|bank| bank.id.to_s.yellow + "--" + bank.bank_name.yellow }
    bank_id = prompt.ask("Please input bank id number to delete.")
    result = Userbank.find_by(user_id: self.user.id, bank_id: bank_id)
    result.destroy 
    # binding.pry

    keypress = prompt.keypress("***Press enter to go back to main menu***".yellow, keys: [:return])
    self.main_menu if keypress
  end 

  def joke
    Quotes.grab_chucknorris_joke
    keypress = prompt.keypress("***Press enter to go back to main menu***".yellow, keys: [:return])
    self.main_menu if keypress
  end

  def run
    Messages.welcome

    user_instance = self.login_or_register
    self.user = user_instance
    self.main_menu
  end

  private

end


