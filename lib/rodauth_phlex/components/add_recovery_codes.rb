# frozen_string_literal: true

module RodauthPhlex::Components
  # This is a Phlex version of the Rodauth template:
  # https://github.com/jeremyevans/rodauth/blob/2.37.0/templates/add-recovery-codes.str
  #
  # Copyright (c) 2024      Robert Schulze
  # Copyright (c) 2015-2023 Jeremy Evans
  # MIT License
  class AddRecoveryCodes < RodauthPhlex::Component
    def view_template
      pre(id: "recovery-codes") do
        plain rodauth.recovery_codes.join("\n\n")
      end
      if rodauth.can_add_recovery_codes?
        safe_html rodauth.add_recovery_codes_heading
        RecoveryCodes()
      end
    end
  end
end
