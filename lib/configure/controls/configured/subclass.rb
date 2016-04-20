module Configure
  module Controls
    module Configured
      module Subclass
        class Example < NoArguments::Example
          configure :some_subclass_dependency_name
        end

        def self.example
          Example
        end
      end
    end
  end
end
