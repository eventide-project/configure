require_relative './bench_init'

context "Invoking macro does not override the macro itself" do
  control_class = Class.new do
    extend Configure::Macro

    configure :some_attr_name
  end

  test "Subsequent invocations of macro are not affected by previous invocations" do
    control_class.class_exec do
      configure :other_dependency
    end

    receiver = Struct.new(:other_dependency).new

    control_class.configure receiver

    assert receiver.other_dependency.is_a?(control_class)
  end
end
