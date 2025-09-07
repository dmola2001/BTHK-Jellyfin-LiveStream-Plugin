# Build script for BTHK Live Stream Plugin

$version = "1.0.0"
$outputDir = ".\dist"
$pluginName = "BTHK-LiveStream-Plugin"

# تنظيف المجلد السابق
if (Test-Path $outputDir) {
    Remove-Item $outputDir -Recurse -Force
}

# إنشاء مجلد الإخراج
New-Item -ItemType Directory -Path $outputDir -Force

# نسخ ملفات المصدر
Copy-Item ".\manifest.json" -Destination "$outputDir\"
Copy-Item ".\src\bin\Release\net6.0\*.dll" -Destination "$outputDir\"
Copy-Item ".\web-ui\*" -Destination "$outputDir\" -Recurse

# إنشاء ملف ZIP
Compress-Archive -Path "$outputDir\*" -DestinationPath ".\$pluginName-$version.zip" -Force

Write-Host "تم بناء الإضافة بنجاح: $pluginName-$version.zip"
