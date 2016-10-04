class CatService

  # Normal get
  def get(id)
    Cat.find_by(id: id)
  end

  # Could have many dependencies to retrieve, etc...
  def get_flat(id)
    Cat.includes(:owner).find_by(id: id)
  end

  # We moved some data elsewhere or something
  def get_v2(id)
    cat = get(id)

    AwsCatStorage.new.get_aws_cat(cat)
  end

  # Flat V2
  def get_v2_flat(id)
    cat = get_flat(id)

    AwsCatStorage.new.get_aws_cat(cat)
  end
end