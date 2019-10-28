class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid

  def render_record_not_found(exception)
    logger.error("message: #{exception.message}")

    render status: :not_found, json: RecordNotFoundPresenter.new.to_json
  end

  def render_record_invalid(exception)
    logger.error("message: #{exception.message}")

    render status: :internal_server_error, json: RecordInvalidPresenter.new.to_json
  end
end
