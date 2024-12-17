# frozen_string_literal: true

module RodauthPhlex::Views
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/verify-account.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class VerifyAccount < Rodauth::View
    def view_template
      form(method: "post", class: "rodauth", role: "form", id: "verify-account-form") do
        safe_html rodauth.verify_account_additional_form_tags
        safe_html rodauth.csrf_tag
        PasswordField(rodauth) if rodauth.verify_account_set_password?
        PasswordConfirmField(rodauth) if rodauth.verify_account_set_password? && rodauth.require_password_confirmation?
        Button(rodauth, rodauth.verify_account_button)
      end
    end
  end
end
