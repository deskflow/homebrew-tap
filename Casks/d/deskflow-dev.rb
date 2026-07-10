cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.309"
  sha256 arm:   "3a1c74b6e367e7c304571c10392e9793434c18ab455b8652bb32376aca115b7f", intel: "538fc40ee0df813b7771ad3bac3f5232d9cd6a16491c0f7bea2866f9fd43064f"

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
