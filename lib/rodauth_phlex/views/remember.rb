# frozen_string_literal: true

module RodauthPhlex::Views
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/remember.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class Remember < Rodauth::View
    def view_template
      form(method: "post", class: "rodauth", role: "form", id: "remember-form") do
        safe_html rodauth.remember_additional_form_tags
        safe_html rodauth.csrf_tag
        fieldset(class: "form-group mb-3") do
          div(class: "form-check radio") do
            input(type: "radio", name: rodauth.remember_param, id: "remember-remember", value: rodauth.remember_remember_param_value, class: "form-check-input")
            label(class: "form-check-label", for: "remember-remember") { rodauth.remember_remember_label }
          end
          div(class: "form-check radio") do
            input(type: "radio", name: rodauth.remember_param, id: "remember-forget", value: rodauth.remember_forget_param_value, class: "form-check-input")
            label(class: "form-check-label", for: "remember-forget") { rodauth.remember_forget_label }
          end
          div(class: "form-check radio") do
            input(type: "radio", name: rodauth.remember_param, id: "remember-disable", value: rodauth.remember_disable_param_value, class: "form-check-input")
            label(class: "form-check-label", for: "remember-disable") { rodauth.remember_disable_label }
          end
        end
        Button(rodauth, rodauth.remember_button)
      end
    end
  end
end
