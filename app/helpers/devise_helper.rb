module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map do |msg|
      content_tag(:li, msg)
    end.join

    sentence = I18n.t('errors.messages.not_saved',
                      count: resource.errors.count,
                      resource: resource.class.model_name.human.downcase)

    html = error_html(sentence, messages)
    html.html_safe
  end

  private

  def error_html(sentence, messages)
    <<-HTML
       <div data-alert class="alert-box warning">
         <h5>#{ sentence }</h5>
         <ul>
           #{ messages }
         </ul>
         <a href="#" class="close">&times;</a>
       </div>
    HTML
  end
end
