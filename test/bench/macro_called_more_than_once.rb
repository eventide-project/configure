require_relative './bench_init'

context "Macro is called more than once" do
  test "The last invocation of the macro is set" do
    control_class = Configure::Controls::Configured::Twice.example
    receiver = OpenStruct.new

    control_class.configure receiver

    assert receiver.some_dependency_name.nil?
    assert receiver.some_other_dependency_name.is_a?(control_class)
  end
end
