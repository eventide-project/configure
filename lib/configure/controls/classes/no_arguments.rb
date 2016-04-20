module Configure
  module Controls
    module Classes
      class NoArguments
        extend Configure::Macro

        configure :some_attr_name
      end
    end
  end
end
