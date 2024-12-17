# frozen_string_literal: true

module RodauthPhlex::Views
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/two-factor-manage.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class TwoFactorManage < Rodauth::View
    def view_template
      safe_html rodauth.two_factor_setup_heading unless rodauth.two_factor_setup_links.empty?
      ul(class: "rodauth-links rodauth-multifactor-setup-links") do
        rodauth.two_factor_setup_links.each do |_, link, text|
          li { a(href: link) { text } }
        end
      end

      safe_html rodauth.two_factor_remove_heading unless rodauth.two_factor_remove_links.empty?
      ul(class: "rodauth-links rodauth-multifactor-remove-links") do
        rodauth.two_factor_remove_links.each do |_, link, text|
          li { a(href: link) { text } }
        end
        li { a(href: rodauth.two_factor_disable_path) { rodauth.two_factor_disable_link_text } } if rodauth.two_factor_remove_links.length > 1
      end
    end
  end
end
