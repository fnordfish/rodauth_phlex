# frozen_string_literal: true

require "phlex"

module RodauthPhlex
  class Error < StandardError; end
  Undefined = Object.new.freeze
end

require_relative "rodauth_phlex/version"
require_relative "rodauth_phlex/components"
require_relative "rodauth_phlex/views"
require_relative "rodauth_phlex/feature"
