<#
Bob is a lackadaisical teenager. In conversation, his responses are very limited.

Bob answers 'Sure.' if you ask him a question.

He answers 'Whoa, chill out!' if you yell at him.

He answers 'Calm down, I know what I'm doing!' if you yell a question at him.

He says 'Fine. Be that way!' if you address him without actually saying
anything.

He answers 'Whatever.' to anything else. 
#>

$HeyBob = "Ending with ? means a question." 
    $given = $HeyBob.Trim()

    $hasUppers = $given -cmatch "[A-Z]"
    $hasLowers = $given -cmatch "[a-z]"
    $isLoud = $hasUppers -and -not $hasLowers
    $isQuestion = $given.EndsWith('?')
    $isBlank = -not ($given -match "[^\s]+")

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

    # switch -regex -CaseSensitive ($given) {
    #     "[^a-z]*?$" {$res = "Calm down, I know what I'm doing!"}
    #     ".*?$"      {$res = "Sure."}
    #     "[^a-z]+"   {$res = "Whoa, chill out!"}
    #     ".+"        {$res = "Whatever."}
    #     default     {$res = "Fine. Be that way!"}
    # }

    Write-Host "HeyBob:     [$HeyBob]"
    Write-Host "given:      [$given]"
    Write-Host "hasUppers:  $hasUppers"
    Write-Host "hasLowers:  $hasLowers"
    Write-Host "isLoud:     $isLoud"
    Write-Host "isQuestion: $isQuestion"
    Write-Host "isBlank:    $isBlank"
    Write-Host "res:        <$res>"

