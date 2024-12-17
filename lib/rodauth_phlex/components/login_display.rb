# frozen_string_literal: true

module RodauthPhlex::Components
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/login-display.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class LoginDisplay < RodauthPhlex::Component
    def view_template
      div(class: "form-group mb-3") do
        LoginHiddenField(rodauth)
        label(for: "login", class: "form-label") { rodauth.login_label }
        div(class: "form-control-plaintext form-control-static") { rodauth.param(rodauth.login_param) }
      end
    end
  end
end
