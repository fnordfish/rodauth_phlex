# frozen_string_literal: true

module RodauthPhlex::Views
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/verify-login-change.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class VerifyLoginChange < Rodauth::View
    def view_template
      form(method: "post", class: "rodauth", role: "form", id: "verify-login-change-form") do
        safe_html rodauth.verify_login_change_additional_form_tags
        safe_html rodauth.csrf_tag
        Button(rodauth, rodauth.verify_login_change_button)
      end
    end
  end
end
