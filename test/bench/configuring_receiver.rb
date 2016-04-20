require_relative './bench_init'

context "Configuring a receiver" do
  control_value = 'some-value'
  receiver = OpenStruct.new

  context "No arguments" do
    control_class = Configure::Controls::Classes::NoArguments

    test "Class is configured as a dependency on the receiver" do
      control_class.configure receiver

      assert receiver.some_attr_name.is_a?(control_class)
    end
  end

  context "Positional argument" do
    context do
      control_class = Configure::Controls::Classes::PositionalArgument

      test do
        control_class.configure receiver, control_value

        assert receiver.some_attr_name.arg == control_value
      end

      test "Raises error if not supplied" do
        assert proc { control_class.configure receiver } do
          raises_error? ArgumentError
        end
      end
    end

    context "Optional" do
      control_class = Configure::Controls::Classes::PositionalArgument::Optional

      test "Does not raise error if not supplied" do
        refute proc { control_class.configure receiver } do
          raises_error? ArgumentError
        end
      end
    end
  end

  context "Keyword arguments" do
    context do
      control_class = Configure::Controls::Classes::KeywordArgument

      test do
        control_class.configure receiver, arg: control_value

        assert receiver.some_attr_name.arg == control_value
      end

      test "Raises error if not supplied" do
        assert proc { control_class.configure receiver } do
          raises_error? ArgumentError
        end
      end
    end

    context "Optional" do
      control_class = Configure::Controls::Classes::KeywordArgument::Optional

      test "Does not raise error if not supplied" do
        refute proc { control_class.configure receiver } do
          raises_error? ArgumentError
        end
      end
    end
  end
end
