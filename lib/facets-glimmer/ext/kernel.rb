if RUBY_ENGINE == 'rubymotion'
  def require(*args, &block)
    # No Op (just a shim for RubyMotion)
  end
  def require_relative(*args, &block)
    # No Op (just a shim for RubyMotion)
  end
end
