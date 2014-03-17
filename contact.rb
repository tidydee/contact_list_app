class Contact

  ## In-memory list of contacts

  attr_accessor :fname, :lname, :email, :id, :list, :numbers
  @@contacts = []

  def initialize(fname, lname, email, numbers)
   @fname = fname
   @lname = lname
   @email = email
   @numbers = numbers
   @id = @@contacts.length + 1
  end

  def to_s
    # TODO: return string representation of Contact
    "#{@id}: #{@fname} #{@lname} (#{@email}) #{@numbers}"  
  end


  ## Class Methods
  class << self

    def create(fname, lname, email, numbers = {})
      contact = Contact.new(fname, lname, email, numbers)
      @@contacts << contact
      return contact
    end

    def all_CSV
      @@contacts      
    end

    def all_CSV=(csv_file)
      @@contacts = csv_file
    end

    def all
      @@contacts
    end

    def all=(contacts)
      @@contact = contacts
    end

    def destroy_all
      @@contacts = []
    end
  end

end
