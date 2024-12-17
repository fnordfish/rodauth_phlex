# frozen_string_literal: true

module RodauthPhlex::Components
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/sms-code-field.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class SmsCodeField < RodauthPhlex::Component
    def view_template
      div(class: "form-group mb-3") do
        label(for: "sms-code", class: "form-label") { "#{rodauth.sms_code_label}#{rodauth.input_field_label_suffix}" }
        div(class: "row") do
          div(class: "col-sm-3") do
            InputField(rodauth, rodauth.sms_code_param, "sms-code", value: "", autocomplete: "one-time-code", inputmode: "numeric")
          end
        end
      end
    end
  end
end
