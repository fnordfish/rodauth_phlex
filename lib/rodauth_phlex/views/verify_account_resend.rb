# frozen_string_literal: true

module RodauthPhlex::Views
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/verify-account-resend.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class VerifyAccountResend < Rodauth::View
    def view_template
      form(action: "rodauth.verify_account_resend_path", method: "post", class: "rodauth", role: "form", id: "verify-account-resend-form") do
        safe_html rodauth.verify_account_resend_additional_form_tags
        safe_html rodauth.csrf_tag(rodauth.verify_account_resend_path)
        safe_html rodauth.verify_account_resend_explanatory_text
        if rodauth.param_or_nil(rodauth.login_param)
          LoginHiddenField(rodauth)
        else
          LoginField(rodauth)
        end
        Button(rodauth, rodauth.verify_account_resend_button)
      end
    end
  end
end
