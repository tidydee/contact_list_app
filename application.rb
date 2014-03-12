require 'colorize'

class Application

  def run
    show_main_menu
    input = gets.chomp
      case input
      when "quit"
        quit
        
        
      
  

        
      end


  end

  private

  # Prints the main menu only
  def show_main_menu
    puts "Welcome to the best contact list managing application. What's would you like to do next?".colorize( :blue )
    puts " new      - Create a new contact".colorize( :green )
    puts " list     - List all contacts".colorize( :green )
    puts " quit     - Exit Application".colorize( :green )
    print ">> "
  end

  def quit
    abort("Good-Bye!!")
  end

end
