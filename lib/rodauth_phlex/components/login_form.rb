# frozen_string_literal: true

module RodauthPhlex::Components
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/login-form.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class LoginForm < RodauthPhlex::Component
    def view_template
      form(method: "post", class: "rodauth", role: "form", id: "login-form") do
        safe_html rodauth.login_additional_form_tags
        safe_html rodauth.csrf_tag
        if rodauth.skip_login_field_on_login?
          render LoginDisplay(rodauth)
        else
          render LoginField(rodauth)
        end
        render PasswordField(rodauth) unless rodauth.skip_password_field_on_login?
        Button(rodauth, rodauth.login_button)
      end
    end
  end
end
