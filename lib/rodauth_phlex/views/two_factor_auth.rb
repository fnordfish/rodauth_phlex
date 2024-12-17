# frozen_string_literal: true

module RodauthPhlex::Views
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/two-factor-auth.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class TwoFactorAuth < Rodauth::View
    def view_template
      ul(class: "rodauth-links rodauth-two-factor-auth-links") do
        rodauth.two_factor_auth_links.each do |_, link, text|
          li { a(href: link) { text } }
        end
      end
    end
  end
end
