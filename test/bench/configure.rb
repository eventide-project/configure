require_relative './bench_init'

context "Defining the configure method on a class" do
  context "Class has no arguments" do
    control_class = Configure::Controls::Configured::NoArguments.example

    receiver = OpenStruct.new

    test "Class is configured as a dependency on the receiver" do
      control_class.configure receiver

      assert receiver.some_dependency_name.is_a?(control_class)
    end
  end
end
