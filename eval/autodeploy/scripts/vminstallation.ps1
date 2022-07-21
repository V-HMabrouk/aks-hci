$Server = "Ubuntu"               #Create VM name as Windows10
$ServerRAM = 1GB                    #Set RAM size to 1 GB
$ServerVHD = 60GB                   #Set VHD size to 80GB
$VMLOC = "V:\HyperV"                #Define where the virtual hard disk file is stored
$Switch = "TestSW"                  #Define the name of the virtual switch
$ISO = "V:\ubuntu-22.04-desktop-amd64.iso" #Specify where to install the ISO file
$source = 'https://releases.ubuntu.com/22.04/ubuntu-22.04-desktop-amd64.iso' #ISO source file location

#Download the file
Start-BitsTransfer -Source $source -Destination $ISO

# Create folders and virtual throw switches for virtual machines
MD $VMLOC -ErrorAction SilentlyContinue
$TestSwitch = Get-VMSwitch -Name $Switch -ErrorAction SilentlyContinue; 
if ($TestSwitch.Count -EQ 0){New-VMSwitch -Name $Switch -SwitchType Private}

# Create a new virtual machine
New-VM -Name $Server -Path $VMLOC -MemoryStartupBytes $ServerRAM -NewVHDPath $VMLOC\$ServerVHD.vhdx -NewVHDSizeBytes $ServerVHD -SwitchName $Switch

# Configuring a virtual machine
Set-VMDvdDrive -VMName $Server -Path $ISO

#Start the Virtual Machine
Start-VM $Server
