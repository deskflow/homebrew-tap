cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.25.0.238"
  sha256 arm:   "3c4c4782e71d63f5872c472b598611df97e4f2855d7d3295e3b314203468c009", intel: "1726f6a64feeef74918e528b1a5183b7d82cf1e92077daca6f1d17fd9eb5d4ce"

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
