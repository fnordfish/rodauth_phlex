# frozen_string_literal: true

module RodauthPhlex::Views
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/sms-request.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class SmsRequest < Rodauth::View
    def view_template
      form(method: "post", class: "rodauth", role: "form", id: "sms-request-form") do
        safe_html rodauth.sms_request_additional_form_tags
        safe_html rodauth.csrf_tag
        Button(rodauth, rodauth.sms_request_button)
      end
    end
  end
end
