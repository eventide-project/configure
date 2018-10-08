require_relative './automated_init'

context "Invoking macro does not override the macro itself" do
  control_class = Class.new do
    extend Configure::Macro

    configure :some_attr_name
    singleton_class.send :alias_method, :build, :new
  end

  test "Subsequent invocations of macro are not affected by previous invocations" do
    control_class.class_exec do
      configure :other_attr_name
    end

    receiver = Struct.new(:other_attr_name).new

    control_class.configure receiver

    assert receiver.other_attr_name.is_a?(control_class)
  end
end
