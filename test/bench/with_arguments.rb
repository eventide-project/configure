require_relative './bench_init'

context "Class has arguments" do
  control_class = Configure::Controls::Configured::WithArguments.example
  required_positional_arg = Configure::Controls::Configured::WithArguments.required_positional_arg
  optional_positional_arg = Configure::Controls::Configured::WithArguments.optional_positional_arg
  required_keyword_arg = Configure::Controls::Configured::WithArguments.required_keyword_arg
  optional_keyword_arg = Configure::Controls::Configured::WithArguments.optional_keyword_arg

  receiver = OpenStruct.new

  test "Class is configured as a dependency and positional arguments are set" do
    control_class.configure receiver, required_positional_arg, optional_positional_arg, required_keyword_arg: required_keyword_arg, optional_keyword_arg: optional_keyword_arg

    assert receiver.some_dependency_name.is_a?(control_class)
    assert receiver.some_dependency_name.required_positional_arg == required_positional_arg
    assert receiver.some_dependency_name.optional_positional_arg == optional_positional_arg
    assert receiver.some_dependency_name.required_keyword_arg == required_keyword_arg
    assert receiver.some_dependency_name.optional_keyword_arg == optional_keyword_arg
  end

  context "Required positional argument is not passed in" do
    test "Raises error" do
      assert proc { control_class.configure receiver, required_keyword_arg: required_keyword_arg, optional_keyword_arg: optional_keyword_arg } do
        raises_error? ArgumentError
      end
    end
  end

  context "Optional positional argument is not passed in" do
    control_class.configure receiver, required_positional_arg, required_keyword_arg: required_keyword_arg, optional_keyword_arg: optional_keyword_arg

    test "Optional argument is nil" do
      assert receiver.some_dependency_name.optional_positional_arg.nil?
    end
  end

  context "Required keyword argument is not passed in" do
    test "Raises error" do
      assert proc { control_class.configure receiver, required_positional_arg, optional_positional_arg } do
        raises_error? ArgumentError
      end
    end
  end

  context "Optional keyword argument is not passed in" do
    control_class.configure receiver, required_positional_arg, optional_positional_arg, required_keyword_arg: required_keyword_arg

    test "Optional keyword argument is nil" do
      assert receiver.some_dependency_name.optional_keyword_arg.nil?
    end
  end
end
