# frozen_string_literal: true

module RodauthPhlex
  class View < Phlex::HTML
    include RodauthPhlex::Components

    def initialize(rodauth)
      @rodauth = rodauth
    end
    attr_reader :rodauth

    # only to be used for rodauth html helper method output
    def safe_html(str)
      raw(safe(str)) if str
    end
  end
end
