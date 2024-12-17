# frozen_string_literal: true

module RodauthPhlex::Views
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/multi-phase-login.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class MultiPhaseLogin < Rodauth::View
    def view_template
      safe_html rodauth.login_form_header
      safe_html rodauth.render_multi_phase_login_forms
      safe_html rodauth.login_form_footer
    end
  end
end
