module Configure
  module Controls
    module Configured
      module WithArguments
        class Example
          extend Configure::Macro

          configure :some_dependency_name

          attr_reader :required_positional_arg
          attr_reader :optional_positional_arg
          attr_reader :required_keyword_arg
          attr_reader :optional_keyword_arg

          def initialize(required_positional_arg, optional_positional_arg=nil, required_keyword_arg:, optional_keyword_arg: nil)
            @required_positional_arg = required_positional_arg
            @optional_positional_arg = optional_positional_arg
            @required_keyword_arg = required_keyword_arg
            @optional_keyword_arg = optional_keyword_arg
          end
        end

        def self.example
          Example
        end
      end
    end
  end
end

