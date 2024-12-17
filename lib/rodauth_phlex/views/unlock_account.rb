# frozen_string_literal: true

module RodauthPhlex::Views
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/unlock-account.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class UnlockAccount < Rodauth::View
    def view_template
      form(method: "post", class: "rodauth", role: "form", id: "unlock-account-form") do
        safe_html rodauth.unlock_account_additional_form_tags
        safe_html rodauth.csrf_tag
        safe_html rodauth.unlock_account_explanatory_text
        PasswordField(rodauth) if rodauth.unlock_account_requires_password?
        Button(rodauth, rodauth.unlock_account_button)
      end
    end
  end
end
