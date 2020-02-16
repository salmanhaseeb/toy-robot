require '../game.rb' 

describe ToyRobot do 
  context "With valid input" do 
      
    it "should return 0, 1, NORTH" do 
      tr = ToyRobot.new(["MOVE", "REPORT"], 0, 0, "NORTH")
      expect(tr.play).to eq ({x: 0, y: 1, face: "NORTH"})
    end

    it "should return 0, 1, NORTH" do 
      tr = ToyRobot.new(["LEFT", "REPORT"], 0, 0, "NORTH")
      expect(tr.play).to eq ({x: 0, y: 0, face: "WEST"})
    end

    it "should return 0, 1, NORTH" do 
      tr = ToyRobot.new(["MOVE", "MOVE", "LEFT", "MOVE", "REPORT"], 1, 2, "EAST")
      expect(tr.play).to eq ({x: 3, y: 3, face: "NORTH"})
    end

  end
end
