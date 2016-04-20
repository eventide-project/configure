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

  context "Class has required arguments" do
    control_class = Configure::Controls::Configured::RequiredArguments.example
    required_arg = 'a'
    another_required_arg = 'b'

    test "Class is configured as a dependency and required arguments are set" do
      control_class.configure receiver, required_arg, another_required_arg

      assert receiver.some_dependency_name.is_a?(control_class)
      assert receiver.some_dependency_name.required_arg == required_arg
      assert receiver.some_dependency_name.another_required_arg == another_required_arg
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
        assert receiver.some_dependency_name.optional_keyword_arg == nil
      end
    end
  end
end
