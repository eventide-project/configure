module Configure
  module Macro
    def self.extended(cls)
      cls.extend DefaultFactoryMethod
    end

    def configure_macro(default_attr_name, factory_method: nil)
      factory_method ||= default_factory_method

      singleton_class.class_exec default_attr_name, factory_method do |default_attr_name, factory_method|
        define_method :configure do |receiver, *args, attr_name: nil, **keyword_args|
          if receiver.is_a?(Symbol) && attr_name.nil? && args.empty? && keyword_args.empty?
            return super receiver
          end

          attr_name ||= default_attr_name

          if keyword_args.empty?
            instance = public_send factory_method, *args
          else
            instance = public_send factory_method, *args, **keyword_args
          end

          receiver.public_send "#{attr_name}=", instance
          instance
        end
      end
    end
    alias :configure :configure_macro

    module DefaultFactoryMethod
      attr_writer :default_factory_method

      def default_factory_method
        @default_factory_method ||= :new
      end
    end
  end
end
