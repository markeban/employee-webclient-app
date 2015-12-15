class EmployeesController < ApplicationController

  def index
    @employees = Unirest.get("http://localhost:3000/employees.json").body 
  end

  def show
    @employee = Unirest.get("http://localhost:3000/employees/#{params[:id]}.json").body 
  end

  def new
  end

  def create
    @employee = Unirest.post("http://localhost:3000/employees.json", headers: {"Accept" => "application/json"}, parameters: {first_name: params[:first_name], last_name: params[:last_name], birthdate: params[:birthdate], email: params[:email], ssn: params[:ssn]}).body
    redirect_to employee_path(@employee["id"])
  end

  def edit
    @employee = Unirest.get("http://localhost:3000/employees/#{params[:id]}.json").body
  end

  def update
    @employee = Unirest.patch("http://localhost:3000/employees/#{params[:id]}.json", headers: {"Accept" => "application/json"}, parameters: {first_name: params[:first_name], last_name: params[:last_name], birthdate: params[:birthdate], email: params[:email], ssn: params[:ssn]}).body
    redirect_to employee_path(@employee["id"])
  end

  def destroy
    Unirest.delete("http://localhost:3000/employees/#{params[:id]}.json").body
    redirect_to "/employees"
  end
end
