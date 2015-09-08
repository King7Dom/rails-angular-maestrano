
# Overview

This was a project done for using the Maestrano sample Impact API. It uses a ruby backend to provide a REST API service for a web frontend to consume, which is AngularJS in this case. It uses `angular-material` for material design and flexbox support, and `angular-chartist` to provide basic chart presentation.

# Setup Ruby Environment

* The ruby backend is built on ruby 2.2.2 and rails 4.2.4. I used `rbenv` to control my ruby version, feel free to use other tools to setup. `gem install rails -v 4.2` to install rails
* Once ruby is setup, run `bundle install` to install the require gems

# Setup front end dependencies

This project uses bower to maintain front end dependencies.

To setup any missing tools `npm install -g bower`. You will need `npm`, which can be install through `brew`

* Run `bower install` to install all dependencies.
* Components should be located at `vendor/assets/bower_components`. I have configured rails to expose `bower_components` to the asset pipeline from this location.

# Start the App
`rails server` at the root directory.
Open `localhost:3000` and you should see the Angular frontend with the employees location and sales flow widget.

# Details

## Routes
In additional to the angular frontend, you can access the API that the angular uses through:
* `/api/employeesloc`- which will show all employess work location, used by the employees-location directive. This will return a `JSON` format of the data
* `/api/salesflow` - which will show all sales invoice, grouped by countries and regions, used by the sales-flow directive. This will return a `JSON` format of the data

I have also provided a sample API that basically passes through the Impact API responses that the service gets from the API
* `/api/impact/employeelist`
* `/api/impact/employeedetail`
* `/api/impact/invoicelist`
