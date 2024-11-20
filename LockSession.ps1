Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class LockWorkStationHelper {
    [DllImport("user32.dll")]
    public static extern bool LockWorkStation();
}
"@

# Appelle la fonction LockWorkStation pour verrouiller la session
[LockWorkStationHelper]::LockWorkStation()