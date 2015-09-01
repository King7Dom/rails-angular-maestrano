require 'impactAPI_service'

class Api::ImpactSampleController < ApplicationController

  def employee_list
    response = ImpactAPIService.employee_list
    render json: response
  end

  def employee_detail
    response = ImpactAPIService.employee_detail
    render json: response
  end

  def invoice_list
    response = ImpactAPIService.invoice_list
    render json: response
  end
end
