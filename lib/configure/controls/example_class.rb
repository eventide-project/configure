module Configure
  module Controls
    class ExampleClass
      include Configure

      configure :some_attr_name

      def self.build
        new
      end
    end
  end
end
