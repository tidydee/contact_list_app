class Contact

  ## In-memory list of contacts
  @@contacts = []

  attr_accessor :name
  attr_accessor :email

  def initialize(name, email)
    # TODO: assign local variables to instance variables
  end

  def to_s
    # TODO: return string representation of Contact
  end

  ## Class Methods
  class << self
    def create(name, email)
      # TODO: Will initialize a contact as well as add it to the list of contacts
    end

    def find(index)
      # TODO: Will find and return contact by index
    end

    def all
      # TODO: Return the list of contacts, as is
    end
  end

end
 