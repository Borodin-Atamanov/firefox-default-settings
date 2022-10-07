#!/usr/bin/bash
#Author dev@Borodin-Atamanov.ru
#License: MIT

target_config_dir="$(pwd)"

declare -g firefox_config_github_url='https://github.com/Borodin-Atamanov/firefox-default-settings.git'; # download chromium config from here

temp_dir="${TMPDIR:-/tmp}/ffx_temp_dir-$(date "+%F-%H-%M-%S")";
mkdir -pv "${temp_dir}";
echo "clone config from github";
git clone --verbose --progress --depth 1 "${firefox_config_github_url}" "${temp_dir}";
cd "${temp_dir}";

rsync --verbose --recursive --update --mkpath --copy-links --executability  --sparse --whole-file --delete-after --ignore-errors --exclude='.git' --exclude='.git*' --human-readable  --info=progress2 --progress --stats --itemize-changes "${temp_dir}/" "${target_config_dir}/"  | tr -d '\n'

find "${target_config_dir}/" -type d -exec chmod -v 0777 {} \;
find "${target_config_dir}/" -type f -exec chmod -v 0640 {} \;

chown  --changes --recursive  i:i "${target_config_dir}";

exit
