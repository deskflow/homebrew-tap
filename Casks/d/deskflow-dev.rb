cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.205"
  sha256 arm:   "272e379381eb0c3d2c69cd807377d72952b7f70ae95b8b02b27d01fee696442b", intel: "2666c69e9c0241cfd48735561dc1d3b643385cf965bf1ff7cc57056e590f5fc9"

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
