# Configure

## Examples

### Activation

#### Default

```ruby
require 'configure'; Configure.activate default_factory_method: :build
```

#### Specifying a default factory method

```ruby
require 'configure'; Configure.activate default_factory_method: :build
```

### Usage

#### Defining a configure method

```ruby
class SomeClass
  configure :some_attr_name
end
```

#### Configuring a receiver

```ruby
receiver = OpenStruct.new

SomeClass.configure receiver

# Returns instance of SomeClass
receiver.some_attr_name
```

#### Specifying the attribute name on the receiver

```ruby
receiver = OpenStruct.new

SomeClass.configure receiver, attr_name: :other_attr_name

# Returns instance of SomeClass
receiver.other_attr_name
```
