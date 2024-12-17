# frozen_string_literal: true

module RodauthPhlex::Components
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/login-form-footer.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class LoginFormFooter < RodauthPhlex::Component
    def view_template
      safe_html rodauth.login_form_footer_links_heading
      ul(class: "rodauth-links rodauth-login-footer-links") do
        rodauth.login_form_footer_links.each do |_, link, text|
          li { a(href: link) { text } }
        end
      end
    end
  end
end
