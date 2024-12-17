# frozen_string_literal: true

module RodauthPhlex::Emails
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/reset-password-notify-email.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class ResetPasswordNotifyEmail < RodauthPhlex::Email
    def view_template
      lines(
        "Someone has requested that the account with this email be unlocked.",
        "If you did not request the unlocking of this account, please ignore this",
        "message. If you requested the unlocking of this account, please go to",
        rodauth.unlock_account_email_link,
        "to unlock this account."
      )
    end
  end
end
