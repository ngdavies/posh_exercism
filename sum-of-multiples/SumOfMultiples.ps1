Function Get-SumOfMultiples {
    <#
    .SYNOPSIS
    Given a number, find the sum of all the unique multiples of particular numbers up to
    but not including that number.

    .DESCRIPTION
    If we list all the natural numbers below 20 that are multiples of 3 or 5,
    we get 3, 5, 6, 9, 10, 12, 15, and 18.

    .PARAMETER Multiples
    An array of the factors 

    .PARAMETER Limit
    The value BELOW which we test for

    .EXAMPLE
    Get-SumOfMultiples -Multiples @(3, 5) -Limit 10
    
    Returns 23
    #>
    [CmdletBinding()]
    Param(
        [int[]]$Multiples,
        [int]$Limit
    )

    $sum = 0
    for ($i=0; $i -lt $Limit; $i++) {
        foreach ($Multiple in $Multiples) {
            if (($i -ne 0) -and ($i % $Multiple) -eq 0) {
                # write-host "i, Multiple, sum", $i, $Multiple, $sum
                $sum += $i
                break;
            }
        }
    }
    return $sum
}
