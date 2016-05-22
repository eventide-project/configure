module Configure
  module Macro
    def self.extended(cls)
      cls.extend DefaultFactoryMethod
    end

    def configure_macro(receiver_attribute, factory_method: nil, constructor: nil, &build_action)
      unless constructor.nil?
        factory_method = constructor
      end

      factory_method ||= default_factory_method

      singleton_class.class_exec receiver_attribute, factory_method do |receiver_attribute, factory_method|

        unless build_action.nil?
          define_method factory_method do |*args, **keyword_args|
            if args.empty?
              build_action.()
            elsif keyword_args.empty?
              build_action.(*args)
            else
              build_action.(*args, **keyword_args)
            end
          end
        end

        define_method :configure do |receiver, *args, attr_name: nil, **keyword_args|
          if receiver.is_a?(Symbol) && attr_name.nil? && args.empty? && keyword_args.empty?
            return super receiver
          end

          attr_name ||= receiver_attribute

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
        @default_factory_method ||= :build
      end
    end
  end
end
