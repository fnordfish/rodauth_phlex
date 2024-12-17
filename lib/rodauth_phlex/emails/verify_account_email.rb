# frozen_string_literal: true

module RodauthPhlex::Emails
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/verify-account-email.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class VerifyAccountEmail < RodauthPhlex::Email
    def view_template
      lines(
        "Someone has created an account with this email address.  If you did not create",
        "this account, please ignore this message.  If you created this account, please go to",
        rodauth.verify_account_email_link,
        "to verify the account."
      )
    end
  end
end
