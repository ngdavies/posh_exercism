Function Get-NucleotideCount() {
    <#
    .SYNOPSIS
    Given a single stranded DNA string, compute how many times each nucleotide occurs in the string.
    
    .DESCRIPTION
    The genetic language of every living thing on the planet is DNA.
    DNA is a large molecule that is built from an extremely long sequence of individual elements called nucleotides.
    4 types exist in DNA and these differ only slightly and can be represented as the following symbols: 'A' for adenine, 'C' for cytosine, 'G' for guanine, and 'T' thymine.

    The function counts the occurances of A, C, G and T in the supplied strand. It then outputs in the format:

    A:0, C:0, G:0, T:0
    
    .PARAMETER Strand
    The DNA strand to count
    
    .EXAMPLE
    Get-NucleotideCount -Strand "ACGTAGCTT"
    
    Retuns: A:2 C:2 G:2 T:3
    #>
    [CmdletBinding()]
    Param(
        [string]$Strand
    )
    
    $na = 0
    $nc = 0
    $ng = 0 
    $nt = 0

    for ($i = 0; $i -lt $Strand.Length; $i++) {
        switch ($Strand[$i]) {
            'A' {$na++}
            'C' {$nc++}
            'G' {$ng++}
            'T' {$nt++}
            Default {Throw "Invalid nucleotide in strand"}
        }    
    }
    return "A:$na C:$nc G:$ng T:$nt"
}
