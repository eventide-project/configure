module Configure
  def self.extended(cls)
    cls.class_exec do
      extend Macro
    end
  end
  module Macro
    def configure_macro(dependency_name)
      singleton_class.class_exec dependency_name do |default_attr_name|
        define_method :configure do |receiver, *args, attr_name: nil, **keyword_args|
          if receiver.is_a?(Symbol) and attr_name.nil? and args.empty? and keyword_args.empty?
            return super receiver
          end

          attr_name ||= default_attr_name

          if keyword_args.empty?
            instance = new *args
          else
            instance = new *args, **keyword_args
          end

          receiver.public_send "#{attr_name}=", instance
          instance
        end
      end
    end
    alias :configure :configure_macro
  end
end
