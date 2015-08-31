require 'impactAPI_service'

class Api::EmployeesController < ApplicationController

  def location
    response = ImpactAPIService.employee_list
    render json: response
  end

  def detail
    response = ImpactAPIService.employee_detail
    render json: response
  end
end
