class RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      if resource.persisted?
        sign_up(resource_name, resource)

        
        return redirect_to new_profile_path
      end
    end
  end
end