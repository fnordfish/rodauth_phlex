# frozen_string_literal: true

module RodauthPhlex::Components
  # This is a Phlex version of the Rodauth `Rodauth::Base#formatted_field_error(field)`:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/lib/rodauth/features/base.rb
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class FormattedFieldError < RodauthPhlex::Component
    def initialize(rodauth, field)
      super(rodauth)
      @field = field
    end

    def view_template
      field = @field
      error = field_error(field)
      return unless error
      span(class: rodauth.input_field_error_message_class, id: "#{field}_error_message") { error }
    end
  end
end
