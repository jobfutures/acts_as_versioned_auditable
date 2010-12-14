require 'acts_as_versioned_auditable'

ActiveRecord::Base.send(:include, ActiveRecord::Acts::VersionedAuditable)
