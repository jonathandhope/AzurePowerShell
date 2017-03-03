function Get-VmssInstanceCount {

	[CmdletBinding()]
	[OutputType([int])]
	Param (
		[string]$ResourceGroupName,
		[string]$VirtualMachineScaleSetName
	)

	$vmss = Get-AzureRmVmss -ResourceGroupName $ResourceGroupName -VMScaleSetName $VirtualMachineScaleSetName
	$vmss.sku.capacity
}