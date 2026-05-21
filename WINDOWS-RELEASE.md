# Publish Windows Installers

Use this after building native Windows artifacts on a Windows machine.

## Expected artifacts

- `ApzCODEUserSetup-<arch>-<version>.exe` (required)
- `ApzCODESetup-<arch>-<version>.exe` (optional)
- `ApzCODE-win32-<arch>-<version>.zip` (optional)

## One-command upload

From this repo on Windows PowerShell:

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\scripts\publish-windows-assets.ps1 `
  -Tag v1.121.0 `
  -UserSetupExe "C:\ApzCode\installer\out\windows\ApzCODEUserSetup-x64-1.121.0.exe" `
  -SystemSetupExe "C:\ApzCode\installer\out\windows\ApzCODESetup-x64-1.121.0.exe" `
  -ZipArchive "C:\ApzCode\installer\out\windows\ApzCODE-win32-x64-1.121.0.zip" `
  -Notes "ApzCODE Windows installers"
```

For beta channel:

```powershell
.\scripts\publish-windows-assets.ps1 -Tag v1.121.0-beta.1 -UserSetupExe "<path>" -Prerelease
```

## Result

Once uploaded:

- Download page auto-resolves Windows installer from latest matching release.
- Users on Windows get direct `.exe` download from browser.
