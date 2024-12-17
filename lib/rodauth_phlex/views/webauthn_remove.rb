# frozen_string_literal: true

module RodauthPhlex::Views
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/webauthn-remove.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class WebauthnRemove < Rodauth::View
    def view_template
      form(method: "post", class: "rodauth", role: "form", id: "webauthn-remove-form") do
        safe_html rodauth.webauthn_remove_additional_form_tags
        safe_html rodauth.csrf_tag
        PasswordField(rodauth) if rodauth.two_factor_modifications_require_password?
        fieldset(class: "form-group mb-3") do
          usage = rodauth.account_webauthn_usage
          last_id = usage.keys.last

          usage.each do |id, last_use|
            last_use = last_use.strftime(rodauth.strftime_format) if last_use.is_a?(Time)
            div(class: "form-check radio") do
              InputField(rodauth, rodauth.webauthn_remove_param, "webauthn-remove-#{id}", type: "radio", class: "form-check-input", value: id, required: false, skip_error_message: true)
              label(class: "rodauth-webauthn-id form-check-label", for: "webauthn-remove-#{id}") { "Last Use: #{last_use}" }
              FormattedFieldError(rodauth, rodauth.webauthn_remove_param) if id == last_id
            end
          end
        end
        Button(rodauth, rodauth.webauthn_remove_button)
      end
    end
  end
end
