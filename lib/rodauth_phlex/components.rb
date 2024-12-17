module RodauthPhlex
  autoload :Component, "rodauth_phlex/component"

  module Components
    extend Phlex::Kit

    autoload :AddRecoveryCodes, "rodauth_phlex/components/add_recovery_codes"
    autoload :Button, "rodauth_phlex/components/button"
    autoload :ChangeLogin, "rodauth_phlex/components/change_login"
    autoload :EmailAuthRequestForm, "rodauth_phlex/components/email_auth_request_form"
    autoload :FormattedFieldError, "rodauth_phlex/components/formatted_field_error"
    autoload :GlobalLogoutField, "rodauth_phlex/components/global_logout_field"
    autoload :InputField, "rodauth_phlex/components/input_field"
    autoload :LoginConfirmField, "rodauth_phlex/components/login_confirm_field"
    autoload :LoginDisplay, "rodauth_phlex/components/login_display"
    autoload :LoginField, "rodauth_phlex/components/login_field"
    autoload :LoginForm, "rodauth_phlex/components/login_form"
    autoload :LoginFormFooter, "rodauth_phlex/components/login_form_footer"
    autoload :LoginHiddenField, "rodauth_phlex/components/login_hidden_field"
    autoload :OtpAuthCodeField, "rodauth_phlex/components/otp_auth_code_field"
    autoload :PasswordConfirmField, "rodauth_phlex/components/password_confirm_field"
    autoload :PasswordField, "rodauth_phlex/components/password_field"
    autoload :RecoveryCodes, "rodauth_phlex/components/recovery_codes"
    autoload :SmsCodeField, "rodauth_phlex/components/sms_code_field"
    autoload :WebauthnAutofill, "rodauth_phlex/components/webauthn_autofill"
  end
end
