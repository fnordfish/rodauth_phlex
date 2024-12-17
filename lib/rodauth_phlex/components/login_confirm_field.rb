# frozen_string_literal: true

module RodauthPhlex::Components
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/login-confirm-field.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class LoginConfirmField < RodauthPhlex::Component
    def view_template
      div(class: "form-group mb-3") do
        label(for: "login-confirm", class: "form-label") { "#{rodauth.login_confirm_label}#{rodauth.input_field_label_suffix}" }
        InputField(rodauth, rodauth.login_confirm_param, "login-confirm", type: rodauth.login_input_type, autocomplete: rodauth.login_uses_email? ? "email" : "on")
      end
    end
  end
end
