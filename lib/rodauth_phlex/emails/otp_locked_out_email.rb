# frozen_string_literal: true

module RodauthPhlex::Emails
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/otp-locked-out-email.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class OtpLockedOutEmail < RodauthPhlex::Email
    def view_template
      lines(
        "TOTP authentication has been locked out on your account due to too many",
        "consecutive authentication failures. You can attempt to unlock TOTP",
        "authentication for your account by consecutively authenticating via",
        "TOTP multiple times.",
        "",
        "If you did not initiate the TOTP authentication failures that",
        "caused TOTP authentication to be locked out, that means someone already",
        "has partial access to your account, but is unable to use TOTP",
        "authentication to fully authenticate themselves."
      )
    end
  end
end
