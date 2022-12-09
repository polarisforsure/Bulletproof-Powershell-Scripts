# Install EXOV2 module if it's not already installed
if (!(Get-Module -Name EXOV2)) {
  Install-Module -Name EXOV2
}

# Log in to your tenant
Connect-EXOPSSession

# Ask for information on whose calendar we are changing
$calendarUser = Read-Host -Prompt 'Enter the email address of the user whose calendar you want to change:'

# Ask for which user should receive the new permissions
$permissionUser = Read-Host -Prompt 'Enter the email address of the user who should receive the new permissions:'

# Ask for the calendar permission parameters
$permissionLevel = Read-Host -Prompt 'Enter the permission level (e.g. Reviewer, Author, etc.):'

# Get the calendar of the user whose calendar we are changing
$calendar = Get-EXOCalendar -Identity $calendarUser

# Add the new calendar permissions for the specified user
Add-EXOCalendarPermission -Identity $calendar -User $permissionUser -AccessRights $permissionLevel

# Finish
Write-Host 'Finished adding calendar permissions.'
