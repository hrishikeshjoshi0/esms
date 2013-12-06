<%@ page import="com.esms.model.maintenance.LiftInfo"%>

<div class="row">
	<div class="col-md-6">
		<div
			class="form-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'liftMake', 'error')} ">
			<label for="liftMake" class="col-md-2 control-label"><g:message
					code="liftInfo.liftMake.label" default="Lift Make" /></label>
			<div class="col-md-10">
				<g:textField name="liftMake" value="${liftInfoInstance?.liftMake}" />
				<span class="help-inline">
					${hasErrors(bean: liftInfoInstance, field: 'liftMake', 'error')}
				</span>
			</div>
		</div>
		
		<div
			class="form-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'liftControlSystem', 'error')} ">
			<label for="liftControlSystem" class="col-md-2 control-label"><g:message
					code="liftInfo.liftControlSystem.label" default="Lift Control System" /></label>
			<div class="col-md-10">
				<g:textField name="liftControlSystem"
					value="${liftInfoInstance?.liftControlSystem}" />
				<span class="help-inline">
					${hasErrors(bean: liftInfoInstance, field: 'liftControlSystem', 'error')}
				</span>
			</div>
		</div>
		
		<div
			class="form-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'lastServiceProvider', 'error')} ">
			<label for="lastServiceProvider" class="col-md-2 control-label"><g:message
					code="liftInfo.lastServiceProvider.label"
					default="Last Service Provider" /></label>
			<div class="col-md-10">
				<g:textField name="lastServiceProvider"
					value="${liftInfoInstance?.lastServiceProvider}" />
				<span class="help-inline">
					${hasErrors(bean: liftInfoInstance, field: 'lastServiceProvider', 'error')}
				</span>
			</div>
		</div>
		
		<div
			class="form-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'lastContractEndDate', 'error')} ">
			<label for="lastContractEndDate" class="col-md-2 control-label"><g:message
					code="liftInfo.lastContractEndDate.label"
					default="Last Contract End Date" /></label>
			<div class="col-md-10">
				<g:datePicker name="lastContractEndDate"
					value="${liftInfoInstance?.lastContractEndDate}" precision="day" />
				<span class="help-inline">
					${hasErrors(bean: liftInfoInstance, field: 'lastContractEndDate', 'error')}
				</span>
			</div>
		</div>
		
		<div
			class="form-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'typeOfEnquiry', 'error')} ">
			<label for="typeOfEnquiry" class="col-md-2 control-label"><g:message
					code="liftInfo.typeOfEnquiry.label" default="Type Of Enquiry" /></label>
			<div class="col-md-10">
				<g:select name="typeOfEnquiry"
					from="${liftInfoInstance.constraints.typeOfEnquiry.inList}"
					value="${liftInfoInstance?.typeOfEnquiry}"
					valueMessagePrefix="liftInfo.typeOfEnquiry" noSelection="['': '']" />
				<span class="help-inline">
					${hasErrors(bean: liftInfoInstance, field: 'typeOfEnquiry', 'error')}
				</span>
			</div>
		</div>
		
		<div
			class="form-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'buildingType', 'error')} ">
			<label for="buildingType" class="col-md-2 control-label"><g:message
					code="liftInfo.buildingType.label" default="Building Type" /></label>
			<div class="col-md-10">
				<g:select name="buildingType"
					from="${liftInfoInstance.constraints.buildingType.inList}"
					value="${liftInfoInstance?.buildingType}"
					valueMessagePrefix="liftInfo.buildingType" noSelection="['': '']" />
				<span class="help-inline">
					${hasErrors(bean: liftInfoInstance, field: 'buildingType', 'error')}
				</span>
			</div>
		</div>
		
		<div
			class="form-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'gateType', 'error')} ">
			<label for="gateType" class="col-md-2 control-label"><g:message
					code="liftInfo.gateType.label" default="Gate Type" /></label>
			<div class="col-md-10">
				<g:select name="gateType"
					from="${liftInfoInstance.constraints.gateType.inList}"
					value="${liftInfoInstance?.gateType}"
					valueMessagePrefix="liftInfo.gateType" noSelection="['': '']" />
				<span class="help-inline">
					${hasErrors(bean: liftInfoInstance, field: 'gateType', 'error')}
				</span>
			</div>
		</div>
		
		<div
			class="gateTypeOther control-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'gateTypeOther', 'error')} ">
			<label for=gateTypeOther class="col-md-2 control-label"><g:message
					code="liftInfo.gateTypeOther.label" default="Gate Type (Other)" /></label>
			<div class="col-md-10">
				<g:textField name="gateTypeOther" class="${liftInfoInstance?.gateType == 'OTHER'? '' : 'hidden'}"
					value="${liftInfoInstance?.gateTypeOther}" />
				<span class="help-inline">
					${hasErrors(bean: liftInfoInstance, field: 'gateTypeOther', 'error')}
				</span>
			</div>
		</div>
		
		<div
			class="form-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'retiringCamType', 'error')} ">
			<label for="retiringCamType" class="col-md-2 control-label"><g:message
					code="liftInfo.retiringCamType.label" default="Retiring Cam Type" /></label>
			<div class="col-md-10">
				<g:select name="retiringCamType"
					from="${liftInfoInstance.constraints.retiringCamType.inList}"
					value="${liftInfoInstance?.retiringCamType}"
					valueMessagePrefix="liftInfo.retiringCamType" noSelection="['': '']" />
				<span class="help-inline">
					${hasErrors(bean: liftInfoInstance, field: 'retiringCamType', 'error')}
				</span>
			</div>
		</div>
		
		<div
			class="form-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'lockType', 'error')} ">
			<label for="lockType" class="col-md-2 control-label"><g:message
					code="liftInfo.lockType.label" default="Lock Type" /></label>
			<div class="col-md-10">
				<g:select name="lockType"
					from="${liftInfoInstance.constraints.lockType.inList}"
					value="${liftInfoInstance?.lockType}"
					valueMessagePrefix="liftInfo.lockType" noSelection="['': '']" />
				<span class="help-inline">
					${hasErrors(bean: liftInfoInstance, field: 'lockType', 'error')}
				</span>
			</div>
		</div>
		
		<div
			class="form-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'noOfFloors', 'error')} required">
			<label for="noOfFloors" class="col-md-2 control-label"><g:message
					code="liftInfo.noOfFloors.label" default="No Of Floors" /><span
				class="required-indicator">*</span></label>
			<div class="col-md-10">
				<g:field type="number" name="noOfFloors" required=""
					value="${liftInfoInstance.noOfFloors}" />
				<span class="help-inline">
					${hasErrors(bean: liftInfoInstance, field: 'noOfFloors', 'error')}
				</span>
			</div>
		</div>
		
		<div
			class="form-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'numberOfLifts', 'error')} required">
			<label for="numberOfLifts" class="col-md-2 control-label"><g:message
					code="liftInfo.numberOfLifts.label" default="Number Of Lifts" /><span
				class="required-indicator">*</span></label>
			<div class="col-md-10">
				<g:field type="number" name="numberOfLifts" required=""
					value="${liftInfoInstance.numberOfLifts}" />
				<span class="help-inline">
					${hasErrors(bean: liftInfoInstance, field: 'numberOfLifts', 'error')}
				</span>
			</div>
		</div>
		
		<div
			class="form-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'drive', 'error')} ">
			<label for="drive" class="col-md-2 control-label"><g:message
					code="liftInfo.drive.label" default="Drive" /></label>
			<div class="col-md-10">
				<g:select name="drive" onchange="toggleDriveFields(this.value);"
					from="${liftInfoInstance.constraints.drive.inList}"
					value="${liftInfoInstance?.drive}"
					valueMessagePrefix="liftInfo.drive" noSelection="['': '']" />
				<span class="help-inline"> ${hasErrors(bean: liftInfoInstance, field: 'drive', 'error')}
				</span>
			</div>
		</div>

		<div
			class="form-group fieldcontain drive ${hasErrors(bean: liftInfoInstance, field: 'driveCapacity', 'error')} ">
			<label for="driveCapacity" class="col-md-2 control-label"><g:message
					code="liftInfo.driveCapacity.label" default="Drive Capacity" /></label>
			<div class="col-md-10">
				<g:textField name="driveCapacity"
					value="${liftInfoInstance?.driveCapacity}" />
				<span class="help-inline"> ${hasErrors(bean: liftInfoInstance, field: 'driveCapacity', 'error')}
				</span>
			</div>
		</div>

		<div
			class="form-group fieldcontain drive ${hasErrors(bean: liftInfoInstance, field: 'driveMake', 'error')} ">
			<label for="driveMake" class="col-md-2 control-label"><g:message
					code="liftInfo.driveMake.label" default="Drive Make" /></label>
			<div class="col-md-10">
				<g:textField name="driveMake" value="${liftInfoInstance?.driveMake}" />
				<span class="help-inline"> ${hasErrors(bean: liftInfoInstance, field: 'driveMake', 'error')}
				</span>
			</div>
		</div>

		<div
			class="form-group fieldcontain drive ${hasErrors(bean: liftInfoInstance, field: 'driveSerialNumber', 'error')} ">
			<label for="driveSerialNumber" class="col-md-2 control-label"><g:message
					code="liftInfo.driveSerialNumber.label"
					default="Drive Serial Number" /></label>
			<div class="col-md-10">
				<g:textField name="driveSerialNumber"
					value="${liftInfoInstance?.driveSerialNumber}" />
				<span class="help-inline"> ${hasErrors(bean: liftInfoInstance, field: 'driveSerialNumber', 'error')}
				</span>
			</div>
		</div>
	</div>

	<div class="col-md-6">
		<div
			class="form-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'buildingOpening', 'error')} ">
			<label for="buildingOpening" class="col-md-2 control-label"><g:message
					code="liftInfo.buildingOpening.label" default="Building Opening" /></label>
			<div class="col-md-10">
				<g:textField name="buildingOpening"
					value="${liftInfoInstance?.buildingOpening}" />
				<span class="help-inline"> ${hasErrors(bean: liftInfoInstance, field: 'buildingOpening', 'error')}
				</span>
			</div>
		</div>

		<div
			class="form-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'carCapacity', 'error')} required">
			<label for="carCapacity" class="col-md-2 control-label"><g:message
					code="liftInfo.carCapacity.label" default="Car Capacity" /><span
				class="required-indicator">*</span></label>
			<div class="col-md-10">
				<g:field type="number" name="carCapacity" required=""
					value="${liftInfoInstance.carCapacity}" />
				<span class="help-inline"> ${hasErrors(bean: liftInfoInstance, field: 'carCapacity', 'error')}
				</span>
			</div>
		</div>

		<div
			class="form-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'typeOfElevator', 'error')} ">
			<label for="typeOfElevator" class="col-md-2 control-label"><g:message
					code="liftInfo.typeOfElevator.label" default="Type Of Elevator" /></label>
			<div class="col-md-10">
				<g:textField name="typeOfElevator"
					value="${liftInfoInstance?.typeOfElevator}" />
				<span class="help-inline"> ${hasErrors(bean: liftInfoInstance, field: 'typeOfElevator', 'error')}
				</span>
			</div>
		</div>

		<div
			class="form-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'motorHP', 'error')} ">
			<label for="motorHP" class="col-md-2 control-label"><g:message
					code="liftInfo.motorHP.label" default="Motor HP" /></label>
			<div class="col-md-10">
				<g:textField name="motorHP" value="${liftInfoInstance?.motorHP}" />
				<span class="help-inline"> ${hasErrors(bean: liftInfoInstance, field: 'motorHP', 'error')}
				</span>
			</div>
		</div>

		<div
			class="form-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'motorCurrent', 'error')} ">
			<label for="motorCurrent" class="col-md-2 control-label"><g:message
					code="liftInfo.motorCurrent.label" default="Motor Current" /></label>
			<div class="col-md-10">
				<g:textField name="motorCurrent"
					value="${liftInfoInstance?.motorCurrent}" />
				<span class="help-inline"> ${hasErrors(bean: liftInfoInstance, field: 'motorCurrent', 'error')}
				</span>
			</div>
		</div>

		<div
			class="form-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'motorRpm', 'error')} ">
			<label for="motorRpm" class="col-md-2 control-label"><g:message
					code="liftInfo.motorRpm.label" default="Motor Rpm" /></label>
			<div class="col-md-10">
				<g:textField name="motorRpm" value="${liftInfoInstance?.motorRpm}" />
				<span class="help-inline"> ${hasErrors(bean: liftInfoInstance, field: 'motorRpm', 'error')}
				</span>
			</div>
		</div>

		<div
			class="form-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'governerSpeed', 'error')} ">
			<label for="governerSpeed" class="col-md-2 control-label"><g:message
					code="liftInfo.governerSpeed.label" default="Governer Speed" /></label>
			<div class="col-md-10">
				<g:textField name="governerSpeed"
					value="${liftInfoInstance?.governerSpeed}" />
				<span class="help-inline"> ${hasErrors(bean: liftInfoInstance, field: 'governerSpeed', 'error')}
				</span>
			</div>
		</div>

		<div
			class="form-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'trippingSpeed', 'error')} ">
			<label for="trippingSpeed" class="col-md-2 control-label"><g:message
					code="liftInfo.trippingSpeed.label" default="Tripping Speed" /></label>
			<div class="col-md-10">
				<g:textField name="trippingSpeed"
					value="${liftInfoInstance?.trippingSpeed}" />
				<span class="help-inline"> ${hasErrors(bean: liftInfoInstance, field: 'trippingSpeed', 'error')}
				</span>
			</div>
		</div>

		<div
			class="form-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'machineMake', 'error')} ">
			<label for="machineMake" class="col-md-2 control-label"><g:message
					code="liftInfo.machineMake.label" default="Machine Make" /></label>
			<div class="col-md-10">
				<g:textField name="machineMake"
					value="${liftInfoInstance?.machineMake}" />
				<span class="help-inline"> ${hasErrors(bean: liftInfoInstance, field: 'machineMake', 'error')}
				</span>
			</div>
		</div>

		<div
			class="form-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'pulleyDiameter', 'error')} ">
			<label for="pulleyDiameter" class="col-md-2 control-label"><g:message
					code="liftInfo.pulleyDiameter.label" default="Pulley Diameter" /></label>
			<div class="col-md-10">
				<g:textField name="pulleyDiameter"
					value="${liftInfoInstance?.pulleyDiameter}" />
				<span class="help-inline"> ${hasErrors(bean: liftInfoInstance, field: 'pulleyDiameter', 'error')}
				</span>
			</div>
		</div>

		<div
			class="form-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'numberOfGrooves', 'error')} ">
			<label for="numberOfGrooves" class="col-md-2 control-label"><g:message
					code="liftInfo.numberOfGrooves.label" default="Number Of Grooves" /></label>
			<div class="col-md-10">
				<g:textField name="numberOfGrooves"
					value="${liftInfoInstance?.numberOfGrooves}" />
				<span class="help-inline"> ${hasErrors(bean: liftInfoInstance, field: 'numberOfGrooves', 'error')}
				</span>
			</div>
		</div>

		<div
			class="form-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'ropeSize', 'error')} ">
			<label for="ropeSize" class="col-md-2 control-label"><g:message
					code="liftInfo.ropeSize.label" default="Rope Size" /></label>
			<div class="col-md-10">
				<g:textField name="ropeSize" value="${liftInfoInstance?.ropeSize}" />
				<span class="help-inline"> ${hasErrors(bean: liftInfoInstance, field: 'ropeSize', 'error')}
				</span>
			</div>
		</div>

		<div
			class="form-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'numberOfRopes', 'error')} ">
			<label for="numberOfRopes" class="col-md-2 control-label"><g:message
					code="liftInfo.numberOfRopes.label" default="Number Of Ropes" /></label>
			<div class="col-md-10">
				<g:textField name="numberOfRopes"
					value="${liftInfoInstance?.numberOfRopes}" />
				<span class="help-inline"> ${hasErrors(bean: liftInfoInstance, field: 'numberOfRopes', 'error')}
				</span>
			</div>
		</div>

		<div
			class="form-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'servicePeriod', 'error')} ">
			<label for="servicePeriod" class="col-md-2 control-label"><g:message
					code="liftInfo.servicePeriod.label" default="Service Period" /></label>
			<div class="col-md-10">
				<g:textField name="servicePeriod"
					value="${liftInfoInstance?.servicePeriod}" />
				<span class="help-inline"> ${hasErrors(bean: liftInfoInstance, field: 'servicePeriod', 'error')}
				</span>
			</div>
		</div>
	</div>
</div>

<script>
	function toggleDriveFields(val) {
		if(val == 'YES') {
			$('.drive').show();	
		} else {
			$('.drive').hide();
		}
	}

	$(document).ready(function() {
		/*if($('#gateType').val() == 'OTHER') {
			$('.gateTypeOther').show();	
		} else {
			$('.gateTypeOther').hide();
		}*/
		
		$('#gateType').change(function(){
			if($(this).val() == 'OTHER') {
				$('.gateTypeOther').show();	
			} else {
				$('.gateTypeOther').hide();
			}
		});
	});
</script>