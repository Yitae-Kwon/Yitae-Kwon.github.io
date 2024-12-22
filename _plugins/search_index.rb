require 'json'

Jekyll::Hooks.register :site, :post_write do |site|
  search_index = []

  # 모든 포스트의 정보를 담을 배열 생성
  site.posts.docs.each do |post|
    search_index << {
      "title" => post.title,
      "url" => post.url,
      "content" => post.excerpt
    }
  end

  # 검색 JSON 파일을 생성
  File.open(File.join(site.dest, "search.json"), "w") do |f|
    f.write(JSON.pretty_generate(search_index))
  end
end