cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.19.0.191"
  sha256 arm:   "07f58a60e012414bff04296a62d61fda0e16d131bde2fb19522f684bb00aaf67", intel: "8aae889eec41a277f7990df9c7803ce8a78e021e2ef6291f0e56a74bdcacc322"

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
