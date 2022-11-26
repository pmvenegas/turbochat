# Use Bootstrap form error indicators
ActionView::Base.field_error_proc = proc do |html_tag, instance|
  html_tag.gsub("form-control", "form-control is-invalid").html_safe
end
