require "warpaint/parser"

describe Warpaint::Parser do
  DUMMY_INPUT_FILE = "dummy_input.netxml"

  it "should take a path for an input file in its constructor" do
    input_file = File.open(DUMMY_INPUT_FILE, "w+") { |f| f.write "test" }
    lambda { Warpaint::Parser.new(DUMMY_INPUT_FILE) }.should_not raise_error
    File.delete DUMMY_INPUT_FILE
  end
  
  it "should raise an error if no valid file is given" do
    lambda { Warpaint::Parser.new(DUMMY_INPUT_FILE) }.should raise_error "File not found: dummy_input.netxml"
  end
end
