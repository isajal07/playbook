# Taken from https://github.com/thoughtbot/middleman-aria_current
# It adds a fix where paths with trailing slash don't properly match. See
# https://github.com/thoughtbot/middleman-aria_current/pull/18

module CurrentLinkHelper
  FILE_EXTENSION = /\.(\w+)$/

  def current_link_to(*arguments, aria_current: "page", **options, &block)
    if block_given?
      text = capture(&block)
      path = arguments[0]
    else
      text = arguments[0]
      path = arguments[1]
    end

    link_options = options
    current_path = current_page.url.to_s.chomp('/').gsub(FILE_EXTENSION, "")

    if current_path == path
      link_options.merge!("aria-current" => aria_current)
    end

    link_to(text, path, link_options)
  end
end
