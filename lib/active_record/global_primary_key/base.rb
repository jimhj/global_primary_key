# coding: utf-8
module ActiveRecord
  module GlobalPrimaryKey
    extend ActiveSupport::Concern

    included do
      before_create { self.generate_primary_key! if self.id.blank? }
      class_attribute(:model_id)
    end

    def generate_primary_key!
      self.id or self.id = self.class.generate_global_primary_key!
    end    

    module ClassMethods
      def set_global_model_id(model_id)
        self.model_id = model_id
      end

      def primary_key_prefix(primary_class = nil)
        primary_class ||= self
        if self.model_id.blank? && self.superclass != ActiveRecord::Base
          self.primary_key_prefix(self.superclass)
        else
          self.model_id
        end
      end      

      # generate global id
      def generate_global_primary_key!
        model_id = self.primary_key_prefix

        if model_id.nil?
          raise "Model(#{self.to_s}) is not allowed to act as global id." 
        end

        ActiveRecord::GlobalPrimaryKey.configuration.global_id_format % [
            self.primary_key_prefix,
            ActiveRecord::GlobalPrimaryKey.configuration.model_shard,
            ((Time.now - Time.utc(2011, 1, 1)) * 1000).to_i,
            rand(0xFFFF)
        ]
      end      
    end

  end
end



