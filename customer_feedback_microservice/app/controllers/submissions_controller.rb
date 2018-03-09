class SubmissionsController < ApplicationController
  def create
    @submission = Submission.new
    @submission.update_params(submission_params)
    @submission.save
    render plain: @submission.message
  end

  def index
    @submission = Submission.new
  end

  private

  def submission_params
    params.require(:submission).permit(:name,
                                       :business_name,
                                       :telephone_number,
                                       :email,
                                       :contact_time,
                                       :notes,
                                       :reference)
  end
end