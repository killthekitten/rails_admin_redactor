require "rails_admin_redactor/engine"

module RailsAdminRedactor
end

require 'rails_admin/config/fields'
require 'rails_admin/config/fields/base'

module RailsAdmin
  module Config
    module Fields
      module Types
        class Redactor < RailsAdmin::Config::Fields::Base
          RailsAdmin::Config::Fields::Types::register(self)
        end
      end
    end
  end
end

RailsAdmin::Config::Fields.register_factory do |parent, properties, fields|
  if properties[:name] == :redactor
    fields << RailsAdmin::Config::Fields::Types::Redactor.new(parent, properties[:name], properties)
    true
  else
    false
  end
end


