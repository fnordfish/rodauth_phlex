# frozen_string_literal: true

module RodauthPhlex::Emails
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/webauthn-authenticator-removed-email.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class WebauthnAuthenticatorRemovedEmail < RodauthPhlex::Email
    def view_template
      lines(
        "Someone (hopefully you) has removed a WebAuthn authenticator from the",
        "account associated to this email address. There are now #{rodauth.account_webauthn_ids.length} WebAuthn",
        "authenticator(s) with access to the account."
      )
    end
  end
end
