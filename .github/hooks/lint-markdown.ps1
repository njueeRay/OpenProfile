# .github/hooks/lint-markdown.ps1
# Hook: PostToolUse (Write|Edit) — markdown linting quality signal
# 对 .md / .mdx 文件的写操作触发，检查 markdownlint
# 发现问题时返回 exit 2（非零），让 Claude Code 感知到 linting 警告
#
# 入参（通过 stdin JSON 由 Claude Code 传入）：
#   .tool_input.path  — 被修改的文件路径（absolute）
#   .tool_name        — "Write" | "Edit" 等

param()

$input_json = $null
try {
    $raw = [Console]::In.ReadToEnd()
    if ($raw -and $raw.Trim() -ne "") {
        $input_json = $raw | ConvertFrom-Json -ErrorAction Stop
    }
} catch {
    # 无法解析 JSON，静默退出
    exit 0
}

# 提取文件路径
$file_path = $null
if ($input_json -and $input_json.tool_input -and $input_json.tool_input.path) {
    $file_path = $input_json.tool_input.path
} elseif ($input_json -and $input_json.path) {
    $file_path = $input_json.path
}

# 只处理 .md / .mdx 文件
if (-not $file_path) { exit 0 }
if ($file_path -notmatch '\.(md|mdx)$') { exit 0 }
if (-not (Test-Path $file_path)) { exit 0 }

# 检查 markdownlint-cli 是否安装
$ml_path = Get-Command "markdownlint" -ErrorAction SilentlyContinue
if (-not $ml_path) {
    # 尝试 npx 方式
    $ml_path = Get-Command "npx" -ErrorAction SilentlyContinue
    if ($ml_path) {
        $result = & npx --no markdownlint-cli "$file_path" 2>&1
    } else {
        # markdownlint 未安装，跳过
        exit 0
    }
} else {
    $result = & markdownlint "$file_path" 2>&1
}

if ($LASTEXITCODE -ne 0 -and $result) {
    $rel_path = $file_path -replace [regex]::Escape((Get-Location).Path + "\"), ""
    Write-Host "[markdownlint] WARN: $rel_path" -ForegroundColor Yellow
    $result | ForEach-Object { Write-Host "  $_" -ForegroundColor DarkYellow }
    # 返回非零退出码，让 Claude Code 感知到 linting 问题（可选择是否修复）
    # PostToolUse hook：非零 exit 不会阻断，但会让模型感知到警告
    exit 2
}

# 无问题，正常退出
exit 0
