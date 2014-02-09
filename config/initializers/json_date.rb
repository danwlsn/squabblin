class ActiveSupport::TimeWithZone
  def as_json(options = {})
    strftime('%H:%M, %d %B %Y')
  end
end