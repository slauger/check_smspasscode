# check_smspasscode_lockedout.ps1
# 
# Basic Monitoring Checks for SMS Passcode
# 
# @author Simon Lauger <simon@lauger.name>

Import-Module -Name 'C:\Program Files\SMS PASSCODE\PS\Modules\SMSPASSCODE.PS.DatabaseModule'

if ($lockedOut = Get-SmsPcUser -all | where {$_.lockedout}) {
  $lockedCount = $lockedOut.Count
  $pluginOut = "check_smspasscode WARNING: "
  $pluginOut += $lockedCount
  $pluginOut += " locked out users found"
  $pluginOut += $lockedOut | Format-List Upn | Out-String
  echo $pluginOut
  exit 2
} else {
  print "check_smspasscode OK: no locked out users found"
  exit 0
}

