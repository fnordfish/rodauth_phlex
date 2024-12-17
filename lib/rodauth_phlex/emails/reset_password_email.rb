# frozen_string_literal: true

module RodauthPhlex::Emails
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/reset-password-email.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class ResetPasswordEmail < RodauthPhlex::Email
    def body
      lines(
        "Someone has requested a password reset for the account with this email",
        "address.  If you did not request a password reset, please ignore this",
        "message.  If you requested a password reset, please go to",
        rodauth.reset_password_email_link,
        "to reset the password for the account."
      )
    end
  end
end
