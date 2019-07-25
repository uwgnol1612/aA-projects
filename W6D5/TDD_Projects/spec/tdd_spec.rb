require "tdd"

describe "#my_uniq" do
    it "removes duplicates from array" do
       array = [1, 2, 1, 3, 3]
       expect(array.my_uniq).to eq([1, 2, 3]) 
    end

    it "returns a new array" do
        array = [1, 2, 1, 3, 3]
        expect(array.my_uniq).not_to be(array)
    end

end

describe "#two_sum" do 
    it "finds pairs that sum to zero" do   
        array = [-1, 0, 2, -2, 1]
        expect(array.two_sum).to eq([[0,4], [2,3]])
    end 
    
    it "should return pairs in order" do 
        array = [-1, 0, 2, -2, 1]
        expect(array.two_sum).not_to be([[2,3],[0,4]])
    end 
end

describe "#my_transpose" do
    it "it correctly transposes a matrix" do
        array_1 = [
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8]
            ]
        array_2 = [
            [0, 1, 2],
            [3, 4, 5],
            ]
        expect(array_1.my_transpose).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
        expect(array_2.my_transpose).to eq([[0,3], [1,4], [2,5]])
    end
    it "returns an empty array if the given array is empty" do
        array = []
        expect(array.my_transpose).to eq([])
    end

end


describe "#stock_picker" do  
    it "purchase day comes before sell day" do
        stock_prices = [100, 150, 90, 200]
        res = stock_picker(stock_prices)
        expect(res[0] < res[1]).to be true 
    end 

    it "picks the most profitable pair of days" do   
        stock_prices = [100, 150, 90, 200]
        res = stock_picker(stock_prices)
        expect(res).to eq([2,3])
    end 

end 