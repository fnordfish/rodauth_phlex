# frozen_string_literal: true

module RodauthPhlex::Components
  # This is a Phlex version of the Rodauth `Rodauth::Login#login_hidden_field()`:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/lib/rodauth/features/login.rb
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class LoginHiddenField < RodauthPhlex::Component
    def view_template
      login_param = rodauth.login_param
      input(type: "hidden", name: login_param, value: rodauth.param(login_param))
    end
  end
end
