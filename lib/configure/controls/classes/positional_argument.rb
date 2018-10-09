module Configure
  module Controls
    module Classes
      class PositionalArgument
        Configure.activate(self)

        configure :some_attr_name

        singleton_class.send :alias_method, :build, :new

        attr_reader :arg

        def initialize(arg)
          @arg = arg
        end

        class Optional
          Configure.activate(self)

          configure :some_attr_name

          singleton_class.send :alias_method, :build, :new

          attr_reader :arg

          def initialize(arg=nil)
            @arg = arg
          end
        end
      end
    end
  end
end
