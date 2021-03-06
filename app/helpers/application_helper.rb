module ApplicationHelper
  def bootstrap_class_for(flash_type)
    case flash_type
    when 'success'
      "alert-success" # Green
    when 'error'
      "alert-danger" # Red
    when 'alert'
      "alert-warning" # Yellow
    when 'notice'
      "alert-info" # Blue
    else
      flash_type.to_s
    end
  end

  def flash_message(type, text)
    flash[type] ||= []
    flash[type] << text
  end

  def render_flash
    rendered = []
    flash.each do |type, messages|
      messages.each do |m|
        rendered << render(:partial => 'partials/flash', :locals => {:type => type, :message => m}) unless m.blank?
      end
    end
    rendered.join('<br/>')
  end
end
