module Filterable
  extend ActiveSupport::Concern
  module ClassMethods
    def filter filtering_params
      filtering_params.each do |key, value|
        results = results.public_send(key, value) if key.present?
      end
      results
    end
  end
end
