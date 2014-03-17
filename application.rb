require 'colorize'

class Application

  def run
    should_run = true
    while should_run do
      show_main_menu
      input = gets.chomp.downcase
      case input
      when "quit"
        quit
        should_run = false
      when "new"
        new_contact 
      when "list"
        list            
      when "show"
        show
      when "find"
        find
      end
    end
  end

  private

  # Prints the main menu only
  def show_main_menu
    puts "Welcome to the best contact list managing application.".upcase.colorize( :blue )
    puts "What would you like to do next?".upcase.colorize( :green )
    puts " new      - Create a new contact.".colorize( :green )
    puts " list     - List all contacts.".colorize( :green )
    puts " show     - Displays contact's ID and contact details.".colorize( :green )
    puts " find     - Displays contact's name and contact details by name.".colorize( :green )
    puts " quit     - Exit Application.".colorize( :green )
    print ">> "
  end

  def quit
    puts "Good-Bye!!".colorize( :blue )
  end

  def find
    puts "Please type the contact's first name you would like to find."
    contact_name = gets.chomp

    # found_contact = []
    # Contact.all.each do |contact|
    #   if contact.fname == contact_name
    #    found_contact << contact
    #   end 
    # end

    found_contact = Contact.all.find_all {|contact| contact.fname == contact_name }

    if !found_contact.nil?
      puts found_contact
    else
      puts "Could not find contact with name #{contact_name}".colorize( :red )
    end
  end


  def show
    puts "Please type contact's ID."
    id = gets.chomp.to_i
      
    found_contact = nil
    Contact.all.each do |contact|
      if id == contact.id
       found_contact = contact
      end 
    end

    if !found_contact.nil?
      puts found_contact
    else
      puts "Could not find contact with id #{id}".colorize( :red )
    end
  end

   def list
    Contact.all.each do |c_list| 
      puts c_list
    end
  end
  
  def new_contact
    
    puts "Please type contact's email address."
    email = gets.chomp
    email_check = Contact.all.find {|contact| contact.email == email}

      if !email_check.nil?
        puts ("A contact with this email already exists!").upcase.colorize( :red ) 
        puts ("Duplicated email address are not allowed.").upcase.colorize( :red )
      else
        puts "Please type contact's first name."
        fname = gets.chomp
        puts "Please type contact's last name."
        lname = gets.chomp
        numbers = add_phones

        contact = Contact.create(fname, lname, email, numbers)
        contactString = "#{contact}".colorize(:green)
        puts "New contact #{contactString} has been added."
      end
  end

  def add_phones
    phones = Hash.new
    if true
      puts "Please describe the phone number you'd like to add. Ex: 'mobile.'"
      user_phone_description = gets.chomp
      puts "Please enter the phone number for #{user_phone_description}:"
      phones[user_phone_description] = gets.chomp
      puts "Number added. To add another one, type 'y', to return the main screen, type 'n'."
      user_add_another_number = gets.chomp
        if user_add_another_number == "n"
          return phones
        end
    end
  end

end





















