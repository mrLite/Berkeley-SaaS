class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s
    attr_reader attr_name
    attr_reader attr_name+"_history"
    # class_eval <<-RUBY
    #   def #{attr_name}=(val)
    #     @#{attr_name} = val
    #     @#{attr_name}_history ||= [nil]
    #     @#{attr_name}_history << val
    #   end
    # RUBY
    define_method "#{attr_name}=" do |value|
      instance_variable_set("@#{attr_name}", value)
      history = instance_variable_get("@#{attr_name}_history")
      history ||= [nil]
      history << value
      instance_variable_set("@#{attr_name}_history", history)
    end
  end
end