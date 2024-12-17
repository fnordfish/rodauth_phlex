# frozen_string_literal: true

module RodauthPhlex::Views
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/reset-password.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class ResetPassword < Rodauth::View
    def view_template
      form(method: "post", class: "rodauth", role: "form", id: "reset-password-form") do
        safe_html rodauth.reset_password_additional_form_tags
        safe_html rodauth.csrf_tag
        PasswordField(rodauth)
        PasswordConfirmField(rodauth) if rodauth.require_password_confirmation?
        Button(rodauth, rodauth.reset_password_button)
      end
    end
  end
end
