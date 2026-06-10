cask "deskflow-dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.236"
  sha256 arm:   "fb1fd0cc748e589bc5bd40ac9214a4d3f26b5be8e6ce528c340313314d5cbe0c", intel: "bb7111ecf3118d96cc0449a758b92b5a15e965576112006bb30b1c4be1d67f3c"

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
