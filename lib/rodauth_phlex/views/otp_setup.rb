# frozen_string_literal: true

module RodauthPhlex::Views
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/otp-setup.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class OtpSetup < Rodauth::View
    def view_template
      form(method: "post", class: "rodauth", role: "form", id: "otp-setup-form") do
        safe_html rodauth.otp_setup_additional_form_tags
        input(type: "hidden", id: "otp-key", name: rodauth.otp_setup_param, value: rodauth.otp_user_key)
        input(type: "hidden", id: "otp-hmac-secret", name: rodauth.otp_setup_raw_param, value: rodauth.otp_key) if rodauth.otp_keys_use_hmac?
        safe_html rodauth.csrf_tag

        div(class: "form-group mb-3") do
          p { "#{rodauth.otp_secret_label}: #{rodauth.otp_user_key}" }
          p { "#{rodauth.otp_provisioning_uri_label}: #{rodauth.otp_provisioning_uri}" }
        end

        div(class: "row") do
          div(class: "col-lg-6 col-lg") do
            div(class: "form-group mb-3") do
              p { rodauth.otp_qr_code }
            end
          end

          div(class: "col-lg-6 col-lg") do
            PasswordField(rodauth) if rodauth.two_factor_modifications_require_password?
            OtpAuthCodeField(rodauth)
            Button(rodauth, rodauth.otp_setup_button)
          end
        end
      end
    end
  end
end
