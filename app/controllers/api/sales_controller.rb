require 'impactAPI_service'

class Api::SalesController < ApplicationController

  def sales_flow
    response = ImpactAPIService.invoice_list
    sales_channel = Hash.new {}
    for invoice in response['content']['entities']
      country = invoice['address']['c']
      region = invoice['address']['r']
      if region == '-'
        region = invoice['address']['l']
      end
      if country == '-'
        if region == '-'
          country = 'unknown'
          region = 'unknown'
        else
          country = region
        end
      end
      total = invoice['total_due'] || invoice['total_paid'] || invoice['total_invoiced']

      unless sales_channel[country]
        # Initalise hash with key 'country'
        sales_channel[country] = Hash.new 0
      end
      sales_channel[country]['total'] += total
      unless region == 'unknown'
        sales_channel[country][region] += total
      end
    end

    render json: sales_channel
  end
end
