class Scraping

require "nokogiri"
require "open-uri"

@base_url = "https://ja.wikipedia.org"

# 画像の検索（県のロゴを検索）
def self.image_serch(url)
  doc = Nokogiri::HTML(open(@base_url+url))
  return doc.xpath("//a[@class = 'image']/img").attribute("src").value
end

def self.category_serch
  # 日本の都道府県カテゴリURL
  url = "/wiki/Category:%E6%97%A5%E6%9C%AC%E3%81%AE%E9%83%BD%E9%81%93%E5%BA%9C%E7%9C%8C"
  doc = Nokogiri::HTML(open(@base_url+url))
  doc.xpath("//div[@class = 'CategoryTreeItem']/a").each do |element|
  # 関係ないページを省く(県名の長さで排除)
  if element.text.length <= 4
    name = element.text
    image_url = image_serch(element[:href])
    link = element[:href]
    elements = Element.new(name: name, image_url: image_url, link: link , score: 1500)
    elements.save
  end
  end
end

category_serch
end