class StorePurchase < Product
  # STI - Single table inheritance
  def available_online
    false
  end

  def available_store
    true
  end
end
