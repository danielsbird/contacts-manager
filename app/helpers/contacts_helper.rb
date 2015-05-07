module ContactsHelper

    def gravatar_for(contact)
        gravatar_image_tag(@contact.email, :alt => "#{@contact.first_name} #{@contact.last_name}")
    end
end
