# frozen_string_literal: true

module RodauthPhlex::Views
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/sms-setup.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class SmsSetup < Rodauth::View
    def view_template
      form(method: "post", class: "rodauth", role: "form", id: "sms-setup-form") do
        safe_html rodauth.sms_setup_additional_form_tags
        safe_html rodauth.csrf_tag
        PasswordField(rodauth) if rodauth.two_factor_modifications_require_password?

        div(class: "form-group mb-3") do
          label(for: "sms-phone", class: "form-label") { "#{rodauth.sms_phone_label}#{rodauth.input_field_label_suffix}" }
          div(class: "row") do
            div(class: "col-sm-3") do
              InputField(rodauth, rodauth.sms_phone_param, "sms-phone", type: rodauth.sms_phone_input_type, autocomplete: "tel")
            end
          end
        end

        Button(rodauth, rodauth.sms_setup_button)
      end
    end
  end
end
