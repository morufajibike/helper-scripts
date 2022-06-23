
$excludeList = "C:\Users\repo-dir\exclude-dir" # add , 'string' for multiple

Get-ChildItem -Path `C:\Users\repo-dir`  |
    ForEach-Object {    
        if ($excludeList -notcontains "$_") {
            $repo = $_
            write-host "Repo: $repo"
            write-host "-------------------------------------"
            Get-ChildItem -Path `C:\Users\repo-dir\utils\gitleaksconfig\rules` |
            ForEach-Object {
                $rule = $_
                write-host "Rule config filename: $rule `n"
                
                .\utils\gitleaksconfig\gitleaks detect --config $rule --source $repo --no-git --verbose -f csv
                # .\utils\gitleaksconfig\gitleaks detect -c .\utils\gitleaksconfig\rules\config-v1.toml -s $_.FullName --no-git --verbose
            }
        }
    }
