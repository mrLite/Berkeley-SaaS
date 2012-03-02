class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s
    attr_reader attr_name
    attr_reader attr_name+"_history"
    class_eval <<-RUBY
      def #{attr_name}=(val)
        @#{attr_name} = val
        unless @#{attr_name}_history
          @#{attr_name}_history = [nil]
        end
        @#{attr_name}_history << val
      end
    RUBY
  end
end