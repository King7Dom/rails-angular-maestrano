require 'rest-client'
require 'json'

module ImpactAPIService
  class << self

    PROTOCOL = 'https'
    BASE_URL = 'api-impac-uat.maestrano.io/api/v1/get_widget'
    USERNAME = '72db99d0-05dc-0133-cefe-22000a93862b'
    PASSWORD = '_cIOpimIoDi3RIviWteOTA'

    def employee_list
      url = "#{PROTOCOL}://#{BASE_URL}?engine=hr/employees_list&metadata[organization_ids][]=org-fbte"
      return JSON.parse request_impact_api url
    end

    def employee_detail
      url = "#{PROTOCOL}://#{BASE_URL}?engine=hr/employee_details&metadata[organization_ids][]=org-fbte"
      return JSON.parse request_impact_api url
    end

    def invoice_list
      url = "#{PROTOCOL}://#{BASE_URL}?engine=hr/employee_details&metadata[organization_ids][]=org-fbte&metadata[entity]=customers|suppliers"
      return JSON.parse request_impact_api url
    end

    private
    def request_impact_api(url)
      puts "Requesting url: #{url}"
      return RestClient::Request.execute(
        url: url,
        user: USERNAME,
        password: PASSWORD,
        method: :get,
        accept: :json,
        verify_ssl: false
      )
    end

  end
end
