[![Build Status](https://travis-ci.org/lawitschka/rails-api-validation-errors.png?branch=master)](https://travis-ci.org/lawitschka/rails-api-validation-errors)
[![Code Climate](https://codeclimate.com/github/lawitschka/rails-api-validation-errors.png)](https://codeclimate.com/github/lawitschka/rails-api-validation-errors)

# Rails API validation errors

Untranslated validation errors with all meta data for APIs behind Javascript frontends


## Installing

The easiest way to install `Rails::API::ValidationErrors` is to add it to your
`Gemfile`:

```ruby
gem "rails_api_validation_errors"
```

Then, install it on the command line:

```
$ bundle install
```

## Usage

Include `Rails::API::HashValidationErrors` in your API's base controller. This makes
sure that Rails will not translate error messages, but returns a hash per attribute
and error including the error key and meta information.

```ruby
class API::BaseController < ApplicationController
  include Rails::API::HasValidationErrors
end
```

To use the new error messages simply return the model's errors in JSON or XML
in your controllers:

```ruby
class API::PeopleController < API::BaseController

  def create
    @person = Person.new(person_params)

    if @person.valid?
      render :json => @person
    else
      render :json => { :errors => @person.errors }
    end
  end

end
```

This will result in the following JSON response in case of validation errors:

```json
{
  "errors": {
    "name": [
      {
        "message": "blank",
        "meta":{}
      }
    ]
  }
}
```