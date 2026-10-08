# Firefox Default Settings

Default configuration for Firefox installed from the official Mozilla apt
repository during a Pyntara provisioning run.

The repository stores browser defaults used on a fresh machine: the default
search engine, a few user-changeable interface defaults and the extensions that
are installed. Only small configuration files are kept here. Profile data,
history, cookies and caches are never stored.

## Repository layout

Files under system/ map to the same absolute locations in the filesystem root.

system/usr/lib/firefox/distribution/policies.json installs to
/usr/lib/firefox/distribution/policies.json and carries the machine policy: it
sets the default search engine DuckDuckGo through SearchEngines.Default, which
only sets the application default, so a user can still pick another engine
later, and it force-installs the listed extensions through ExtensionSettings.

system/usr/lib/firefox/defaults/pref/autoconfig.js and
system/usr/lib/firefox/mozilla.cfg install next to the browser and set
user-changeable interface defaults through AutoConfig: the compact toolbar
density, the sidebar behaviour and the disabled upload of telemetry data. The
values are set with defaultPref, so a user can change every one of them.

Adding a setting is editing mozilla.cfg; adding an extension is editing
policies.json.
