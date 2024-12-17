# frozen_string_literal: true

module RodauthPhlex::Emails
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/verify-login-change-email.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class VerifyLoginChangeEmail < RodauthPhlex::Email
    def view_template
      lines(
        "Someone with an account has requested their login be changed to this email address:",
        "",
        "Old Login: #{rodauth.verify_login_change_old_login}",
        "New Login: #{rodauth.verify_login_change_new_login}",
        "",
        "If you did not request this login change, please ignore this message.  If you",
        "requested this login change, please go to",
        rodauth.verify_login_change_email_link,
        "to verify the login change."
      )
    end
  end
end
