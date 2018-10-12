module Configure
  module Controls
    module KeywordArgument
      class Example
        include Configure

        configure :some_attr_name

        def self.build(arg:)
          new(arg: arg)
        end

        attr_reader :arg

        def initialize(arg:)
          @arg = arg
        end
      end

      module Optional
        class Example
          include Configure

          configure :some_attr_name

          def self.build(arg: nil)
            new(arg: arg)
          end

          attr_reader :arg

          def initialize(arg: nil)
            @arg = arg
          end
        end
      end
    end
  end
end
