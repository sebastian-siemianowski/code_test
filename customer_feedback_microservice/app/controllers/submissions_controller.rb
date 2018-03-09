class SubmissionsController < ApplicationController
  def create
    @submission = Submission.new
    @submission.update_params(submission_params)
    if @submission.save
      render plain: @submission.message
    else
      flash[:error] = @submission.errors.full_messages
    end

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