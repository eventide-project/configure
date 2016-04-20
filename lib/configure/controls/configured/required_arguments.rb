module Configure
  module Controls
    module Configured
      module PositionalArguments
        class Example
          extend Configure::Macro

          configure :some_dependency_name

          attr_reader :positional_arg
          attr_reader :optional_arg

          def initialize(positional_arg, optional_arg=nil)
            @positional_arg = positional_arg
            @optional_arg = optional_arg
          end
        end

        def self.example
          Example
        end
      end
    end
  end
end
