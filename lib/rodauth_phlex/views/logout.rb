# frozen_string_literal: true

module RodauthPhlex::Views
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/logout.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class Logout < Rodauth::View
    def view_template
      form(method: "post", class: "rodauth", role: "form", id: "logout-form") do
        safe_html rodauth.logout_additional_form_tags
        safe_html rodauth.csrf_tag
        Button(rodauth, rodauth.logout_button, class: "btn btn-warning")
      end
    end
  end
end
