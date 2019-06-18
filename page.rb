class Page
  def initialize(item)
    @item = item
  end

  def generate_hash_for_scrapbox
    hash = {
      title: @item[:title],
      lines: lines
    }

    return hash
  end

  private
  def lines
    original_link = "http://jigokuno.com/eid_#{@item[:eid]}.html"
    lines = []
    lines << @item[:title]
    image_url = @item[:image]
    lines << "[#{image_url}]"
    lines << ''
    @item[:body].split("\n").each do |line|
      lines << "#{line}"
    end
    lines << ''
    lines << 'code:埋め込みコード.md'
    lines << " [![惚れさせ#{@item[:id]} 「#{@item[:title]}」 #{@item[:body]}](#{@item[:image]})](#{original_link})"
    lines << ''
    lines << "[惚れさせ#{@item[:id]} #{original_link}] ｜ \##{@item[:character]}"
  end
end
