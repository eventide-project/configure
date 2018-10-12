module Configure
  module Controls
    module PositionalArgument
      class Example
        include Configure

        configure :some_attr_name

        def self.build(arg)
          new(arg)
        end

        attr_reader :arg

        def initialize(arg)
          @arg = arg
        end
      end

      module Optional
        class Example
          include Configure

          configure :some_attr_name

          def self.build(arg=nil)
            new(arg)
          end

          attr_reader :arg

          def initialize(arg=nil)
            @arg = arg
          end
        end
      end
    end
  end
end
