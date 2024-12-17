# frozen_string_literal: true

module RodauthPhlex::Emails
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/email-auth-email.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class EmailAuthEmail < RodauthPhlex::Email
    def body
      lines(
        "Someone has requested a login link for the account with this email",
        "address.  If you did not request a login link, please ignore this",
        "message.  If you requested a login link, please go to",
        rodauth.email_auth_email_link,
        "to login to this account."
      )
    end
  end
end
