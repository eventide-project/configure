require_relative './bench_init'

context "Defining the configure method on a subclass" do
  test "Subclass macro overrides parent class macro" do
    control_class = Configure::Controls::Configured::Subclass.example
    receiver = OpenStruct.new

    control_class.configure receiver

    assert receiver.some_subclass_dependency_name.is_a?(control_class)
  end
end
