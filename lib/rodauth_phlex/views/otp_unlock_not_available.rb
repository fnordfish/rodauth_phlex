# frozen_string_literal: true

module RodauthPhlex::Views
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/otp-unlock-not-available.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class OtpUnlockNotAvailable < Rodauth::View
    def view_template
      p { "#{rodauth.otp_unlock_consecutive_successes_label}: #{rodauth.otp_unlock_num_successes}" }
      p { "#{rodauth.otp_unlock_required_consecutive_successes_label}: #{rodauth.otp_unlock_auths_required}" }
      p { "#{rodauth.otp_unlock_next_auth_attempt_label}: #{otp_unlock_next_auth_attempt_after}" }
      p { rodauth.otp_unlock_next_auth_attempt_refresh_label }
      safe_html rodauth.otp_unlock_refresh_tag
    end

    def otp_unlock_next_auth_attempt_after
      rodauth.otp_unlock_next_auth_attempt_after.strftime(rodauth.strftime_format)
    end
  end
end
