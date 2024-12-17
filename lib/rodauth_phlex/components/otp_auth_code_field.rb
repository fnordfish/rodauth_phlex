# frozen_string_literal: true

module RodauthPhlex::Components
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/otp-auth-code-field.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class OtpAuthCodeField < RodauthPhlex::Component
    def view_template
      div(class: "form-group mb-3") do
        label(for: "otp-auth-code", class: "form-label") { "#{rodauth.otp_auth_label}#{rodauth.input_field_label_suffix}" }
        div(class: "row") do
          div(class: "col-sm-3") do
            InputField(rodauth, rodauth.otp_auth_param, "otp-auth-code", type: "text", value: "", autocomplete: "off", inputmode: "numeric")
          end
        end
      end
    end
  end
end
