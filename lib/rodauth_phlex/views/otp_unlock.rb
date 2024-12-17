# frozen_string_literal: true

module RodauthPhlex::Views
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/otp-unlock.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class OtpUnlock < Rodauth::View
    def view_template
      form(method: "post", class: "rodauth", role: "form", id: "otp-unlock-form") do
        safe_html rodauth.otp_unlock_additional_form_tags
        safe_html rodauth.csrf_tag
        p { "#{rodauth.otp_unlock_consecutive_successes_label}: #{rodauth.otp_unlock_num_successes}" }
        p { "#{rodauth.otp_unlock_required_consecutive_successes_label}: #{rodauth.otp_unlock_auths_required}" }
        p { "#{rodauth.otp_unlock_next_auth_deadline_label}: #{rodauth.otp_unlock_deadline.strftime(rodauth.strftime_format)}" }
        OtpAuthCodeField(rodauth)
        Button(rodauth, rodauth.otp_unlock_button)
      end
      plain rodauth.otp_unlock_form_footer
    end
  end
end
