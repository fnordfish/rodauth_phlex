# frozen_string_literal: true

module RodauthPhlex::Views
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/sms-confirm.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class SmsConfirm < Rodauth::View
    def view_template
      form(method: "post", class: "rodauth", role: "form", id: "sms-confirm-form") do
        safe_html rodauth.sms_confirm_additional_form_tags
        safe_html rodauth.csrf_tag
        SmsCodeField(rodauth)
        Button(rodauth, rodauth.sms_confirm_button)
      end
    end
  end
end
