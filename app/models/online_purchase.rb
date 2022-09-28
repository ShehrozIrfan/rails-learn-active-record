class OnlinePurchase < Product
  # STI - Single table inheritance
  def available_online
    true
  end

  def available_store
    false
  end
end
