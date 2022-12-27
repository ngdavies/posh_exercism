Function Get-AccTry() {
    <#
    .SYNOPSIS
    Apply a function to a number.

    .DESCRIPTION
    Given the collection of numbers:

    - 3

    And the operation:

    - square a number `$x = $x * $x`

    Your code should be able to produce the collection of squares:

    - 9

    Check out the test suite to see the expected function signature.

    .PARAMETER List
    A number to perform an operation on.

    .PARAMETER Func
    A scriptblock containing the operation to perform on the given $Number

    .EXAMPLE
    Get-AccTry -Number 3 -Func { <some code here> }
    #>
    [CmdletBinding()]
    Param(
        [PSObject[]]$List,
        [scriptblock]$Func
    )

    Write-Host "List: $List, Length $($List.Length)"
    Write-Host "Function: $Func"
    $List | %{$Func.Invoke($_)}
    # $res = @()
    # foreach ($t in $List) {
    #     $res += $Func.Invoke($t)
    #     Write-Host "Building results: $res"
    # }
    # $res
}
