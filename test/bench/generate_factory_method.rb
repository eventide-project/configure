require_relative './bench_init'

context "Generate the factory method if a block is supplied" do
  context "Default factory method name" do
    control_class = Class.new do
      extend Configure::Macro

      configure :some_attr_name do
        self.factory_method_called = true
        new
      end

      extend Configure::Controls::FactoryMethod::Proof
    end

    receiver = OpenStruct.new

    test "Factory method is used to instantiate the class" do
      control_class.configure receiver
      assert control_class.factory_method_called?
    end
  end

  context "Specialized factory method name" do
    control_class = Class.new do
      extend Configure::Macro

      configure :some_attr_name, factory_method: :make do
        self.factory_method_called = true
        new
      end

      extend Configure::Controls::FactoryMethod::Proof
    end

    receiver = OpenStruct.new

    test "Factory method is used to instantiate the class" do
      control_class.configure receiver
      assert control_class.factory_method_called?
    end
  end
end
