# frozen_string_literal: true

module RodauthPhlex::Views
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/login.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class Login < RodauthPhlex::View
    def view_template
      safe_html rodauth.login_form_header
      LoginForm(rodauth)
      safe_html rodauth.login_form_footer
    end
  end
end
