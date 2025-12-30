cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.114"
  sha256 arm:   "87c88502340dbf82e242a2f7af594938ffcaddef56895c0374fc29f4daa3f1f1", intel: "b837be1239d7fc0ea9250ae0d81243f3b3e9f7836804062fc70d16966c7a9f62"

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
