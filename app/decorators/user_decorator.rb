module UserDecorator
  def programming_status
    programming.delete_if(&:empty?).join(", ")
  end
end
