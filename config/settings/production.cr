# SPDX-License-Identifier: AGPL-3.0-or-later

# Fichiers lus à l'exécution, rangés à côté des programmes installés.
#
# Marten lit les gabarits et les traductions de chaque application dans son
# répertoire source, chemin fixé à la compilation, qui n'existe plus une fois
# le programme installé par un paquet. Le paquet les collecte
# (`partiduo-manage collectartifacts`) dans `share/partiduo/artifacts`, et les
# fichiers statiques (`collectassets`) dans `share/partiduo/assets`, à côté de
# `bin/` : chaque version installée (partiduo-app, partiduo-app-devel) a son
# propre répertoire, et ses programmes y retrouvent leurs fichiers sans
# réglage. Sans ces répertoires (développement), rien ne change.
# `PARTIDUO_ARTIFACTS_ROOT` et `PARTIDUO_ASSETS_ROOT` restent prioritaires.
Marten.configure :production do |config|
  share = Process.executable_path.try { |path| File.expand_path(File.join(File.dirname(path), "..", "share", "partiduo")) }

  artifacts = ENV["PARTIDUO_ARTIFACTS_ROOT"]? || share.try { |dir| File.join(dir, "artifacts") }
  config.root_path = artifacts if artifacts && Dir.exists?(artifacts)

  unless ENV.has_key?("PARTIDUO_ASSETS_ROOT")
    assets = share.try { |dir| File.join(dir, "assets") }
    config.assets.root = assets if assets && Dir.exists?(assets)
  end
end
