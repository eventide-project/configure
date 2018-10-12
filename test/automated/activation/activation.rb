require_relative '../automated_init'

context "Activation" do
  receiver = OpenStruct.new

  cls = Class.new do
    Configure.activate(self)

    configure :some_attr_name

    def self.build
      new
    end
  end

  context "Receiver is Configured" do
    cls.configure(receiver)

    test "Instantiated object is set on receiver" do
      assert(receiver.some_attr_name.is_a?(cls))
    end
  end
end
