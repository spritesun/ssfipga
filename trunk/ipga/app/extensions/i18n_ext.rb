Object.class_eval do
  def t(key, options = {})
    I18n.t(key, options)
  end
end