$pullRequests = Invoke-RestMethod -Uri "https://api.github.com/repos/Romiusse/opi_lab3/pulls"

if ($pullRequests){
    foreach($pr in $pullRequests) {
        $branchName = $pr.head.ref

        git checkout $branchName

        git pull
        return $true
    }
} else {
    return $false
}