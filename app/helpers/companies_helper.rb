module CompaniesHelper





	def embed(video1)
    youtube_id = video1.split("=").last
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}", width: "640", height: "360"  )




end
end
