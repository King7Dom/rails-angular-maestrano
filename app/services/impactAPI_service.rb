require 'rest-client'

module ImpactAPIService

  PROTOCOL = 'https'
  BASE_URL = 'api-impac-uat.maestrano.io/api/v1/get_widget'
  USERNAME = '72db99d0-05dc-0133-cefe-22000a93862b'
  PASSWORD = '_cIOpimIoDi3RIviWteOTA'

  def self.employee_list
    response = RestClient::Request.execute(
      url: "#{PROTOCOL}://#{BASE_URL}?engine=hr/employees_list&metadata[organization_ids][]=org-fbte",
      user: USERNAME,
      password: PASSWORD,
      method: :get,
      accept: :json,
      verify_ssl: false
    )
    puts response
    return response
  end
end
