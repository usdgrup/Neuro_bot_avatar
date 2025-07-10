# Папка проекта (текущая)
$projectRoot = Get-Location

Write-Host "🧹 Очистка проекта от временных файлов в: $projectRoot" -ForegroundColor Cyan

# 1. Удаляем все папки __pycache__
$pycacheFolders = Get-ChildItem -Recurse -Directory -Filter "__pycache__"
foreach ($folder in $pycacheFolders) {
    Remove-Item -Recurse -Force $folder.FullName
    Write-Host "🗑️ Удалена папка $($folder.FullName)"
}

# 2. Удаляем все .pyc файлы
$pycFiles = Get-ChildItem -Recurse -Include *.pyc
foreach ($file in $pycFiles) {
    Remove-Item -Force $file.FullName
    Write-Host "🗑️ Удалён файл $($file.FullName)"
}

Write-Host "`n✅ Виртуальное окружение НЕ тронуто." -ForegroundColor Green
Write-Host "🎉 Очистка завершена!" -ForegroundColor Green