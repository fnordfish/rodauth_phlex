# frozen_string_literal: true

module RodauthPhlex::Views
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/change-password.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class ChangePassword < RodauthPhlex::View
    def view_template
      form(method: "post", class: "rodauth", role: "form", id: "change-password-form") do
        safe_html rodauth.change_password_additional_form_tags
        safe_html rodauth.csrf_tag
        PasswordField(rodauth) if rodauth.change_password_requires_password?
        div(class: "form-group mb-3") do
          label(for: "new-password", class: "form-label") { "#{rodauth.new_password_label}#{rodauth.input_field_label_suffix}" }
          InputField(rodauth, rodauth.new_password_param, "new-password", type: "password", autocomplete: "new-password")
        end
        PasswordConfirmField(rodauth) if rodauth.require_password_confirmation?
        Button(rodauth, rodauth.change_password_button)
      end
    end
  end
end
