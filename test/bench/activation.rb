require_relative './bench_init'

context "Activating the configure macro" do
  receiver = OpenStruct.new

  test "Configure macro is defined on the class" do
    cls = Class.new do
      Configure.activate self
      configure :some_attr_name
      singleton_class.send :alias_method, :build, :new
    end

    cls.configure receiver

    assert receiver.some_attr_name.is_a?(cls)
  end

  test "Factory method can be supplied" do
    cls = Class.new do
      extend Configure::Controls::FactoryMethod
    end

    Configure.activate cls, factory_method: :make
    cls.configure :some_attr_name

    cls.configure receiver

    assert cls.factory_method_called?
  end
end
