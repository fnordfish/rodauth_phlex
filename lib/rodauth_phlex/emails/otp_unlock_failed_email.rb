# frozen_string_literal: true

module RodauthPhlex::Emails
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/otp-unlock-failed-email.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class OtpSetupEmail < RodauthPhlex::Email
    def view_template
      lines(
        "Someone (hopefully you) attempted to unlock TOTP authentication for the",
        "account associated to this email address, but failed as the",
        "authentication code submitted was not correct.",
        "",
        "If you did not initiate the TOTP authentication failure that generated",
        "this email, that means someone already has partial access to your",
        "account, but is unable to use TOTP authentication to fully authenticate",
        "themselves."
      )
    end
  end
end
