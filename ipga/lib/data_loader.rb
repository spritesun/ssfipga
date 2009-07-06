module DataLoader
  def load_demo_data
    @fixtures = {}
    create_resources
    create_request
  end

  private

  def create_resources
    Resource.destroy_all
    10.times do
      Resource.create!(rand_attrs(:location, :department, :industry, :level, :official_grade, :strength, :owner => :user))
    end
  end

  def create_request
    Request.destroy_all
  end

  def rand_attrs(*attrs)
    attr_value_pairs = {}

    attrs.pop.each do |attr, value_class|
      attr_value_pairs[attr] = rand_fixture(value_class)
    end if attrs.last.is_a? Hash

    attrs.each do |attr|
      attr_value_pairs[attr] = rand_fixture(attr)
    end

    attr_value_pairs
  end

  def rand_fixture(class_name)
    @fixtures[class_name] ||= class_name.constantize.all
    @fixtures[class_name].rand
  end
end