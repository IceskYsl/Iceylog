require 'rubygems'
require 'date'
require 'hpricot'
class ImWpXml
  def self.do_im
    puts "start------>"
    wp_xml_file  = '/source/github/jekyll-bootstrap.git/_import/iceskysl1sters.wordpress.2012-05-12_2.xml'
    doc = Hpricot::XML(File.read(wp_xml_file))
     (doc/:channel/:item).each_with_index do |item,i|
       title = item.at(:title).inner_text.strip
       date = DateTime.parse(item.at('wp:post_date').inner_text)
       date_string = date.year.to_s + "-" + date.month.to_s + '-' + date.day.to_s

       tags = (item/:category).select{|c| c['domain'] == 'post_tag'}.map{|c| c.inner_text}.reject{|c| c == 'Uncategorized'}.uniq.join(',')
       category_string = (item/:category).select{|c| c['domain'] == 'category'}.map{|c| c.inner_text}.reject{|c| c == 'Uncategorized'}.uniq.first
       content = item.at('content:encoded').inner_text
       if content
         content = content.gsub(/<code>/, '````')
         content = content.gsub(/<\/code>/, '```')
         content = content.gsub(/<pre>/, '``')
         content = content.gsub(/<pre lang="([^"]*)">/, '``')
         content = content.gsub(/<\/pre>/m, '```')
       end

       (1..3).each do |i|
          content = content.gsub(/<h#{i}>([^<]*)<\/h#{i}>/, ('#'*i) + ' \1')
       end
        puts "#{i}: #{title} : #{date_string} : #{category_string} : #{tags}"
        c = Category.where(:name => category_string).first
        c = Category.create(:name => category_string) unless c
        
        begin
          Post.create(:category_id => c.id, :title => title, :body => content ,:tag_list => tags || "notag",:created_at =>date, :state => 1 )
        rescue => e
          Rails.logger.error(" #{e}")
        end
     end
  end

  
end
