require '../game.rb' 

describe ToyRobot do 
  context "With valid input" do 
    it "should return 0, 1, NORTH" do 
      tr = ToyRobot.new(["MOVE", "REPORT"], 0, 0, "NORTH")
      expect(tr.play).to eq ({x: 0, y: 1, face: "NORTH"})
    end

    it "should return 0, 1, WEST" do 
      tr = ToyRobot.new(["LEFT", "REPORT"], 0, 0, "NORTH")
      expect(tr.play).to eq ({x: 0, y: 0, face: "WEST"})
    end

    it "should return 3, 3, NORTH" do 
      tr = ToyRobot.new(["MOVE", "MOVE", "LEFT", "MOVE", "REPORT"], 1, 2, "EAST")
      expect(tr.play).to eq ({x: 3, y: 3, face: "NORTH"})
    end
  end

  context "With invalid input" do 
    it "should return invalid input" do 
      tr = ToyRobot.new(["MOVE", "REPORT"], 10, 10, "NORTH")
      expect(tr.play).to eq ("invalid command")
    end

    it "should return invalid input" do 
      tr = ToyRobot.new(["REPORT"], 10, 10, "NORTH")
      expect(tr.play).to eq ("invalid command")
    end
  end
end
