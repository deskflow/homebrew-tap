cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.48"
  sha256 arm:   "bb29bedde02056b60e5d7b131ead5a9e7990ea612465a93851231b05025a6fe5", intel: "42c2bccabcb8298ac34c6ba1eb8417a51435ae6765bb45a0db1c02e830224298"

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
