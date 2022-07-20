{
    "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
        "virtualMachineName": {
            "defaultValue": "AKSHCIHost001",
            "type": "String",
            "metadata": {
                "description": "Keep the VM name to less than 15 characters"
            }
        },
        "virtualMachineSize": {
            "defaultValue": "Standard_E16s_v4",
            "allowedValues": [
                "Standard_D16s_v3",
                "Standard_D32s_v3",
                "Standard_D64s_v3",
                "Standard_D16s_v4",
                "Standard_D32s_v4",
                "Standard_D64s_v4",
                "Standard_D16d_v4",
                "Standard_D32d_v4",
                "Standard_D64d_v4",
                "Standard_D16ds_v4",
                "Standard_D32ds_v4",
                "Standard_D64ds_v4",
                "Standard_E8s_v3",
                "Standard_E16s_v3",
                "Standard_E16-4s_v3",
                "Standard_E16-8s_v3",
                "Standard_E20s_v3",
                "Standard_E32s_v3",
                "Standard_E32-8s_v3",
                "Standard_E32-16s_v3",
                "Standard_E48s_v3",
                "Standard_E64s_v3",
                "Standard_E64-16s_v3",
                "Standard_E64-32s_v3",
                "Standard_E8s_v4",
                "Standard_E16s_v4",
                "Standard_E16-8s_v4",
                "Standard_E20s_v4",
                "Standard_E32s_v4",
                "Standard_E32-8s_v4",
                "Standard_E32-16s_v4",
                "Standard_E48s_v4",
                "Standard_E64s_v4",
                "Standard_E64-16s_v4",
                "Standard_E64-32s_v4",
                "Standard_E8d_v4",
                "Standard_E16d_v4",
                "Standard_E20d_v4",
                "Standard_E32d_v4",
                "Standard_E48d_v4",
                "Standard_E64d_v4",
                "Standard_E8ds_v4",
                "Standard_E16ds_v4",
                "Standard_E20ds_v4",
                "Standard_E32ds_v4",
                "Standard_E48ds_v4",
                "Standard_E64ds_v4",
                "Standard_E64-16ds_v4",
                "Standard_E64-32ds_v4"
            ],
            "type": "String"
        },
        "virtualMachineOS": {
            "defaultValue": "Windows Server 2022",
            "allowedValues": [
                "Windows Server 2019",
                "Windows Server 2022"
            ],
            "type": "String",
            "metadata": {
                "description": "Select your Azure VM OS, ideally Windows Server 2022."
            }
        },
        "virtualMachineGeneration": {
            "defaultValue": "Generation 2",
            "allowedValues": [
                "Generation 1",
                "Generation 2"
            ],
            "type": "String",
            "metadata": {
                "description": "Select your VM generation, ideally Gen 2. Not all Azure regions support Gen 2 VMs."
            }
        },
        "domainName": {
            "defaultValue": "akshci.local",
            "type": "String",
            "metadata": {
                "description": "The FQDN that will be used in the environment"
            }
        },
        "dataDiskType": {
            "defaultValue": "StandardSSD_LRS",
            "allowedValues": [
                "StandardSSD_LRS",
                "Premium_LRS"
            ],
            "type": "String",
            "metadata": {
                "description": "The Storage type of the VM data disk. If your VM contains an 's' in the VM size, you can select Premium_LRS storage for increased performance, but at a higher cost."
            }
        },
        "dataDiskSize": {
            "defaultValue": "32",
            "allowedValues": [
                "32",
                "64",
                "128",
                "256",
                "512",
                "1024"
            ],
            "type": "String",
            "metadata": {
                "description": "The size of the individual data disks in GiB. 8 of these will be provisioned therefore 32GiB is the recommended default."
            }
        },
        "adminUsername": {
            "defaultValue": "AzureUser",
            "type": "String"
        },
        "adminPassword": {
            "type": "SecureString"
        },
        "enableDHCP": {
            "defaultValue": "Enabled",
            "allowedValues": [
                "Enabled",
                "Disabled"
            ],
            "type": "String",
            "metadata": {
                "description": "Choose whether you wish to enable DHCP in the environment for AKS-HCI testing. If you choose Disabled, it can be enabled after deployment."
            }
        },
        "customRdpPort": {
            "defaultValue": "3389",
            "type": "String",
            "metadata": {
                "description": "If you wish to use a different port to RDP into the VM (between 0 and 65535), change it here, otherwise, leave the default."
            }
        },
        "autoShutdownStatus": {
            "defaultValue": "Enabled",
            "allowedValues": [
                "Enabled",
                "Disabled"
            ],
            "type": "String"
        },
        "autoShutdownTime": {
            "defaultValue": "22:00",
            "type": "String"
        },
        "autoShutdownTimeZone": {
            "defaultValue": "UTC",
            "allowedValues": [
                "Afghanistan Standard Time",
                "Alaskan Standard Time",
                "Aleutian Standard Time",
                "Altai Standard Time",
                "Arab Standard Time",
                "Arabian Standard Time",
                "Arabic Standard Time",
                "Argentina Standard Time",
                "Astrakhan Standard Time",
                "Atlantic Standard Time",
                "AUS Central Standard Time",
                "Aus Central W. Standard Time",
                "AUS Eastern Standard Time",
                "Azerbaijan Standard Time",
                "Azores Standard Time",
                "Bahia Standard Time",
                "Bangladesh Standard Time",
                "Belarus Standard Time",
                "Bougainville Standard Time",
                "Canada Central Standard Time",
                "Cape Verde Standard Time",
                "Caucasus Standard Time",
                "Cen. Australia Standard Time",
                "Central America Standard Time",
                "Central Asia Standard Time",
                "Central Brazilian Standard Time",
                "Central Europe Standard Time",
                "Central European Standard Time",
                "Central Pacific Standard Time",
                "Central Standard Time",
                "Central Standard Time (Mexico)",
                "Chatham Islands Standard Time",
                "China Standard Time",
                "Cuba Standard Time",
                "Dateline Standard Time",
                "E. Africa Standard Time",
                "E. Australia Standard Time",
                "E. Europe Standard Time",
                "E. South America Standard Time",
                "Easter Island Standard Time",
                "Eastern Standard Time",
                "Eastern Standard Time (Mexico)",
                "Egypt Standard Time",
                "Ekaterinburg Standard Time",
                "Fiji Standard Time",
                "FLE Standard Time",
                "Georgian Standard Time",
                "GMT Standard Time",
                "Greenland Standard Time",
                "Greenwich Standard Time",
                "GTB Standard Time",
                "Haiti Standard Time",
                "Hawaiian Standard Time",
                "India Standard Time",
                "Iran Standard Time",
                "Israel Standard Time",
                "Jordan Standard Time",
                "Kaliningrad Standard Time",
                "Korea Standard Time",
                "Libya Standard Time",
                "Line Islands Standard Time",
                "Lord Howe Standard Time",
                "Magadan Standard Time",
                "Magallanes Standard Time",
                "Marquesas Standard Time",
                "Mauritius Standard Time",
                "Middle East Standard Time",
                "Montevideo Standard Time",
                "Morocco Standard Time",
                "Mountain Standard Time",
                "Mountain Standard Time (Mexico)",
                "Myanmar Standard Time",
                "N. Central Asia Standard Time",
                "Namibia Standard Time",
                "Nepal Standard Time",
                "New Zealand Standard Time",
                "Newfoundland Standard Time",
                "Norfolk Standard Time",
                "North Asia East Standard Time",
                "North Asia Standard Time",
                "North Korea Standard Time",
                "Omsk Standard Time",
                "Pacific SA Standard Time",
                "Pacific Standard Time",
                "Pacific Standard Time (Mexico)",
                "Pakistan Standard Time",
                "Paraguay Standard Time",
                "Romance Standard Time",
                "Russia Time Zone 10",
                "Russia Time Zone 11",
                "Russia Time Zone 3",
                "Russian Standard Time",
                "SA Eastern Standard Time",
                "SA Pacific Standard Time",
                "SA Western Standard Time",
                "Saint Pierre Standard Time",
                "Sakhalin Standard Time",
                "Samoa Standard Time",
                "Sao Tome Standard Time",
                "Saratov Standard Time",
                "SE Asia Standard Time",
                "Singapore Standard Time",
                "South Africa Standard Time",
                "Sri Lanka Standard Time",
                "Sudan Standard Time",
                "Syria Standard Time",
                "Taipei Standard Time",
                "Tasmania Standard Time",
                "Tocantins Standard Time",
                "Tokyo Standard Time",
                "Tomsk Standard Time",
                "Tonga Standard Time",
                "Transbaikal Standard Time",
                "Turkey Standard Time",
                "Turks And Caicos Standard Time",
                "Ulaanbaatar Standard Time",
                "US Eastern Standard Time",
                "US Mountain Standard Time",
                "UTC",
                "UTC-02",
                "UTC-08",
                "UTC-09",
                "UTC-11",
                "UTC+12",
                "UTC+13",
                "Venezuela Standard Time",
                "Vladivostok Standard Time",
                "W. Australia Standard Time",
                "W. Central Africa Standard Time",
                "W. Europe Standard Time",
                "W. Mongolia Standard Time",
                "West Asia Standard Time",
                "West Bank Standard Time",
                "West Pacific Standard Time",
                "Yakutsk Standard Time"
            ],
            "type": "String"
        },
        "alreadyHaveAWindowsServerLicense": {
            "defaultValue": "No",
            "allowedValues": [
                "Yes",
                "No"
            ],
            "type": "String",
            "metadata": {
                "description": "By selecting Yes, you confirm you have an eligible Windows Server license with Software Assurance or Windows Server subscription to apply this Azure Hybrid Benefit. You can read more about compliance here: http://go.microsoft.com/fwlink/?LinkId=859786"
            }
        },
        "AKS-HCIAppId": {
            "type": "String",
            "metadata": {
                "description": "Enter the Application ID for your Azure AD Service Principal that will be used to integrate AKS on Azure Stack HCI, with Azure"
            }
        },
        "AKS-HCIAppSecret": {
            "type": "SecureString",
            "metadata": {
                "description": "Enter the corresponding secret for your Application ID"
            }
        },
        "AKS-HCINetworking": {
            "defaultValue": "DHCP",
            "allowedValues": [
                "DHCP",
                "Static"
            ],
            "type": "String",
            "metadata": {
                "description": "Choose whether you wish to enable DHCP in the environment for AKS-HCI testing, or if you wish to test with a Static IP configuration"
            }
        },
        "kubernetesVersion": {
            "defaultValue": "Match Management Cluster",
            "allowedValues": [
                "Match Management Cluster",
                "v1.21.2",
                "v1.21.1",
                "v1.20.7",
                "v1.20.5",
                "v1.19.11",
                "v1.19.9"
            ],
            "type": "String",
            "metadata": {
                "description": "Enter the Kubernetes version for your target cluster. Choosing 'Match Management Cluster' will result in a faster deployment"
            }
        },
        "controlPlaneNodes": {
            "defaultValue": 1,
            "allowedValues": [
                1,
                3,
                5
            ],
            "type": "Int",
            "metadata": {
                "description": "Enter the number of control plane nodes for this target cluster"
            }
        },
        "controlPlaneNodeSize": {
            "defaultValue": "Standard_A4_v2 (4vCPU, 8GB RAM)",
            "allowedValues": [
                "Default (4vCPU, 4GB RAM)",
                "Standard_A2_v2 (2vCPU, 4GB RAM)",
                "Standard_A4_v2 (4vCPU, 8GB RAM)",
                "Standard_D2s_v3 (2vCPU, 8GB RAM)",
                "Standard_D4s_v3 (4vCPU, 16GB RAM)",
                "Standard_D8s_v3 (8vCPU, 32GB RAM)",
                "Standard_D16s_v3 (16vCPU, 64GB RAM)",
                "Standard_D32s_v3 (32vCPU, 128GB RAM)",
                "Standard_DS2_v2 (2vCPU, 7GB RAM)",
                "Standard_DS3_v2 (2vCPU, 14GB RAM)",
                "Standard_DS4_v2 (8vCPU, 28GB RAM)",
                "Standard_DS5_v2 (16vCPU, 56GB RAM)",
                "Standard_DS13_v2 (8vCPU, 56GB RAM)",
                "Standard_K8S_v1 (4vCPU, 2GB RAM)",
                "Standard_K8S2_v1 (2vCPU, 2GB RAM)",
                "Standard_K8S3_v1 (4vCPU, 6GB RAM)"
            ],
            "type": "String",
            "metadata": {
                "description": "Choose the VM size for your control plane nodes for this target cluster. Visit this link for more information about VM sizes: https://docs.microsoft.com/en-us/azure-stack/aks-hci/reference/ps/get-akshcivmsize"
            }
        },
        "loadBalancerSize": {
            "defaultValue": "Standard_A4_v2 (4vCPU, 8GB RAM)",
            "allowedValues": [
                "Default (4vCPU, 4GB RAM)",
                "Standard_A2_v2 (2vCPU, 4GB RAM)",
                "Standard_A4_v2 (4vCPU, 8GB RAM)",
                "Standard_D2s_v3 (2vCPU, 8GB RAM)",
                "Standard_D4s_v3 (4vCPU, 16GB RAM)",
                "Standard_D8s_v3 (8vCPU, 32GB RAM)",
                "Standard_D16s_v3 (16vCPU, 64GB RAM)",
                "Standard_D32s_v3 (32vCPU, 128GB RAM)",
                "Standard_DS2_v2 (2vCPU, 7GB RAM)",
                "Standard_DS3_v2 (2vCPU, 14GB RAM)",
                "Standard_DS4_v2 (8vCPU, 28GB RAM)",
                "Standard_DS5_v2 (16vCPU, 56GB RAM)",
                "Standard_DS13_v2 (8vCPU, 56GB RAM)",
                "Standard_K8S_v1 (4vCPU, 2GB RAM)",
                "Standard_K8S2_v1 (2vCPU, 2GB RAM)",
                "Standard_K8S3_v1 (4vCPU, 6GB RAM)"
            ],
            "type": "String",
            "metadata": {
                "description": "Choose the VM size for your Load Balancer for this target cluster. Visit this link for more information about VM sizes: https://docs.microsoft.com/en-us/azure-stack/aks-hci/reference/ps/get-akshcivmsize"
            }
        },
        "LinuxWorkerNodes": {
            "defaultValue": 1,
            "allowedValues": [
                1,
                2,
                3,
                4,
                5
            ],
            "type": "Int",
            "metadata": {
                "description": "Enter the number of Linux worker nodes for this target cluster"
            }
        },
        "LinuxWorkerNodeSize": {
            "defaultValue": "Standard_K8S3_v1 (4vCPU, 6GB RAM)",
            "allowedValues": [
                "Default (4vCPU, 4GB RAM)",
                "Standard_A2_v2 (2vCPU, 4GB RAM)",
                "Standard_A4_v2 (4vCPU, 8GB RAM)",
                "Standard_D2s_v3 (2vCPU, 8GB RAM)",
                "Standard_D4s_v3 (4vCPU, 16GB RAM)",
                "Standard_D8s_v3 (8vCPU, 32GB RAM)",
                "Standard_D16s_v3 (16vCPU, 64GB RAM)",
                "Standard_D32s_v3 (32vCPU, 128GB RAM)",
                "Standard_DS2_v2 (2vCPU, 7GB RAM)",
                "Standard_DS3_v2 (2vCPU, 14GB RAM)",
                "Standard_DS4_v2 (8vCPU, 28GB RAM)",
                "Standard_DS5_v2 (16vCPU, 56GB RAM)",
                "Standard_DS13_v2 (8vCPU, 56GB RAM)",
                "Standard_K8S_v1 (4vCPU, 2GB RAM)",
                "Standard_K8S2_v1 (2vCPU, 2GB RAM)",
                "Standard_K8S3_v1 (4vCPU, 6GB RAM)"
            ],
            "type": "String",
            "metadata": {
                "description": "Choose the VM size for your Linux worker nodes for this target cluster. Visit this link for more information about VM sizes: https://docs.microsoft.com/en-us/azure-stack/aks-hci/reference/ps/get-akshcivmsize"
            }
        },
        "WindowsWorkerNodes": {
            "defaultValue": 0,
            "allowedValues": [
                0,
                1,
                2,
                3,
                4,
                5
            ],
            "type": "Int",
            "metadata": {
                "description": "Enter the number of Windows worker nodes for this target cluster"
            }
        },
        "WindowsWorkerNodeSize": {
            "defaultValue": "Standard_K8S3_v1 (4vCPU, 6GB RAM)",
            "allowedValues": [
                "Default (4vCPU, 4GB RAM)",
                "Standard_A2_v2 (2vCPU, 4GB RAM)",
                "Standard_A4_v2 (4vCPU, 8GB RAM)",
                "Standard_D2s_v3 (2vCPU, 8GB RAM)",
                "Standard_D4s_v3 (4vCPU, 16GB RAM)",
                "Standard_D8s_v3 (8vCPU, 32GB RAM)",
                "Standard_D16s_v3 (16vCPU, 64GB RAM)",
                "Standard_D32s_v3 (32vCPU, 128GB RAM)",
                "Standard_DS2_v2 (2vCPU, 7GB RAM)",
                "Standard_DS3_v2 (2vCPU, 14GB RAM)",
                "Standard_DS4_v2 (8vCPU, 28GB RAM)",
                "Standard_DS5_v2 (16vCPU, 56GB RAM)",
                "Standard_DS13_v2 (8vCPU, 56GB RAM)",
                "Standard_K8S_v1 (4vCPU, 2GB RAM)",
                "Standard_K8S2_v1 (2vCPU, 2GB RAM)",
                "Standard_K8S3_v1 (4vCPU, 6GB RAM)"
            ],
            "type": "String",
            "metadata": {
                "description": "Choose the VM size for your Windows worker nodes for this target cluster. Visit this link for more information about VM sizes: https://docs.microsoft.com/en-us/azure-stack/aks-hci/reference/ps/get-akshcivmsize"
            }
        },
        "installWindowsAdminCenter": {
            "defaultValue": "No",
            "allowedValues": [
                "Yes",
                "No"
            ],
            "type": "String"
        },
        "enableArcIntegration": {
            "defaultValue": "Yes",
            "allowedValues": [
                "Yes",
                "No"
            ],
            "type": "String"
        }
    },
    "variables": {
        "dataDisksCount": 8,
        "dscUri": "https://github.com/V-HMabrouk/aks-hci/raw/main/eval/autodeploy/dsc/akshciauto.zip",
        "artifactsLocation": "https://raw.githubusercontent.com/V-HMabrouk/aks-hci/main/eval/",
        "randomGUID": "[substring(uniqueString(subscription().subscriptionId, resourceGroup().id, parameters('virtualMachineName')),0,6)]",
        "dnsNameForPublicIP": "[toLower(concat(parameters('virtualMachineName'), variables('randomGUID')))]",
        "environment": "Workgroup",
        "virtualNetworkName": "AKSHCILabvNet",
        "networkInterfaceName": "AKSHCILabNIC1",
        "networkSecurityGroupName": "AKSHCILabNSG",
        "addressPrefix": "10.0.0.0/16",
        "privateIPAddress": "10.0.0.4",
        "subnetName": "AKSHCILabSubnet",
        "subnetPrefix": "10.0.0.0/24",
        "publicIpAddressName": "AKSHCILabPubIP",
        "publicIpAddressType": "Dynamic",
        "publicIpAddressSku": "Basic",
        "vnetId": "[resourceId('Microsoft.Network/virtualNetworks', variables('virtualNetworkName'))]",
        "subnetRef": "[concat(variables('vnetId'), '/subnets/', variables('subnetName'))]",
        "vmSkuGen1": "[if(equals(parameters('virtualMachineOS'), 'Windows Server 2022'), '2022-datacenter', '2019-datacenter')]",
        "vmSkuGen2": "[if(equals(parameters('virtualMachineOS'), 'Windows Server 2022'), '2022-datacenter-g2', '2019-datacenter-gensecond')]",
        "ps_adminUsername": "[concat('base64:', base64(parameters('adminUsername')))]",
        "ps_adminPassword": "[concat('base64:', base64(parameters('adminPassword')))]",
        "ps appId": "[concat('base64:', base64(parameters('AKS-HCIAppId')))]",
        "ps_appSecret": "[concat('base64:', base64(parameters('AKS-HCIAppSecret')))]",
        "subId": "[subscription().subscriptionId]",
        "tenantId": "[subscription().tenantId]",
        "scriptParameters": "[concat(' -userName ', parameters('adminUsername'), ' -adminUsername ',variables('ps_adminUsername'),' -adminPassword \"',variables('ps_adminPassword'),'\"',' -appId \"',variables('ps appId'),'\"',' -appSecret \"',variables('ps_appSecret'),'\"', ' -rgName \"',resourceGroup().name,'\"',' -location \"',resourceGroup().location,'\"',' -subID \"',variables('subId'),'\"',' -tenantID \"',variables('tenantId'),'\"',' -domainName \"',parameters('domainName'),'\"',' -installWAC \"', parameters('installWindowsAdminCenter'),'\"',' -enableArc \"', parameters('enableArcIntegration'),'\"',' -aksHciNetworking \"',parameters('AKS-HCINetworking'),'\"',' -kubernetesVersion \"',parameters('kubernetesVersion'),'\"',' -controlPlaneNodes ',parameters('controlPlaneNodes'),' -controlPlaneNodeSize \"',parameters('controlPlaneNodeSize'),'\"',' -loadBalancerSize \"',parameters('loadBalancerSize'),'\"',' -linuxWorkerNodes ',parameters('linuxWorkerNodes'),' -linuxWorkerNodeSize \"',parameters('linuxWorkerNodeSize'),'\"',' -windowsWorkerNodes ',parameters('windowsWorkerNodes'),' -windowsWorkerNodeSize \"',parameters('windowsWorkerNodeSize'),'\"')]"
    },
    "resources": [
        {
            "type": "Microsoft.Network/publicIpAddresses",
            "apiVersion": "2020-11-01",
            "name": "[variables('publicIpAddressName')]",
            "location": "[resourceGroup().location]",
            "sku": {
                "name": "[variables('publicIpAddressSku')]"
            },
            "properties": {
                "publicIpAllocationMethod": "[variables('publicIpAddressType')]",
                "dnsSettings": {
                    "domainNameLabel": "[variables('dnsNameForPublicIP')]"
                }
            }
        },
        {
            "type": "Microsoft.Resources/deployments",
            "apiVersion": "2021-04-01",
            "name": "[variables('virtualNetworkName')]",
            "properties": {
                "mode": "Incremental",
                "templateLink": {
                    "uri": "[uri(variables('artifactsLocation'), concat('json/vnet.json'))]",
                    "contentVersion": "1.0.0.0"
                },
                "parameters": {
                    "virtualNetworkName": {
                        "value": "[variables('virtualNetworkName')]"
                    },
                    "virtualNetworkAddressRange": {
                        "value": "[variables('addressPrefix')]"
                    },
                    "subnetName": {
                        "value": "[variables('subnetName')]"
                    },
                    "subnetRange": {
                        "value": "[variables('subnetPrefix')]"
                    },
                    "location": {
                        "value": "[resourceGroup().location]"
                    }
                }
            }
        },
        {
            "type": "Microsoft.Network/networkInterfaces",
            "apiVersion": "2020-11-01",
            "name": "[variables('networkInterfaceName')]",
            "location": "[resourceGroup().location]",
            "dependsOn": [
                "[variables('virtualNetworkName')]",
                "[concat('Microsoft.Network/publicIpAddresses/', variables('publicIpAddressName'))]",
                "[concat('Microsoft.Network/networkSecurityGroups/', variables('networkSecurityGroupName'))]"
            ],
            "properties": {
                "ipConfigurations": [
                    {
                        "name": "ipconfig1",
                        "properties": {
                            "subnet": {
                                "id": "[variables('subnetRef')]"
                            },
                            "privateIPAllocationMethod": "Static",
                            "privateIPAddress": "[variables('privateIPAddress')]",
                            "publicIpAddress": {
                                "id": "[resourceId('Microsoft.Network/publicIpAddresses', variables('publicIpAddressName'))]"
                            }
                        }
                    }
                ],
                "networkSecurityGroup": {
                    "id": "[resourceId('Microsoft.Network/networkSecurityGroups', variables('networkSecurityGroupName'))]"
                }
            }
        },
        {
            "type": "Microsoft.Network/networkSecurityGroups",
            "apiVersion": "2020-11-01",
            "name": "[variables('networkSecurityGroupName')]",
            "location": "[resourceGroup().location]",
            "properties": {
                "securityRules": [
                    {
                        "name": "rdp",
                        "properties": {
                            "priority": 1000,
                            "protocol": "Tcp",
                            "access": "Allow",
                            "direction": "Inbound",
                            "sourceAddressPrefix": "*",
                            "sourcePortRange": "*",
                            "destinationAddressPrefix": "*",
                            "destinationPortRange": "[parameters('customRdpPort')]"
                        }
                    }
                ]
            }
        },
        {
            "type": "Microsoft.Compute/virtualMachines",
            "apiVersion": "2021-03-01",
            "name": "[parameters('virtualMachineName')]",
            "location": "[resourceGroup().location]",
            "dependsOn": [
                "[concat('Microsoft.Network/networkInterfaces/', variables('networkInterfaceName'))]"
            ],
            "properties": {
                "osProfile": {
                    "computerName": "[parameters('virtualMachineName')]",
                    "adminUsername": "[parameters('adminUsername')]",
                    "adminPassword": "[parameters('adminPassword')]",
                    "windowsConfiguration": {
                        "provisionVmAgent": true
                    }
                },
                "hardwareProfile": {
                    "vmSize": "[parameters('virtualMachineSize')]"
                },
                "storageProfile": {
                    "imageReference": {
                        "publisher": "MicrosoftWindowsServer",
                        "offer": "WindowsServer",
                        "sku": "[if(equals(parameters('virtualMachineGeneration'), 'Generation 2'), variables('vmSkuGen2'), variables('vmSkuGen1'))]",
                        "version": "latest"
                    },
                    "osDisk": {
                        "createOption": "FromImage",
                        "managedDisk": {
                            "storageAccountType": "Standard_LRS"
                        }
                    },
                    "copy": [
                        {
                            "name": "dataDisks",
                            "count": "[variables('dataDisksCount')]",
                            "input": {
                                "name": "[concat(parameters('virtualMachineName'),'DataDisk',copyIndex('dataDisks'))]",
                                "diskSizeGB": "[parameters('dataDiskSize')]",
                                "lun": "[copyIndex('dataDisks')]",
                                "createOption": "Empty",
                                "caching": "None",
                                "managedDisk": {
                                    "storageAccountType": "[parameters('dataDiskType')]"
                                }
                            }
                        }
                    ]
                },
                "networkProfile": {
                    "networkInterfaces": [
                        {
                            "id": "[resourceId('Microsoft.Network/networkInterfaces', variables('networkInterfaceName'))]"
                        }
                    ]
                },
                "diagnosticsProfile": {
                    "bootDiagnostics": {
                        "enabled": true
                    }
                },
                "licenseType": "[if(equals(parameters('alreadyHaveAWindowsServerLicense'), 'Yes'), 'Windows_Server', 'None')]"
            },
            "resources": [
                {
                    "type": "extensions",
                    "apiVersion": "2021-03-01",
                    "name": "InstallWindowsAdminCenter",
                    "location": "[resourceGroup().location]",
                    "dependsOn": [
                        "[parameters('virtualMachineName')]"
                    ],
                    "properties": {
                        "publisher": "Microsoft.Compute",
                        "type": "CustomScriptExtension",
                        "typeHandlerVersion": "1.10",
                        "autoUpgradeMinorVersion": true,
                        "settings": {
                            "fileUris": [
                                "[uri(variables('artifactsLocation'), concat('scripts/installWac.ps1'))]"
                            ]
                        },
                        "protectedSettings": {
                            "commandToExecute": "[concat('powershell -ExecutionPolicy Unrestricted -File installWac.ps1', ' -userName ', parameters('adminUsername'))]"
                        }
                    }
                },
                {
                    "type": "Microsoft.Resources/deploymentScripts",
                    "apiVersion": "2020-10-01",
                    "name": "CustomScriptCleanup",
                    "location": "[resourceGroup().location]",
                    "dependsOn": [
                        "[parameters('virtualMachineName')]",
                        "[resourceId('Microsoft.Compute/virtualMachines/extensions', parameters('virtualMachineName'), 'InstallWindowsAdminCenter')]"
                    ],
                    "kind": "AzurePowerShell",
                    "properties": {
                        "azPowerShellVersion": "6.3",
                        "retentionInterval": "P1D",
                        "timeout": "PT30M",
                        "arguments": "[format(' -resourceGroupName {0} -vmName {1} -subscriptionId {2} -tenantId {3} -appId {4} -appSecret {5}', resourceGroup().name, parameters('virtualMachineName'), variables('subId'), variables('tenantId'),parameters('AKS-HCIAppId'), variables('ps_appSecret'))]",
                        "primaryScriptURI": "[uri(variables('artifactsLocation'), concat('autodeploy/scripts/removeCustomScript.ps1'))]"
                    }
                },
                {
                    "type": "extensions",
                    "apiVersion": "2021-03-01",
                    "name": "ConfigureAksHciHost",
                    "location": "[resourceGroup().location]",
                    "dependsOn": [
                        "[parameters('virtualMachineName')]",
                        "[resourceId('Microsoft.Compute/virtualMachines/extensions', parameters('virtualMachineName'), 'InstallWindowsAdminCenter')]",
                        "[resourceId('Microsoft.Resources/deploymentScripts', 'CustomScriptCleanup')]"
                    ],
                    "properties": {
                        "publisher": "Microsoft.Powershell",
                        "type": "DSC",
                        "typeHandlerVersion": "2.77",
                        "autoUpgradeMinorVersion": true,
                        "settings": {
                            "wmfVersion": "latest",
                            "configuration": {
                                "url": "[variables('dscUri')]",
                                "script": "akshciauto.ps1",
                                "function": "AksHciAutoDeploy"
                            },
                            "configurationArguments": {
                                "installWAC": "[parameters('installWindowsAdminCenter')]",
                                "domainName": "[parameters('domainName')]",
                                "environment": "[variables('environment')]",
                                "aksHciNetworking": "[parameters('AKS-HCINetworking')]",
                                "customRdpPort": "[parameters('customRdpPort')]",
                                "controlPlaneNodes": "[parameters('ControlPlaneNodes')]",
                                "controlPlaneNodeSize": "[parameters('ControlPlaneNodeSize')]",
                                "loadBalancerSize": "[parameters('LoadBalancerSize')]",
                                "linuxWorkerNodes": "[parameters('LinuxWorkerNodes')]",
                                "linuxWorkerNodeSize": "[parameters('LinuxWorkerNodeSize')]",
                                "windowsWorkerNodes": "[parameters('WindowsWorkerNodes')]",
                                "windowsWorkerNodeSize": "[parameters('WindowsWorkerNodeSize')]"
                            }
                        },
                        "protectedSettings": {
                            "configurationArguments": {
                                "adminCreds": {
                                    "UserName": "[parameters('adminUsername')]",
                                    "Password": "[parameters('adminPassword')]"
                                }
                            }
                        }
                    }
                },
                {
                    "type": "extensions",
                    "apiVersion": "2021-03-01",
                    "name": "InstallAksHci",
                    "location": "[resourceGroup().location]",
                    "dependsOn": [
                        "[parameters('virtualMachineName')]",
                        "[resourceId('Microsoft.Compute/virtualMachines/extensions', parameters('virtualMachineName'), 'ConfigureAksHciHost')]"
                    ],
                    "properties": {
                        "publisher": "Microsoft.Compute",
                        "type": "CustomScriptExtension",
                        "typeHandlerVersion": "1.10",
                        "autoUpgradeMinorVersion": true,
                        "settings": {
                            "fileUris": [
                                "[uri(variables('artifactsLocation'), concat('autodeploy/scripts/installAksHci.ps1'))]"
                            ]
                        },
                        "protectedSettings": {
                            "commandToExecute": "[concat('powershell -ExecutionPolicy Unrestricted -File installAksHci.ps1',variables('scriptParameters'))]"
                        }
                    }
                }
            ]
        },
        {
            "type": "Microsoft.DevTestLab/schedules",
            "apiVersion": "2018-09-15",
            "name": "[concat('shutdown-computevm-', parameters('virtualMachineName'))]",
            "location": "[resourceGroup().location]",
            "dependsOn": [
                "[concat('Microsoft.Compute/virtualMachines/', parameters('virtualMachineName'))]"
            ],
            "properties": {
                "status": "[parameters('autoShutdownStatus')]",
                "taskType": "ComputeVmShutdownTask",
                "dailyRecurrence": {
                    "time": "[parameters('autoShutdownTime')]"
                },
                "timeZoneId": "[parameters('autoShutdownTimeZone')]",
                "targetResourceId": "[resourceId('Microsoft.Compute/virtualMachines', parameters('virtualMachineName'))]"
            }
        },
        {
            "type": "Microsoft.Resources/deployments",
            "apiVersion": "2021-04-01",
            "name": "[concat(variables('virtualNetworkName'),'-UpdateDNS')]",
            "dependsOn": [
                "[resourceId('Microsoft.Compute/virtualMachines/extensions', parameters('virtualMachineName'), 'ConfigureAksHciHost')]"
            ],
            "properties": {
                "mode": "Incremental",
                "templateLink": {
                    "uri": "[uri(variables('artifactsLocation'), concat('json/updatevnet.json'))]",
                    "contentVersion": "1.0.0.0"
                },
                "parameters": {
                    "virtualNetworkName": {
                        "value": "[variables('virtualNetworkName')]"
                    },
                    "virtualNetworkAddressRange": {
                        "value": "[variables('addressPrefix')]"
                    },
                    "subnetName": {
                        "value": "[variables('subnetName')]"
                    },
                    "subnetRange": {
                        "value": "[variables('subnetPrefix')]"
                    },
                    "DNSServerAddress": {
                        "value": [
                            "[variables('privateIPAddress')]"
                        ]
                    },
                    "location": {
                        "value": "[resourceGroup().location]"
                    }
                }
            }
        }
    ],
    "outputs": {
        "adminUsername": {
            "type": "String",
            "value": "[parameters('adminUsername')]"
        },
        "rdpPort": {
            "type": "String",
            "value": "[parameters('customRdpPort')]"
        },
        "fqdn": {
            "type": "String",
            "value": "[reference(resourceId('Microsoft.Network/publicIPAddresses',variables('publicIPAddressName'))).dnsSettings.fqdn]"
        }
    }
}
