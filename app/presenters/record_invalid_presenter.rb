class RecordInvalidPresenter
  def to_hash
    ProblemDetails::Document.new(status: 500).to_h
  end
end
