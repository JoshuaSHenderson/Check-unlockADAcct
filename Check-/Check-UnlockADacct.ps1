# This script is to be used if an AD account is continously being locked out and you need automate unlocking it for a small period of time
# I used this when a computer that we could not get access to was continously locking out an AD account, making the user lose access to their email
# I ran this until I was able to get on the computer and solve the root issue.

#account you want to unlock. Replace item in brackets
$Account= [SAMACCOUT NAME TO UNLOCK]

#do continously
While($run -eq 1){
$run = '1'

#Get ad account
$checkADaccount = get-aduser $Account -properties *
 
 #if ADaccount is locked out,  write out that it is locked out and the time then unlock it and write out the it is unlocked
 if($checkADaccount.lockedout -eq 'True'){
    $time = get-date -Format "HH:mm"
    write-host "Acccount locked at $($time)" -ForegroundColor red
    Unlock-ADAccount $account
    $time = get-date -Format "HH:mm"
    write-host "account unlocked at $($time)" -ForegroundColor green
    }

#wait 30 seconds before running again
sleep 30
}
