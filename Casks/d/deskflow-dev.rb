cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.406"
  sha256 arm:   "89f51ffb35476e1bff501f7ffdbdee2583ada331f74a0b9cf615a056919f15ff", intel: "b50f26a601c1fe65acbcbf8d7d3756c9df182b443ed1d55c42b9cc19e2898a15"

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-continuous-macos-#{arch}.dmg",
      verified: "github.com/deskflow/deskflow/"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  conflicts_with cask: "deskflow"

  depends_on macos: :monterey

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
