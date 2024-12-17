# frozen_string_literal: true

module RodauthPhlex::Emails
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/password-changed-email.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class PasswordChangedEmail < RodauthPhlex::Email
    def body
      lines(
        "Someone (hopefully you) has changed the password for the account",
        "associated to this email address."
      )
    end
  end
end
