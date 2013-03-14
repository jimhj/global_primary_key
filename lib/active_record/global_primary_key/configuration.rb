# coding: utf-8
module ActiveRecord
  module GlobalPrimaryKey
    class Configuration
      attr_accessor :global_id_format, :model_shard

      def initialize
        self.global_id_format = '%02x%02x-%010x-%04x'
        self.model_shard = 0
      end
    end

    class << self
      attr_accessor :configuration

      def configure
        self.configuration ||= ActiveRecord::GlobalPrimaryKey::Configuration.new
        yield(configuration) if block_given?
      end
    end 

  end
end