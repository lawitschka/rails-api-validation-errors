class Api::PeopleController < ApplicationController
  include Rails::API::HashValidationErrors

  def create
    @person = Person.new(person_params)

    if @person.valid?
      render json: @person
    else
      render json: { errors: @person.errors }
    end
  end

  private

    def person_params
      params.require(:person).permit(:name)
    end

end