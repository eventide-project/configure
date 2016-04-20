module Configure
  module Controls
    module Configured
      module KeywordArguments
        class Example
          extend Configure::Macro

          configure :some_dependency_name

          attr_reader :required_keyword_arg
          attr_reader :optional_keyword_arg

          def initialize(required_keyword_arg:, optional_keyword_arg: nil)
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

