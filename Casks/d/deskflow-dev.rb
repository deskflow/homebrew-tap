cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.100"
  sha256 arm:   "f08caeba0b3722d3062672bc0d0282c03214fc3637a13c4d2dff9d8cab7ab9f3", intel: "a777bc61b968cbf7014c928baa20decc44cce178846e62fc1801f0d96f175c0b"

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
