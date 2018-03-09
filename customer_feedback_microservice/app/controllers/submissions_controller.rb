class SubmissionsController < ApplicationController
  def create

  end

  def index
    @submission = Submission.new
  end
end