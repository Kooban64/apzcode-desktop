# Releasing ApzCODE Desktop Installers

## 1) Build installers

Build on platform-native runners/machines:

- Windows: `ApzCODEUserSetup-*.exe` (recommended), optional `ApzCODESetup-*.exe`
- macOS: `ApzCODE-*.dmg`
- Linux: `apzcode_*.deb`, `apzcode-*.rpm`

## 2) Create GitHub release

1. Open <https://github.com/Kooban64/apzcode-desktop/releases/new>
2. Tag format: `vX.Y.Z`
3. Upload installer artifacts
4. Publish release

## 3) Automatic checksum attachment

When the release is published, workflow `Attach Release Checksums`:

- downloads all release assets
- computes SHA256 checksums
- uploads `SHA256SUMS.txt` to the same release

## 4) End-user download link

Users can always install from:

- <https://kooban64.github.io/apzcode-desktop/>

The page auto-selects an asset from the latest release based on OS.
