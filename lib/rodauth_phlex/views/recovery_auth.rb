# frozen_string_literal: true

module RodauthPhlex::Views
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/recovery-auth.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class RecoveryAuth < Rodauth::View
    def view_template
      form(method: "post", class: "rodauth", role: "form", id: "recovery-auth-form") do
        safe_html rodauth.recovery_auth_additional_form_tags
        safe_html rodauth.csrf_tag
        div(class: "form-group mb-3") do
          label(for: "recovery-code", class: "form-label") { "#{rodauth.recovery_codes_label}#{rodauth.input_field_label_suffix}" }
          InputField(rodauth, rodauth.recovery_codes_param, "recovery-code", value: "", autocomplete: "off")
        end
        Button(rodauth, rodauth.recovery_auth_button)
      end
    end
  end
end
