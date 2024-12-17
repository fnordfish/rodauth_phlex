# frozen_string_literal: true

module RodauthPhlex::Components
  # This is a Phlex version of the Rodauth `Rodauth::Base#input_field_string(param, id, opts={})`:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/lib/rodauth/features/base.rb
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class InputField < RodauthPhlex::Component
    def initialize(rodauth, param, id, opts = {})
      super(rodauth)
      @param = param
      @id = id
      @opts = opts
    end

    attr_reader :param, :id, :opts

    def view_template
      input(**args)
      unless opts[:skip_error_message]
        whitespace
        FormattedFieldError(rodauth, param)
      end
    end

    def args
      args = {}
      if (attr = opts[:attr])
        if attr.is_a?(Hash)
          args.merge!(attr)
        else
          warn "The `:attr` option should be a Hash. Ignored '#{attr}'."
        end
      end

      args[:autocomplete] = opts[:autocomplete] if rodauth.autocomplete_for_field?(param)
      args[:inputmode] = opts[:inputmode] if rodauth.inputmode_for_field?(param)
      args[:required] = opts[:required] if rodauth.mark_input_fields_as_required?

      if (attr = rodauth.field_attributes(param)) && !attr.empty?
        if attr.is_a?(Hash)
          args.merge!(attr)
        else
          warn "The `field_attributes`/`default_field_attributes` should be a Hash. Ignored '#{attr}'."
        end
      end

      if (attr = rodauth.field_error_attributes(param))
        if attr.is_a?(Hash)
          args.merge!(attr)
        else
          warn "The `field_error_attributes` should be a Hash. Ignored '#{attr}'."
        end
      else
        args[:aria_invalid] = "true"
        args[:aria_describedby] = "#{param}_error_message"
      end

      args[:type] = type = opts.fetch(:type, "text")
      args[:class] = [opts.fetch(:class, "form-control"), rodauth.add_field_error_class(param)]
      args[:name] = param
      args[:id] = id
      args[:value] = if type == "password"
        ""
      else
        opts.fetch(:value) { rodauth.param(param) }
      end

      args
    end
  end
end
