class Search
  attr_reader :term
  def initialize(term:)
    @term = term
  end

  def results
    PostSearchQuery.new(term: "#{term}").to_relation
  end

  def to_partial_path
    "search/search"
  end
end
