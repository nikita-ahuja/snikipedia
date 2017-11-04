module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(filtering_params)
      results = self.where(nil)
      filtering_params.each do |key, value|
        binding.pry
        results = results.public_send(key, value) if value.present?
      end
      binding.pry

      results
    end
  end
end
