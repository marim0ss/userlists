module UserDecorator
  def programming_status
    programming.delete_if(&:empty?).join(", ") if programming.is_a?(Array)
  end
end
