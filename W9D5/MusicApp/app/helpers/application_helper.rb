module ApplicationHelper
    include ERB::Util

    def ugly_lyrics(lyrics)
        formated_lyrics = ""
        lyrics.lines.each do |line|
            formated_lyrics += "&#9835; #{h(line)}"
        end 

        "<pre>#{formated_lyrics}</pre>".html_safe
    end 
end
