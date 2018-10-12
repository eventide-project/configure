require_relative '../automated_init'

context "Activation" do
  context "Optional Constructor Parameter" do
    receiver = OpenStruct.new

    constructor_method = Controls::FactoryMethod.name

    cls = Class.new do
      Configure.activate(self, constructor: constructor_method)

      configure :some_attr

      extend Controls::FactoryMethod
      extend Controls::FactoryMethod::Proof
    end

    context "Receiver is Configured" do
      cls.configure(receiver)

      test "Constructor method was invoked" do
        assert(cls.factory_method_called?)
      end
    end
  end
end
