cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.24.0.106"
  sha256 arm:   "a1ebeb7cdf7a35e1f261d3319e03cdeda5c3a075ae79362c88f1a05376c8a156", intel: "75a1a8c036734f237a6041423d869f08e1caee6cad9a506a23e7ee1b6d1e4ef1"

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
