class AdminController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "Hardik91"
  layout 'admin'

  def index
    @state_count = State.count
    @region_count = Region.count
    @industry_count = Industry.count
    @sub_industry_count = SubIndustry.count
    @worker_count = Worker.count
  end
end
