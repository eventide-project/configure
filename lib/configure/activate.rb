module Configure
  def self.activate(target_class=nil, factory_method: nil, constructor: nil)
    target_class ||= Object

    unless constructor.nil?
      factory_method = constructor
    end

    macro_module = Configure::Macro

    return if target_class.is_a?(macro_module)

    target_class.extend(macro_module)

    target_class.default_factory_method = factory_method
  end
end
