# frozen_string_literal: true

module RodauthPhlex::Emails
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/otp-setup-email.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class OtpSetupEmail < RodauthPhlex::Email
    def view_template
      lines(
        "Someone (hopefully you) has setup TOTP authentication for the account",
        "associated to this email address."
      )
    end
  end
end
