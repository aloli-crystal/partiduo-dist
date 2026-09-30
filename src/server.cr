# SPDX-License-Identifier: AGPL-3.0-or-later

# Serveur HTTP d'une instance Partiduo : binaire `partiduo-server`. Réglages
# de production de `partiduo-ui-bulma` (MARTEN_SECRET_KEY,
# MARTEN_ALLOWED_HOSTS, DATABASE_URL…), plus les applications des extensions.
require "./partiduo-dist"
require "../config/settings/base"
require "../config/settings/**"

Marten.start
