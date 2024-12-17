# frozen_string_literal: true

module RodauthPhlex::Components
  class RecoveryCodes < RodauthPhlex::Component
    # This is a Phlex version of the Rodauth template:
    # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/recovery-codes.str
    #
    # Copyright (c) 2024      Robert Schulze
    # Copyright (c) 2015-2023 Jeremy Evans
    # MIT License
    def view_template
      form(method: "post", class: "rodauth", role: "form", id: "recovery-codes-form") do
        safe_html rodauth.recovery_codes_additional_form_tags
        safe_html rodauth.csrf_tag
        PasswordField(rodauth) if rodauth.two_factor_modifications_require_password?
        Button(
          rodauth,
          rodauth.recovery_codes_button || rodauth.view_recovery_codes_button,
          name: (rodauth.add_recovery_codes_param if rodauth.recovery_codes_button)
        )
      end
    end
  end
end
