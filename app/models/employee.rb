class Employee

  attr_accessor :id, :first_name, :last_name, :email, :birthdate, :ssn

  def initialize(hash)
    @id = hash["id"]
    @first_name = hash["first_name"]
    @last_name = hash["last_name"]
    @email = hash["email"]
    @birthdate = hash["birthdate"]
    @ssn = hash["ssn"]
    @addresses = hash["addresses"]
  end

  def addresses
    @addresses = hash["addresses"]
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  def self.find(id)
    employee_hash = Unirest.get("http://localhost:3000/employees/#{id}.json").body
    Employee.new(employee_hash)
  end

  def self.all
    employees = []
    api_employees = Unirest.get("http://localhost:3000/employees.json").body
    api_employees.each do |api_employee|
      employees << Employee.new(api_employee)
    end
    employees
  end

  def self.create(attributes)
    employee_hash = Unirest.post("http://localhost:3000/employees.json", headers: {"Accept" => "application/json"}, parameters: attributes).body
    Employee.new(employee_hash)
  end

  def update(attributes)
    employee_hash = Unirest.patch("http://localhost:3000/employees/#{id}.json", headers: {"Accept" => "application/json"}, parameters: attributes).body
    Employee.new(employee_hash)
  end


  def destroy
    Unirest.delete("http://localhost:3000/employees/#{id}.json").body
  end




end