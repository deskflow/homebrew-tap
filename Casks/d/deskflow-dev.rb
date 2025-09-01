cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.23.0.178"
  sha256 arm:   "667911b83838c151b05cdbe7cef9ac9607049f852e7b81c7f677e6043d3cdb0e", intel: "d4487a4e94277cd1e5e678638456e1577a37556a51eabbeaeb2346c830be78f0"

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
