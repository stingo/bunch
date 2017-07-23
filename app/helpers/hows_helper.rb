module HowsHelper


#include ActsAsTaggableOn::TagsHelper



	def embed(video)
    youtube_id = video.split("=").last
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}", width: "640", height: "360"  )




    
  end
end
