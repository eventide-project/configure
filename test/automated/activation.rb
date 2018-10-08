require_relative './automated_init'

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

  context "Specifying the factory method name" do
    test "factory_method parameter" do
      cls = Class.new do
        extend Configure::Controls::FactoryMethod
        extend Configure::Controls::FactoryMethod::Proof
      end

      Configure.activate cls, factory_method: :make
      cls.configure :some_attr_name

      cls.configure receiver

      assert cls.factory_method_called?
    end

    test "constructor parameter" do
      cls = Class.new do
        extend Configure::Controls::FactoryMethod
        extend Configure::Controls::FactoryMethod::Proof
      end

      Configure.activate cls, constructor: :make
      cls.configure :some_attr_name

      cls.configure receiver

      assert cls.factory_method_called?
    end
  end
end
