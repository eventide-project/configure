require_relative './bench_init'

context "Defining the configure method on a class" do
  receiver = OpenStruct.new

  context "Class has no arguments" do
    control_class = Configure::Controls::Configured::NoArguments.example

    test "Class is configured as a dependency on the receiver" do
      control_class.configure receiver

      assert receiver.some_dependency_name.is_a?(control_class)
    end
  end

  context "Class has positional arguments" do
    control_class = Configure::Controls::Configured::PositionalArguments.example
    positional_arg = 'a'
    optional_arg = 'b'

    test "Class is configured as a dependency and positional arguments are set" do
      control_class.configure receiver, positional_arg, optional_arg

      assert receiver.some_dependency_name.is_a?(control_class)
      assert receiver.some_dependency_name.positional_arg == positional_arg
      assert receiver.some_dependency_name.optional_arg == optional_arg
    end

    context "Optional positional argument is not passed in" do
      control_class.configure receiver, positional_arg

      test "Optional argument is nil" do
        assert receiver.some_dependency_name.optional_arg.nil?
      end
    end
  end

  context "Class has keyword arguments" do
    control_class = Configure::Controls::Configured::KeywordArguments.example
    required_keyword_arg = 'c'
    optional_keyword_arg = 'd'

    test "Class is configured as a dependency and keyword arguments are set" do
      control_class.configure receiver, required_keyword_arg: required_keyword_arg, optional_keyword_arg: optional_keyword_arg

      assert receiver.some_dependency_name.is_a?(control_class)
      assert receiver.some_dependency_name.required_keyword_arg == required_keyword_arg
      assert receiver.some_dependency_name.optional_keyword_arg == optional_keyword_arg
    end

    context "Optional keyword argument is not passed in" do
      control_class.configure receiver, required_keyword_arg: required_keyword_arg

      test "Optional keyword argument is nil" do
        assert receiver.some_dependency_name.optional_keyword_arg.nil?
      end
    end
  end
end
