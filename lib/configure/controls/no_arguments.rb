module Configure
  module Controls
    module NoArguments
      class Example
        include Configure

        configure :some_attr_name

        def self.build
          new
        end
      end
    end
  end
end
