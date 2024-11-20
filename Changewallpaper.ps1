# Chemin complet de l'image à définir comme fond d'écran
$imagePath = "$HOME'\Wallpaper.jpg'"

# Modifier la clé de registre pour définir le fond d'écran
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "Wallpaper" -Value $imagePath

# Appliquer le changement
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class Wallpaper {
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@
[Wallpaper]::SystemParametersInfo(20, 0, $imagePath, 1)
