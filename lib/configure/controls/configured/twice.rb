module Configure
  module Controls
    module Configured
      module Twice
        class Example
          extend Configure::Macro

          configure :some_dependency_name
          configure :some_other_dependency_name
        end

        def self.example
          Example
        end
      end
    end
  end
end
