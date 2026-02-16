cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.260"
  sha256 arm:   "6d3b5c296ee5f950dbf9476027663d1d21e8d22c11b82dc00478c8f57d33befa", intel: "41f8aa7eac40f2b3f70c42d3a908d103baf5c4d9eb0dffcaae78766d5377dbba"

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
