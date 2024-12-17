# frozen_string_literal: true

module RodauthPhlex::Views
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/otp-auth.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class OtpAuth < Rodauth::View
    def view_template
      form(method: "post", class: "rodauth", role: "form", id: "otp-auth-form") do
        safe_html rodauth.otp_auth_additional_form_tags
        safe_html rodauth.csrf_tag
        OtpAuthCodeField(rodauth)
        Button(rodauth, rodauth.otp_auth_button)
      end
      safe_html rodauth.otp_auth_form_footer
    end
  end
end
