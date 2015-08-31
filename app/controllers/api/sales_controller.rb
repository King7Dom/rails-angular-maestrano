require 'impactAPI_service'

class Api::SalesController < ApplicationController

  def sales_flow
    response = ImpactAPIService.invoice_list
    render json: response
  end
end
