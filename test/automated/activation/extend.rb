require_relative '../automated_init'

context "Activation" do
  context "Extend" do
    receiver = OpenStruct.new

    context "Receiver is Configured" do
      Configure::Controls::Extended::Example.configure(receiver)

      test "Instantiated object is set on receiver" do
        refute(receiver.some_attr_name.nil?)
      end
    end
  end
end
