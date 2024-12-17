# frozen_string_literal: true

module RodauthPhlex::Components
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/change-login.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class ChangeLogin < Rodauth::Component
    def view_template
      form(method: "post", class: "rodauth", role: "form", id: "change-login-form") do
        safe_html rodauth.change_login_additional_form_tags
        safe_html rodauth.csrf_tag
        LoginField(rodauth)
        LoginConfirmField(rodauth) if rodauth.require_login_confirmation?
        PasswordField(rodauth) if rodauth.change_login_requires_password?
        Button(rodauth, rodauth.change_login_button)
      end
    end
  end
end
