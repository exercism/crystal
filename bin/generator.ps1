if ($args.Length -eq 0) {
    Write-Host "Usage: generator <exercise>"
    exit 1
}

$exercise = $args[0]

if (!(Test-Path -Path "./bin/templates")) {
    New-Item -Path "./bin" -Name "templates" -ItemType Directory
    exit 1
}

Copy-Item -Path "./exercises/practice/$exercise/.meta/test_template.ecr" -Destination "./bin/templates/template.ecr"

if ($args.Length -eq 2) {
    crystal ./bin/generator.cr $exercise $args[1] || exit 1
} else {
    crystal ./bin/generator.cr $exercise || exit 1
}
