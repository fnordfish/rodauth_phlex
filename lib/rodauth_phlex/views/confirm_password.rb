# frozen_string_literal: true

module RodauthPhlex::Views
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/confirm-password.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class ConfirmPassword < RodauthPhlex::View
    def view_template
      form(method: "post", class: "rodauth", role: "form", id: "confirm-password-form") do
        safe_html rodauth.confirm_password_additional_form_tags
        safe_html rodauth.csrf_tag
        render PasswordField(rodauth)
        Button(rodauth, rodauth.confirm_password_button)
      end
    end
  end
end
