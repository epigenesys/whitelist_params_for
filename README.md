# whitelist_params_for

ActiveRecord comes with attr_accessible and friends, whose job is to protect certain attributes
of your models from being maliciously modified when using the convienient hash-based update methods
in controllers.

However, if you want an attribute to be accessible in some controllers but not others, you have a
problem.

This simple gem provides a nice DSL for whitelisting attributes in your controllers, which IMO is
the correct place to do it.

## Installing

Add the gem to your gemfile

    gem 'whitelist_params_for'

## Usage

    whitelist_params_for <param>,
      <action> => <keys>

`param: symbol`
The paramater to filter

`action: symbol or array of symbols`
The controller action to apply this filter to. You may pass an array for multiple actions.

`keys: array of symbols`
The keys of the paramater to allow

### Example

    class UserController < ActionController::Base

      whitelist_params_for :user,
        :create => [:name, :email, :password, :password_confirmation],
        :update => [:name, :email]
        [:clean, :hide] => [:password]


      def create
        @user = User.new(params[:user])
        # ... etc
      end
      def update
        # ... load @user
        @user.update_attributes(params[:user])
        # ... etc
      end
      # ... etc

    end
