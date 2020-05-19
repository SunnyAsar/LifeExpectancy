class HomeController < ApplicationController

  def index
    @person = Person.new

    if params[:person].present?
      find_params
      @estimate = Person.where(age: @age).where(gender: @gender).first

    end
  end

  private 

  def find_params
      @age = params[:person][:age]
      @gender = params[:person][:gender]
  end
end
