class Unpurchasable < Product
  # STI - Single table inheritance
  def available_online
    false
  end

  def available_store
    false
  end
end
