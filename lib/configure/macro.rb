module Configure
  def self.extended(cls)
    cls.class_exec do
      extend Macro
    end
  end
  module Macro
    def configure_macro(dependency_name)
      singleton_class.class_exec dependency_name do |default_attr_name|
        define_method :configure do |receiver, attr_name: nil|
          attr_name ||= default_attr_name

          instance = new

          receiver.public_send "#{attr_name}=", instance
          instance
        end
      end
    end
    alias :configure :configure_macro
  end
end
