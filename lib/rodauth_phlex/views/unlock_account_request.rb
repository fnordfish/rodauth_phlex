# frozen_string_literal: true

module RodauthPhlex::Views
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/unlock-account-request.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class UnlockAccountRequest < Rodauth::View
    def view_template
      form(action: rodauth.unlock_account_request_path, method: "post", class: "rodauth", role: "form", id: "unlock-account-request-form") do
        safe_html rodauth.unlock_account_request_additional_form_tags
        safe_html rodauth.csrf_tag(rodauth.unlock_account_request_path)
        LoginHiddenField(rodauth)
        safe_html rodauth.unlock_account_request_explanatory_text
        Button(rodauth, rodauth.unlock_account_request_button)
      end
    end
  end
end
