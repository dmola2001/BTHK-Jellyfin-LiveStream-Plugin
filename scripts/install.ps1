# تثبيت الإضافة من رابط GitHub
param(
    [string]$JellyfinPath = "C:\Program Files\Jellyfin\Server",
    [string]$PluginUrl = "https://github.com/yourusername/BTHK-Jellyfin-LiveStream-Plugin/releases/download/v1.0.0/BTHK-LiveStream-Plugin-1.0.0.zip"
)

# تحميل الإضافة
$tempFile = [System.IO.Path]::GetTempFileName() + ".zip"
Invoke-WebRequest -Uri $PluginUrl -OutFile $tempFile

# استخراج الإضافة
$pluginDir = Join-Path $JellyfinPath "plugins\BTHK-LiveStream-Plugin"
if (Test-Path $pluginDir) {
    Remove-Item $pluginDir -Recurse -Force
}

Expand-Archive -Path $tempFile -DestinationPath $pluginDir -Force

# تنظيف الملف المؤقت
Remove-Item $tempFile -Force

Write-Host "تم تثبيت الإضافة بنجاح في: $pluginDir"
