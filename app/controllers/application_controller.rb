require 'google/apis/people_v1'
require 'google/api_client/client_secrets.rb'

class ApplicationController < ActionController::Base
  People = Google::Apis::PeopleV1

  add_flash_types :info, :error, :warning
  before_action :authenticate_user!

  def contacts
    secrets = Google::APIClient::ClientSecrets.new(
      {
        "web" =>
          {
            "access_token" => current_user.token,
            "refresh_token" => current_user.refresh_token,
            "client_id" => Rails.application.secrets[:google_client_id],
            "client_secret" => Rails.application.secrets[:google_client_secret]
          }
      }
    )
    service = People::PeopleServiceService.new
    service.authorization = secrets.to_authorization
    response = service.list_person_connections(
      'people/me',
       person_fields: ['names', 'emailAddresses', 'phoneNumbers']
    )
    render json: response
  end
end