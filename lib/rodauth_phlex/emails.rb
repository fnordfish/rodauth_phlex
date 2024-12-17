# frozen_string_literal: true

module RodauthPhlex
  autoload :Email, "rodauth_phlex/email"

  module Emails
    autoload :EmailAuthEmail, "rodauth_phlex/emails/email_auth_email"
    autoload :OtpDisabledEmail, "rodauth_phlex/emails/otp_disabled_email"
    autoload :OtpLockedOutEmail, "rodauth_phlex/emails/otp_locked_out_email"
    autoload :OtpSetupEmail, "rodauth_phlex/emails/otp_setup_email"
    autoload :OtpUnlockFailedEmail, "rodauth_phlex/emails/otp_unlock_failed_email"
    autoload :OtpUnlockedEmail, "rodauth_phlex/emails/otp_unlocked_email"
    autoload :PasswordChangedEmail, "rodauth_phlex/emails/password_changed_email"
    autoload :ResetPasswordEmail, "rodauth_phlex/emails/reset_password_email"
    autoload :ResetPasswordNotifyEmail, "rodauth_phlex/emails/reset_password_notify_email"
    autoload :UnlockAccountEmail, "rodauth_phlex/emails/unlock_account_email"
    autoload :VerifyAccountEmail, "rodauth_phlex/emails/verify_account_email"
    autoload :VerifyLoginChangeEmail, "rodauth_phlex/emails/verify_login_change_email"
    autoload :WebauthnAuthenticatorAddedEmail, "rodauth_phlex/emails/webauthn_authenticator_added_email"
    autoload :WebauthnAuthenticatorRemovedEmail, "rodauth_phlex/emails/webauthn_authenticator_removed_email"
  end
end
