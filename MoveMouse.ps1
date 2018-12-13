# Quick and dirty mouse prank
# Written by: JamesIsAwkward

# Used to call the Windows API stuff
Add-Type -AssemblyName System.Windows.Forms

# Changes how severe you want it to move
# The higher you go the more you see my bad code at work
# 10 is high for the record
$Severity = 3 # 2 or 3 is about right

While($True){

	$MousePosition1 = [System.Windows.Forms.Cursor]::Position # Checks current mouse position
	Start-Sleep -Seconds 0.01 # Delays the second check just incase the user is slow af
	$MousePosition2 = [System.Windows.Forms.Cursor]::Position # Checks mouse position a second time
	
	# More ifs than Obama
	# https://www.youtube.com/watch?v=8I4Jsf9IwoQ
	If (($MousePosition1.X -eq $MousePosition2.X) -and ($MousePosition1.Y -eq $MousePosition2.Y)){
		# Write-Host "Mouse did not move."
	} 
	Else {
		If (($MousePosition2.X -lt $MousePosition1.X) -and ($MousePosition2.Y -lt $MousePosition1.Y)){
			$MousePosition2.X = $MousePosition2.X - $Severity
			$MousePosition2.Y = $MousePosition2.Y - $Severity
			[System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($MousePosition2.X, $MousePosition2.Y)
		}
		ElseIf (($MousePosition2.X -gt $MousePosition1.X) -and ($MousePosition2.Y -gt $MousePosition1.Y)){
			$MousePosition2.X = $MousePosition2.X + $Severity
			$MousePosition2.Y = $MousePosition2.Y + $Severity
			[System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($MousePosition2.X, $MousePosition2.Y)
		}
		ElseIf (($MousePosition2.X -lt $MousePosition1.X) -and ($MousePosition2.Y -gt $MousePosition1.Y)){
			$MousePosition2.X = $MousePosition2.X - $Severity
			$MousePosition2.Y = $MousePosition2.Y + $Severity
			[System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($MousePosition2.X, $MousePosition2.Y)
		}
		ElseIf (($MousePosition2.X -gt $MousePosition1.X) -and ($MousePosition2.Y -lt $MousePosition1.Y)){
			$MousePosition2.X = $MousePosition2.X + $Severity
			$MousePosition2.Y = $MousePosition2.Y - $Severity
			[System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($MousePosition2.X, $MousePosition2.Y)
		}
		ElseIf (($MousePosition2.X -eq $MousePosition1.X) -and ($MousePosition2.Y -lt $MousePosition1.Y)){
			$MousePosition2.X = $MousePosition2.X
			$MousePosition2.Y = $MousePosition2.Y - $Severity
			[System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($MousePosition2.X, $MousePosition2.Y)
		}
		ElseIf (($MousePosition2.X -eq $MousePosition1.X) -and ($MousePosition2.Y -gt $MousePosition1.Y)){
			$MousePosition2.X = $MousePosition2.X
			$MousePosition2.Y = $MousePosition2.Y - $Severity
			[System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($MousePosition2.X, $MousePosition2.Y)
		}
		ElseIf (($MousePosition2.X -lt $MousePosition1.X) -and ($MousePosition2.Y -eq $MousePosition1.Y)){
			$MousePosition2.X = $MousePosition2.X + $Severity
			$MousePosition2.Y = $MousePosition2.Y
			[System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($MousePosition2.X, $MousePosition2.Y)
		}
		ElseIf (($MousePosition2.X -gt $MousePosition1.X) -and ($MousePosition2.Y -eq $MousePosition1.Y)){
			$MousePosition2.X = $MousePosition2.X + $Severity
			$MousePosition2.Y = $MousePosition2.Y
			[System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($MousePosition2.X, $MousePosition2.Y)
		}
	}
}
