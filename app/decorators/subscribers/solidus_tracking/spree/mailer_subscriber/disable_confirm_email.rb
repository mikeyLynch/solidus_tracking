# frozen_string_literal: true

module SolidusTracking
  module Spree
    module MailerSubscriber
      module DisableConfirmEmail
        def self.prepended(base)
          base.module_eval do
            alias_method :original_order_finalized, :order_finalized

            def order_finalized(event)
              return if SolidusTracking.configuration.disable_builtin_emails

              original_order_finalized(event)
            end
          end
        end
      end
    end
  end
end
