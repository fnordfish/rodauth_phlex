# frozen_string_literal: true

module RodauthPhlex::Components
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/password-confirm-field.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class PasswordConfirmField < RodauthPhlex::Component
    def view_template
      div(class: "form-group mb-3") do
        label(for: "password-confirm", class: "form-label") { "#{rodauth.password_confirm_label}#{rodauth.input_field_label_suffix}" }
        InputField(rodauth, rodauth.password_confirm_param, "password-confirm", type: "password", autocomplete: "new-password")
      end
    end
  end
end
