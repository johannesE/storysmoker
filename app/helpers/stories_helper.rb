module StoriesHelper
    include ActsAsTaggableOn::TagsHelper

  def toggle_like_button(story, user)
    if user.flagged?(story, :like)
      #we already like this
      link_to "Unlike", like_stories_path(story)
    else
      # we don't like this yet
      link_to "like", like_stories_path(story)

    end

  end
end
