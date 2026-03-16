cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.86"
  sha256 arm:   "efd5908dc880a08e9d3270b3b122743a54fade3623e12bbf76e1182e2cfb3b8e", intel: "de0b6f6db84ea1528442984f4327d4596cea0482772a014a5c7226f6986a8153"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-continuous-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow"

  depends_on macos: ">= :monterey"

  app "Deskflow.app"

  postflight do
    system_command "xattr",
                   args: [
                     "-c", "#{appdir}/Deskflow.app"
                   ]
  end

  zap trash: [
     "~/Library/Saved Application State/Deskflow.savedState",
    "~/Library/Application Support/Deskflow",
  ]
end
