require_relative "../automated_init"

context "Activation" do
  context "Optional Factory Method Parameter" do
    receiver = OpenStruct.new

    factory_method = Controls::FactoryMethod.name

    cls = Class.new do
      Configure.activate(self, factory_method: factory_method)

      configure :some_attr

      extend Controls::FactoryMethod
      extend Controls::FactoryMethod::Proof
    end

    context "Receiver is Configured" do
      cls.configure(receiver)

      test "Factory method was invoked" do
        assert(cls.factory_method_called?)
      end
    end
  end
end
