# frozen_string_literal: true

module RodauthPhlex::Components
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/login-field.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class LoginField < RodauthPhlex::Component
    def view_template
      div(class: "form-group mb-3") do
        label(for: "login", class: "form-label") { "#{rodauth.login_label}#{rodauth.input_field_label_suffix}" }
        InputField(rodauth, rodauth.login_param, "login", type: rodauth.login_input_type, autocomplete: rodauth.login_field_autocomplete_value)
      end
    end
  end
end
