require_relative './bench_init'

context "Defining the configure method on a subclass" do
  control_class = Class.new Configure::Controls::Classes::NoArguments do
    configure :other_dependency
  end

  receiver = OpenStruct.new

  test "Subclass macro overrides parent class macro" do
    control_class.configure receiver

    assert receiver.other_dependency.is_a?(control_class)
  end
end
