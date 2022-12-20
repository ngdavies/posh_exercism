Function Get-BobResponse() {
    <#
    .SYNOPSIS
    Bob is a lackadaisical teenager. In conversation, his responses are very limited.
    
    .DESCRIPTION
    Bob is a lackadaisical teenager. In conversation, his responses are very limited.

    Bob answers 'Sure.' if you ask him a question.

    He answers 'Whoa, chill out!' if you yell at him.

    He answers 'Calm down, I know what I'm doing!' if you yell a question at him.

    He says 'Fine. Be that way!' if you address him without actually saying
    anything.

    He answers 'Whatever.' to anything else.
    
    .PARAMETER HeyBob
    The sentence you say to Bob.
    
    .EXAMPLE
    Get-BobResponse -HeyBob "Hi Bob"
    #>
    [CmdletBinding()]
    Param(
        [string]$HeyBob
    )

    $given = $HeyBob.Trim()

    $hasUppers = $given -cmatch "[A-Z]"
    $hasLowers = $given -cmatch "[a-z]"
    $isLoud = $hasUppers -and -not $hasLowers
    $isQuestion = $given.EndsWith('?')
    $isBlank = -not( $given -match "[^\s]+" )

    if ($isLoud -and $isQuestion) {
        $res = "Calm down, I know what I'm doing!"
    } elseif ($isQuestion) {
        $res =  "Sure."
    } elseif ($isLoud)     {
        $res =  "Whoa, chill out!"
    } elseif ($isBlank)    {
        $res =  "Fine. Be that way!"
    } else {
        $res =  "Whatever."
    }

    $res
}
