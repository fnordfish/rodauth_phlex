# frozen_string_literal: true

module RodauthPhlex::Components
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/webauthn-autofill.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class WebauthnAutofill < RodauthPhlex::Component
    def view_template
      cred = rodauth.webauthn_credential_options_for_get

      form(method: "post", action: rodauth.webauthn_login_path, class: "rodauth", role: "form", id: "webauthn-login-form", "data-credential-options": cred.as_json.to_json) do
        safe_html rodauth.webauthn_auth_additional_form_tags
        safe_html rodauth.csrf_tag(rodauth.webauthn_login_path)
        input(type: "hidden", name: rodauth.webauthn_auth_challenge_param, value: cred.challenge)
        input(type: "hidden", name: rodauth.webauthn_auth_challenge_hmac_param, value: rodauth.compute_hmac(cred.challenge))
        input(class: "rodauth_hidden d-none", "aria-hidden": "true", type: "text", name: rodauth.webauthn_auth_param, id: "webauthn-auth", value: "")
        Button(rodauth, rodauth.webauthn_auth_button, class: "d-none")
      end

      script(src: "#{rodauth.webauthn_js_host}#{rodauth.webauthn_autofill_js_path}")
    end
  end
end
