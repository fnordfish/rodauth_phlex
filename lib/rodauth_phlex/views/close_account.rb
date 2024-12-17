# frozen_string_literal: true

module RodauthPhlex::Views
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/close-account.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class CloseAccount < RodauthPhlex::View
    def view_template
      form(method: "post", class: "rodauth", role: "form", id: "close-account-form") do
        safe_html rodauth.close_account_additional_form_tags
        safe_html rodauth.csrf_tag
        PasswordField(rodauth) if rodauth.close_account_requires_password?
        Button(rodauth, rodauth.close_account_button, class: "btn btn-danger")
      end
    end
  end
end
