# frozen_string_literal: true

module RodauthPhlex::Views
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/email-auth.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class EmailAuth < Rodauth::View
    def view_template
      form(method: "post", class: "rodauth", role: "form", id: "email-auth-form") do
        safe_html rodauth.email_auth_additional_form_tags
        safe_html rodauth.csrf_tag
        Button(rodauth, rodauth.login_button)
      end
    end
  end
end
