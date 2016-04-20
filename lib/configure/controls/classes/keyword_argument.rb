module Configure
  module Controls
    module Classes
      class KeywordArgument
        extend Configure::Macro

        configure :some_attr_name

        attr_reader :arg

        def initialize(arg:)
          @arg = arg
        end

        class Optional
          extend Configure::Macro

          configure :some_attr_name

          attr_reader :arg

          def initialize(arg: nil)
            @arg = arg
          end
        end
      end
    end
  end
end
