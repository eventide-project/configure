module Configure
  module Controls
    module Classes
      class NoArguments
        Configure.activate(self)

        configure :some_attr_name

        singleton_class.send :alias_method, :build, :new
      end
    end
  end
end
