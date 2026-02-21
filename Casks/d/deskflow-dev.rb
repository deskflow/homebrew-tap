cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.18"
  sha256 arm:   "b49a5ffdc0d10b71456dfdee86acd8c80c385dc29afcc6dfc96530a331b95a42", intel: "48a7eaeaf18f651857138979ecbdba4187db84430c0966f6e5c5034c734f1b73"

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
