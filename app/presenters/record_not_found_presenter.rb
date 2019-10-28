class RecordNotFoundPresenter
  def to_hash
    ProblemDetails::Document.new(status: 404).to_h
  end
end
