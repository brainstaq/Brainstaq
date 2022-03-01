module TimeHelper
  def format_time(time, format = "yyyy-MM-dd'T'HH:mm:ss.SSSxxx")
    content_tag(
      :span,
      time,
      data: { "time-format": format, "time-value": time.to_json }
    )
  end

  def relative_time(time)
    format_time(time, :relative)
  end

  def year(time)
    format_time(time, "yyyy")
  end
end