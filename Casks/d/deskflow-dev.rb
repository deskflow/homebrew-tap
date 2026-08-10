cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.367"
  sha256 arm:   "6d638314778b5c14e4ad8a0192f15a7c3af9b40e655e595a6241416d850b7c5a", intel: "5202ca8c69210138d27ec3b1fd3402f8fd6bced882e40e8daac1d334423e5fe5"

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
