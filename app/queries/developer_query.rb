class DeveloperQuery
  include Pagy::Backend

  alias_method :build_pagy, :pagy

  attr_reader :options

  def initialize(options = {})
    @options = options
    @available_only = ActiveModel::Type::Boolean.new.cast(options[:available])
  end

  def available_only?
    !!@available_only
  end

  def pagy
    @pagy ||= initialize_pagy.first
  end

  def records
    @records ||= initialize_pagy.last
  end

  private

  def initialize_pagy
    records = Developer.most_recently_added.with_attached_avatar
    records = records.available if available_only?

    @pagy, @records = build_pagy(records)
  end

  # Needed for #pagy (aliased to #build_pagy) helper.
  def params
    options
  end
end
