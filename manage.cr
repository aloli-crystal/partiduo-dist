# SPDX-License-Identifier: AGPL-3.0-or-later

# Ligne de commande Marten de la distribution : binaire `partiduo-manage`
# (`migrate`, `provision`, `collectassets`…), ou `crystal run manage.cr --`.
require "./src/partiduo-dist"
require "./config/settings/base"
require "./config/settings/**"
require "./src/cli"

Marten.setup
Marten::CLI.run
