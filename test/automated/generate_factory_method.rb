require_relative './automated_init'

context "Generate the factory method if a block is supplied" do
  context "Default factory method name" do
    control_class = Class.new do
      extend Configure::Macro

      configure :some_attr_name do
        self.factory_method_called = true
        new
      end

      extend Controls::FactoryMethod::Proof
    end

    receiver = OpenStruct.new

    test "Factory method is defined" do
      assert(control_class.respond_to? :build)
    end
  end

  context "Specialized factory method name" do
    control_class = Class.new do
      extend Configure::Macro

      configure :some_attr_name, factory_method: :make do
        self.factory_method_called = true
        new
      end

      extend Controls::FactoryMethod::Proof
    end

    receiver = OpenStruct.new

    test "Factory method is defined" do
      assert(control_class.respond_to? :make)
    end
  end

  context "Factory method with args" do
    control_class = Class.new do
      extend Configure::Macro

      attr_accessor :arg1
      attr_accessor :arg2

      def initialize(arg1, arg2)
        @arg1 = arg1
        @arg2 = arg2
      end

      configure :some_attr_name do |arg1, arg2|
        self.factory_method_called = true
        new(arg1, arg2)
      end

      extend Controls::FactoryMethod::Proof
    end

    receiver = OpenStruct.new

    instance = control_class.configure receiver, 'value 1', 'value 2'

    test "Factory method is used to construct the class" do
      assert control_class.factory_method_called?
    end

    context "Args are used to instantiate the class" do
      test "arg1" do
        assert(instance.arg1 == 'value 1')
      end

      test "arg2" do
        assert(instance.arg2 == 'value 2')
      end
    end
  end
end
