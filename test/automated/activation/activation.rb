require_relative '../automated_init'

context "Activation" do
  receiver = OpenStruct.new

  context "Receiver is Configured" do
    Controls::ExampleClass.configure(receiver)

    test "Instantiated object is set on receiver" do
      refute(receiver.some_attr_name.nil?)
    end
  end
end
