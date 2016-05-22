module Configure
  module Controls
    module FactoryMethod
      attr_accessor :factory_method_called

      def make
        instance = new
        self.factory_method_called = true
        instance
      end

      def factory_method_called?
        factory_method_called ? true : false
      end
    end
  end
end
