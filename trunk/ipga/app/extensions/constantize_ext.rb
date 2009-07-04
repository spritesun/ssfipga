Symbol.class_eval do
  def constantize
    self.to_s.camelize.constantize
  end
end