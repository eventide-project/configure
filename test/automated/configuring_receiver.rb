require_relative "./automated_init"

context "Configuring Receiver" do
  control_value = "some-value"
  receiver = OpenStruct.new

  context "No Arguments" do
    control_class = Controls::NoArguments::Example

    test "Class is configured as a dependency on the receiver" do
      control_class.configure(receiver)

      assert(receiver.some_attr_name.is_a?(control_class))
    end
  end

  context "Positional Argument" do
    context do
      control_class = Controls::PositionalArgument::Example

      test do
        control_class.configure(receiver, control_value)

        assert(receiver.some_attr_name.arg == control_value)
      end

      test "Raises error if not supplied" do
        assert_raises(ArgumentError) do
          control_class.configure(receiver)
        end
      end
    end

    context "Optional" do
      control_class = Controls::PositionalArgument::Optional::Example

      test "Does not raise error if omitted" do
        refute_raises(ArgumentError) do
          control_class.configure(receiver)
        end
      end
    end
  end

  context "Keyword arguments" do
    context do
      control_class = Controls::KeywordArgument::Example

      test do
        control_class.configure(receiver, arg: control_value)

        assert(receiver.some_attr_name.arg == control_value)
      end

      test "Raises error if omitted" do
        assert_raises(ArgumentError) do
          control_class.configure(receiver)
        end
      end
    end

    context "Optional" do
      control_class = Controls::KeywordArgument::Optional::Example

      test "Does not raise error if not supplied" do
        refute_raises(ArgumentError) do
          control_class.configure(receiver)
        end
      end
    end
  end
end
