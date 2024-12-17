# frozen_string_literal: true

module RodauthPhlex::Views
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/reset-password-request.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class ResetPasswordRequest < Rodauth::View
    def view_template
      form(action: rodauth.reset_password_request_path, method: "post", class: "rodauth", role: "form", id: "reset-password-request-form") do
        safe_html rodauth.reset_password_request_additional_form_tags
        safe_html rodauth.csrf_tag(rodauth.reset_password_request_path)
        safe_html rodauth.reset_password_explanatory_text
        if rodauth.param_or_nil(rodauth.login_param) && !rodauth.field_error(rodauth.login_param)
          LoginHiddenField(rodauth)
        else
          LoginField(rodauth)
        end
        Button(rodauth, rodauth.reset_password_request_button)
      end
    end
  end
end
