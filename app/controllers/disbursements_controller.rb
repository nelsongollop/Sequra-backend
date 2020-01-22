class DisbursementsController < ActionController::API
  def week
    if params[:day]
      day = params[:day].to_date
      disbursements = Disbursement.where(created_at: day..(day + 7.days))
      if params[:merchant_id]
        disbursements.where(merchant_id: params[:merchant_id])
      end
      render json: disbursements
    else
      render status: :bad_request
    end
  end
end
