cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0.100"
  sha256 arm:   "90b785e50eaf329c05b2479dfccc115f7f8bc80b53df1cf982817de0dfa4667d", intel: "944298224fac7bc150cd1b90a27cc99f5e828f1c893b074b693dd4c0476dbe4f"

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
