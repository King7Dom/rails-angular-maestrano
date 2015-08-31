require 'impactAPI_service'

class Api::EmployeesController < ApplicationController

  def location
    response = ImpactAPIService.employee_list
    work_locations = Hash.new 0
    for employee in response['content']['employees']
      puts employee
      for work_location in employee['work_locations']
        unless work_location['id'].empty?
          work_locations[work_location['id']] += 1
        end
      end
    end

    render json: work_locations
  end

  def detail
    response = ImpactAPIService.employee_detail
    render json: response
  end
end
