$ErrorActionPreference = 'Stop'
Write-Host "Restoring project from checkpoint 1..."
$src = 'c:\Users\karri\OneDrive\Desktop\Project_checkpoints\checkpoint_1'
$dest = 'c:\Users\karri\OneDrive\Desktop\Project'

Copy-Item -Path "$src\src" -Destination "$dest\src" -Recurse -Force
Copy-Item -Path "$src\backend" -Destination "$dest\backend" -Recurse -Force
Copy-Item -Path "$src\dist" -Destination "$dest\dist" -Recurse -Force

$files = @(
    'package.json',
    'package-lock.json',
    'tsconfig.json',
    'vite.config.ts',
    'tailwind.config.js',
    'postcss.config.js',
    'index.html',
    'requirements.txt',
    '.gitignore',
    'agro_intelligence.db'
)

foreach ($f in $files) {
    if (Test-Path "$src\$f") {
        Copy-Item -Path "$src\$f" -Destination "$dest\$f" -Force
    }
}

Write-Host "ROLLBACK_TO_CHECKPOINT_1_COMPLETE: Project successfully reverted to checkpoint 1."
