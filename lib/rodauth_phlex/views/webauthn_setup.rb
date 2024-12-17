# frozen_string_literal: true

module RodauthPhlex::Views
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/webauthn-setup.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class WebauthnSetup < Rodauth::View
    def view_template
      cred = rodauth.new_webauthn_credential
      form(method: "post", class: "rodauth", role: "form", id: "webauthn-setup-form", "data-credential-options": cred.as_json.to_json) do
        safe_html rodauth.webauthn_setup_additional_form_tags
        safe_html rodauth.csrf_tag
        input(type: "hidden", name: rodauth.webauthn_setup_challenge_param, value: cred.challenge)
        input(type: "hidden", name: rodauth.webauthn_setup_challenge_hmac_param, value: rodauth.compute_hmac(cred.challenge))
        input(class: "rodauth_hidden d-none", "aria-hidden": "true", type: "text", name: rodauth.webauthn_setup_param, id: "webauthn-setup", value: "")
        PasswordField(rodauth) if rodauth.two_factor_modifications_require_password?
        div(id: "webauthn-remove-button") do
          Button(rodauth, rodauth.webauthn_setup_button)
        end
      end

      script(src: "#{rodauth.webauthn_js_host}#{rodauth.webauthn_setup_js_path}")
    end
  end
end
