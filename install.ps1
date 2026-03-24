# Inspiration Skills 安装脚本
# 使用方法：.\install.ps1

Write-Host "🧠 安装 Inspiration Skills..." -ForegroundColor Green

# 获取脚本所在目录
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$skillsDir = "$env:USERPROFILE\.openclaw\data-analysis-workspace\skills"

# 检查目标目录是否存在
if (-not (Test-Path $skillsDir)) {
    Write-Host "❌ OpenClaw skills 目录不存在：$skillsDir" -ForegroundColor Red
    Write-Host "请确认 OpenClaw 已正确安装" -ForegroundColor Yellow
    exit 1
}

Write-Host "✅ 找到 skills 目录：$skillsDir" -ForegroundColor Green

# 复制所有 skills
Write-Host "📦 复制技能文件..." -ForegroundColor Yellow

$skills = @("inspiration-record", "inspiration-research", "inspiration-deep-discussion")

foreach ($skill in $skills) {
    $sourceDir = "$scriptPath\skills\$skill"
    $targetDir = "$skillsDir\$skill"
    
    if (Test-Path $sourceDir) {
        if (-not (Test-Path $targetDir)) {
            New-Item -ItemType Directory -Path $targetDir | Out-Null
        }
        Copy-Item -Recurse "$sourceDir\*" -Destination "$targetDir\" -Force
        Write-Host "✅ 安装：$skill" -ForegroundColor Green
    } else {
        Write-Host "⚠️  跳过：$skill (源目录不存在)" -ForegroundColor Yellow
    }
}

Write-Host "`n✅ 安装完成！" -ForegroundColor Green
Write-Host "`n📝 接下来请执行以下步骤：" -ForegroundColor Cyan
Write-Host ""
Write-Host "1️⃣ 重启 OpenClaw Gateway:" -ForegroundColor White
Write-Host "   openclaw gateway restart" -ForegroundColor Gray
Write-Host ""
Write-Host "2️⃣ 在飞书中测试:" -ForegroundColor White
Write-Host "   发送消息：帮我记录一个想法：测试灵感" -ForegroundColor Gray
Write-Host ""
Write-Host "✅ 完成！" -ForegroundColor Green
