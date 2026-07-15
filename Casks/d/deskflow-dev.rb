cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.314"
  sha256 arm:   "c530e7f5a241d8c96f9849c63fe9ad7470c893198dfe81b9c16a879576526d0f", intel: "cb7621b6c1321f2312ca54d9991ae455c8018750a123327370aa47dc52341066"

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
