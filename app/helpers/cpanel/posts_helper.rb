module Cpanel::PostsHelper
  
  def format_topic_body(text)
    Rails.logger.info "==format_topic_body==#{text}"
    MarkdownTopicConverter.format(text)
  end
  
end
