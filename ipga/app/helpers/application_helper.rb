# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  include LocalesSwitch::Helper

  def link_to_span(*args)
    name         = args.first
    options      = args.second || {}
    html_options = args.third

    url = url_for(options)

    if html_options
      html_options = html_options.stringify_keys
      href = html_options['href']
      convert_options_to_javascript!(html_options, url)
      tag_options = tag_options(html_options)
    else
      tag_options = nil
    end

    href_attr = "href=\"#{url}\"" unless href
    "<a #{href_attr}#{tag_options}><span>#{name || url}</span></a>"
  end

  def javascript_dir_include_tag(*sources)
    dir_name = sources.shift
    sources.unshift(
            Dir.entries(File.join(RAILS_ROOT, 'public', dir_name)).map do |file_name|
              File.join(dir_name, file_name) if file_name.end_with?('.js')
            end.compact.sort
    ).flatten!
    javascript_include_tag(*sources)
  end
end
