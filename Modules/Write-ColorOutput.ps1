function Write-ColorOutput($ForegroundColor)
{
    # save the current color
    $fc = $host.UI.RawUI.ForegroundColor

    # set the new color
    $host.UI.RawUI.ForegroundColor = $ForegroundColor

    # output
    if ($args) {
        Write-Output $args
    }
    else {
        $input | Write-Output
    }

    # restore the original color
    $host.UI.RawUI.ForegroundColor = $fc
}

# test
# Write-ColorOutput red (ls)
# Write-ColorOutput green (ls)
# ls | Write-ColorOutput yellow

# ToDo: lookat $PSScriptRoot
# Note: $PSScriptRoot is always to "this script" that the $PSScriptRoot variable is in.