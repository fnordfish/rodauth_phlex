# frozen_string_literal: true

module RodauthPhlex::Components
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/email-auth-request-form.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class EmailAuthRequestForm < RodauthPhlex::Component
    def view_template
      form(action: rodauth.email_auth_request_path, method: "post", class: "rodauth", role: "form", id: "email-auth-request-form") do
        safe_html rodauth.email_auth_request_additional_form_tags
        safe_html rodauth.csrf_tag(rodauth.email_auth_request_path)
        LoginHiddenField(rodauth)
        Button(rodauth, rodauth.email_auth_request_button)
      end
    end
  end
end
