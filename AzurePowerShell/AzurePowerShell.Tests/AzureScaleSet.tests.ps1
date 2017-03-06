$project = (Split-Path -Parent $MyInvocation.MyCommand.Path).Replace(".Tests", "")
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".tests.", ".")
. "$project\$sut"

Describe "Virtual Machine Scale Set" {
	Context "Given the scale exists" {
		It "Returns the number of instances" {
			Login-AzureRmAccount -SubscriptionName 
			Get-VmssInstanceCount -ResourceGroupName  -VirtualMachineScaleSetName FrontEnd | 
				Should Be 3
		}
	}
}
