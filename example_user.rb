class User
  attr_accessor :name, :email

  def initialize(attibutes = {})
    @name = attibutes[:name]
    @email = attibutes[:email]
  end

  def formatted_email
    "#{@name} <#{@email}"
  end
end