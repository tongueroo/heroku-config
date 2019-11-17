describe HerokuConfig::CLI do
  before(:all) do
    @args = "APP --noop"
  end

  describe "heroku-config" do
    it "aws-rotate" do
      out = execute("exe/heroku-config aws-rotate #{@args}")
      expect(out).to include("NOOP: Updating access key for user: fakeuser")
    end

    it "aws-rotate-all" do
      out = execute("exe/heroku-config aws-rotate-all spec/fixtures/heroku-apps.txt")
      expect(out).to include("NOOP")
    end
  end
end
