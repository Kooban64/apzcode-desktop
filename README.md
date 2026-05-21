# ApzCODE Desktop Downloads

Public download portal and release automation for ApzCODE desktop installers.

## End-user experience

Users open the site, click Download, and install:

- Download page: `https://kooban64.github.io/apzcode-desktop/`
- Release assets: GitHub Releases

## What this repo contains

- Static download page (`index.html`) with OS-aware download button
- GitHub Pages deployment workflow
- Release checksum workflow (publishes `SHA256SUMS.txt` to each release)

## Publishing a new version

1. Build release artifacts in your build pipeline (examples):
   - `ApzCODEUserSetup-x64-<version>.exe`
   - `ApzCODESetup-x64-<version>.exe`
   - `apzcode_<version>_amd64.deb`
   - `apzcode-<version>.x86_64.rpm`
2. Create a GitHub Release in this repo (`vX.Y.Z`).
3. Upload artifacts to that release.
4. The checksum workflow auto-attaches `SHA256SUMS.txt`.

## Notes

- The download page reads the latest release from the GitHub API.
- If no release exists yet, the page shows a clear "No installers published yet" message.
