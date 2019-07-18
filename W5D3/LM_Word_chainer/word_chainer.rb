class WordChainer
    def initialize
        @dictionary = File.readlines("dictionary.txt").map(&:chomp)
    end 

    def adjacent_words(word)
        words = []
        word_of_equal_length = @dictionary.select {|ele| ele.length == word.length}
        
        (0..word.length-1).each do |i|
          dup_word = word.dup
          dup_word[i] = "*"
          word_of_equal_length.each do |each_word|
            each_word_dup = each_word.dup
            each_word_dup[i] = "*"
            if dup_word == each_word_dup
                words << each_word
            end
          end 
        end  
        words 
    end 

    def run(source, target)
        @current_words = [source]
        @all_seen_words = {source => nil}
        until @current_words.empty?
            @current_words = explore_current_words(@current_words)
        end
        build_path(target)
    end 

    def explore_current_words(current_words)
        new_current_words = []
        current_words.each do |current_word|
            adjacent_words(current_word).each do |adjacent_word|
                next if @all_seen_words.has_key?(adjacent_word)
                @all_seen_words[adjacent_word] = current_word
                new_current_words << adjacent_word
            end
        end
        new_current_words
    end 

    def build_path(target)
        path = []
        last_word = @all_seen_words[target]
        until last_word.nil?
            path << last_word
            last_word = @all_seen_words[last_word]
        end 
        p path.reverse << target 
    end 

end

game = WordChainer.new 
game.run("duck", "ruby")



