describe HerokuConfig::CLI do
  before(:all) do
    @args = "APP --noop"
  end

  describe "heroku-config" do
    it "aws-rotate" do
      out = execute("exe/heroku-config aws-rotate #{@args}")
      puts out
      expect(out).to include("NOOP: Updating access key for user: fakeuser")
    end
  end
end
