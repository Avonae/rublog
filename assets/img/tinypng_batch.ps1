$pass = "pQdBSW5GC5lfFPpzk8Rf9rdGcdGXlfdn"
$user = "api"
$pair = "${user}:${pass}"

$bytes = [System.Text.Encoding]::ASCII.GetBytes($pair)
$base64 = [System.Convert]::ToBase64String($bytes)

$basicAuthValue = "Basic $base64"

$headers = @{ Authorization = $basicAuthValue }

$regex = '"url":".*"'

# Получаем список всех PNG файлов в текущей папке и поддиректориях
$files = Get-ChildItem -Recurse -Include *.jpg, *.png
$totalFiles = $files.Count
$currentFileIndex = 0

# Обрабатываем каждый файл
$files | ForEach-Object {
    $currentFileIndex++

    # Выводим прогресс с двумя знаками после запятой
    $percentComplete = [math]::Round(($currentFileIndex / $totalFiles) * 100, 2)
    Write-Progress -Activity "Processing Images" -Status "$percentComplete% Complete" -PercentComplete $percentComplete

    # Оптимизируем изображение
    $return = Invoke-WebRequest -Uri "https://api.tinify.com/shrink" -Headers $headers -InFile $_.FullName -Method Post
    $url = Select-String -InputObject $return.Content -Pattern $regex -AllMatches | ForEach-Object { $_.Matches.Value.Replace('"url":"', '').Replace('"', '') }
    $output = $_.FullName
    Invoke-WebRequest -Uri $url -OutFile $output
}

Write-Host "Processing complete!"
