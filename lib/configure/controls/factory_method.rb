module Configure
  module Controls
    module FactoryMethod
      attr_accessor :build_called

      def build
        instance = new
        self.build_called = true
        instance
      end

      def build_called?
        build_called ? true : false
      end
    end
  end
end
