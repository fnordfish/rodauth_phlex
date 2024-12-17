# frozen_string_literal: true

module RodauthPhlex::Components
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/button.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class Button < RodauthPhlex::Component
    def initialize(rodauth, value, opts = {})
      super(rodauth)

      @value = value
      @opts = opts
    end

    attr_reader :value, :opts

    def view_template(&block)
      div(class: "form-group mb-3") do
        if block_given?
          button(type: "submit", name: opts[:name], class: btn_class) { yield }
        end
        input(type: "submit", name: opts[:name], class: btn_class, value: value)
      end
    end

    def btn_class
      opts[:class] || "btn btn-primary"
    end
  end
end
