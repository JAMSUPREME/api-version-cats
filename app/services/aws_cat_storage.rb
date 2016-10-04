class AwsCatStorage
  # We moved some data elsewhere or something
  def get_aws_cat(cat)
    def cat.various_properties
      {
        "stuff" => "things",
        "variousStuffs" => [
          "cat",
          { "key" => "value" },
          45
        ]
      }
    end

    cat
  end
end