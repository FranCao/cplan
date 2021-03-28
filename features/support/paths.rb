module NavigationHelpers
    #   When /^I go to (.+)$/ do |page_name|
    def path_to(page_name)
      case page_name
        
      when /^the home page/ then '/home'

      when /^the create profile page for "(.*)"/ then "/students/#{Student.find_by_first_name($1).id}/edit"
      when /^the audit degree page for "(.*)"/ then "/students/#{Student.find_by_first_name($1).id}"
      when /^the schedule page for "(.*)"/ then '/schedule'
      when /^the audit degree page for "(.*)"/ then "/students/#{Student.find_by_first_name($1).id}/show"
      # Add more mappings here.
      # Here is an example that pulls values out of the Regexp:
      #
      #   when /^(.*)'s profile page$/i
      #     user_profile_path(User.find_by_login($1))
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