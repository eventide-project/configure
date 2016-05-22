module Configure
  module Controls
    module FactoryMethod
      def make
        instance = new
        self.factory_method_called = true
        instance
      end

      module Proof
        attr_accessor :factory_method_called

        def factory_method_called?
          factory_method_called ? true : false
        end
      end
    end
  end
end
