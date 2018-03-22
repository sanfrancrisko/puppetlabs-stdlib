#
# empty.rb
#
module Puppet::Parser::Functions
  newfunction(:empty, :type => :rvalue, :doc => <<-DOC
    Returns true if the variable is empty.
  DOC
             ) do |arguments|

    function_deprecation([:empty, 'This method is deprecated, this function is now shipped with Puppet in versions 5.5.0 and later. For more information please see Puppet 5.5.0 Release Notes.'])

    raise(Puppet::ParseError, "empty(): Wrong number of arguments given (#{arguments.size} for 1)") if arguments.empty?
    value = arguments[0]

    unless value.is_a?(Array) || value.is_a?(Hash) || value.is_a?(String) || value.is_a?(Numeric)
      raise(Puppet::ParseError, 'empty(): Requires either array, hash, string or integer to work with')
    end

    return false if value.is_a?(Numeric)
    result = value.empty?
    return result
  end
end

# vim: set ts=2 sw=2 et :
