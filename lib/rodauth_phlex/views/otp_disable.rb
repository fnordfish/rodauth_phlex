# frozen_string_literal: true

module RodauthPhlex::Views
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/otp-disable.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class OtpDisable < Rodauth::View
    def view_template
      form(method: "post", class: "rodauth", role: "form", id: "otp-disable-form") do
        safe_html rodauth.otp_disable_additional_form_tags
        safe_html rodauth.csrf_tag
        PasswordField(rodauth) if rodauth.two_factor_modifications_require_password?
        Button(rodauth, rodauth.otp_disable_button, class: "btn btn-warning")
      end
    end
  end
end
