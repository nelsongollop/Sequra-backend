class DisbursementsController < ActionController::API
  def week
    if params[:day]
      disbursements = Disbursement.find_by(created_at: day..(day + 7.days))
      if params[:merchant_id]
        disbursements.where(merchant_id: params[:merchant_id])
      end
      render json: disbursements
    else
      render status: :bad_request
    end
  end
end
