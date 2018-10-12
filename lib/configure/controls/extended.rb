module Configure
  module Controls
    module Extended
      class Example
        extend Configure

        configure :some_attr_name

        def self.build
          new
        end
      end
    end
  end
end
