# frozen_string_literal: true

module RodauthPhlex
  class Email < Phlex::SGML # TODO: change to "Phlex::Plain" when available
    include RodauthPhlex::Components

    def initialize(rodauth)
      @rodauth = rodauth
    end
    attr_reader :rodauth

    LF = "\n"
    CRLF = "\r\n"

    def lines(*str, ending: LF)
      raw(safe(str.join(ending)))
    end

    def line(*str, seperator: " ")
      raw(safe(str.join(seperator)))
    end
  end
end
