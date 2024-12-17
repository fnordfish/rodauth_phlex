# frozen_string_literal: true

module RodauthPhlex::Components
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/global-logout-field.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class GlobalLogoutField < RodauthPhlex::Component
    def view_template
      div(class: "form-group mb-3") do
        div(class: "form-check checkbox") do
          input(type: "checkbox", name: rodauth.global_logout_param, class: "form-check-input", id: "global-logout", value: "t")
          label(class: "rodauth-global-logout-label form-check-label", for: "global-logout") { rodauth.global_logout_label }
        end
      end
    end
  end
end
