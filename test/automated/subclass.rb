require_relative './automated_init'

context "Defining the configure method on a subclass" do
  control_class = Class.new(Controls::NoArguments::Example) do
    configure :other_attr_name
  end

  receiver = OpenStruct.new

  test "Subclass macro overrides parent class macro" do
    control_class.configure(receiver)

    assert(receiver.other_attr_name.is_a?(control_class))
  end
end
