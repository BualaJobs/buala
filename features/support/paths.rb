# features/support/paths.rb
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition
  #
  def path_to(page_name)
    case page_name
 
    when /^the home\s?page$/
      '/'

    when /^the published advertisement detail page$/
      '/advertisements/' + Advertisement.published.all.first.id.to_s

    when /^the not published advertisement detail page$/
      '/advertisements/' + Advertisement.where(published: false).first.id.to_s

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end
 
World(NavigationHelpers)