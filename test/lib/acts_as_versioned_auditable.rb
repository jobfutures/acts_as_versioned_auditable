module ActiveRecord
  module Acts
    # Adds the ability to store the user who created the version. This expects a version_created_by_user_id column in the versions table.
    #
    #   model Product < ActiveRecord::Base
    #     acts_as_versioned_auditable
    #   end
    #   product.find(:first).versions.first.user
    #
    # Use around filter in ApplicationController to set the current user. For example:
    #
    #   def set_versioned_auditable_user
    #     ActiveRecord::Acts::VersionedAuditable.current_user = current_user
    #     yield
    #     ActiveRecord::Acts::VersionedAuditable.current_user = nil
    #   end
    module VersionedAuditable
      mattr_accessor :current_user
      def self.included(mod)
        mod.extend ClassMethods
      end

      module ClassMethods
        # Called this method instead of acts_as_versioned
        def acts_as_versioned_auditable(opts={})
          acts_as_versioned(opts)
          ("#{self.to_s}::#{versioned_class_name}".constantize).class_eval do
            belongs_to :user, :foreign_key => 'version_created_by_user_id'
            before_save do |r|
              unless r.respond_to?(:versions) # We only want the actual version model
                r.user = ActiveRecord::Acts::VersionedAuditable.current_user
              end
              true
            end
          end
        end
      end
    end
  end
end
