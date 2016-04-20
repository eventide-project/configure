module Configure
  module Controls
    module Configured
      module RequiredArguments
        class Example
          extend Configure::Macro

          configure :some_dependency_name

          attr_reader :required_arg
          attr_reader :another_required_arg

          def initialize(required_arg, another_required_arg)
            @required_arg = required_arg
            @another_required_arg = another_required_arg
          end
        end

        def self.example
          Example
        end
      end
    end
  end
end
