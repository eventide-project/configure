require_relative './bench_init'

context "Configuring classes with factory method" do
  context "factory_method parameter" do
    control_class = Class.new do
      extend Configure::Macro
      configure :some_attr_name, factory_method: :make

      extend Configure::Controls::FactoryMethod
      extend Configure::Controls::FactoryMethod::Proof
    end

    receiver = OpenStruct.new

    test "Factory method is used to instantiate the class" do
      control_class.configure receiver

      assert control_class.factory_method_called?
    end
  end

  context "constructor parameter" do
    control_class = Class.new do
      extend Configure::Macro
      configure :some_attr_name, constructor: :make
      extend Configure::Controls::FactoryMethod
      extend Configure::Controls::FactoryMethod::Proof
    end

    receiver = OpenStruct.new

    test "Constructor is used to instantiate the class" do
      control_class.configure receiver

      assert control_class.factory_method_called?
    end
  end
end
