module ActsAsTaggableOn
  module TagsHelper
    # See the wiki for an example using tag_cloud.
    def tag_cloud(taggings, classes)
      return [] if taggings.empty?

      max_count = taggings.sort_by(&:frequency).last.frequency.to_f

      taggings.each do |tagging|
        tag = tagging.tag
        index = ((tagging.frequency/ max_count) * (classes.size - 1))
        yield tag, classes[index.nan? ? 0 : index.round]
      end
    end
  end
end
