#
# Author: Connor Hudson
#
# Must be run with Admin credentials
#
# If you want to easily enable or disable the scheduled task
# you can run this script instead of opening Task Scheduler and
# hunting for the scheduled task. Just edit it to reflect the
# name of your scheduled task
#

$taskName = "My-Scheduled-Task" # Change this to the name of your scheduled task

$taskStatus = (Get-ScheduledTask -TaskName "$taskName").State

if ($taskStatus -eq "Ready"){
    echo "$taskName status is $taskStatus. Disabling now..."
    Disable-ScheduledTask -TaskName "$taskName"
    $taskStatus = (Get-ScheduledTask -TaskName "$taskName").State

} else {
    echo "$taskName status is $taskStatus. Enabling now..."
    Enable-ScheduledTask -TaskName "$taskName"\
    $taskStatus = (Get-ScheduledTask -TaskName "$taskName").State
}

echo "`n$taskName is now $taskStatus. Here is some useful info about the task:"
Get-ScheduledTaskInfo -TaskName $taskName