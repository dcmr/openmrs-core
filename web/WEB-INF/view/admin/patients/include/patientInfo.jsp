<table>
	<tr>
		<td><spring:message code="Patient.gender"/></td>
		<td><spring:bind path="patient.gender">
			<select name="gender">
				<c:forEach items="${org.openmrs.util.OpenmrsConstants.GENDER}" var="map">
					<option value="${map.key}" <c:if test="${status.value == map.key}">selected</c:if>><spring:message code="Patient.gender.${map.key}"/></option>
				</c:forEach>
			</select>
			<c:if test="${status.errorMessage != ''}"><span class="error">${status.errorMessage}</span></c:if>
			</spring:bind>
		</td>
	</tr>
	<tr>
		<td><spring:message code="Patient.race"/></td>
		<td>
			<spring:bind path="patient.race">
				<input type="text" name="race" size="10" value="${status.value}" />
				<c:if test="${status.errorMessage != ''}"><span class="error">${status.errorMessage}</span></c:if>
			</spring:bind>
		</td>
	</tr>
	<tr>
		<td><spring:message code="Patient.birthdate"/></td>
		<td colspan="3">
			<spring:bind path="patient.birthdate">			
				<input type="text" name="birthdate" size="10" 
					   value="${status.value}" />
				<c:if test="${status.errorMessage != ''}"><span class="error">${status.errorMessage}</span></c:if> 
			</spring:bind>
			<spring:bind path="patient.birthdateEstimated">
				<spring:message code="Patient.birthdateEstimated"/>
				<input type="hidden" name="_birthdateEstimated">
				<input type="checkbox" name="birthdateEstimated" value="true" 
					   <c:if test="${status.value == true}">checked</c:if> />
				<c:if test="${status.errorMessage != ''}"><span class="error">${status.errorMessage}</span></c:if>
			</spring:bind>
		</td>
	</tr>
	<tr>
		<td><spring:message code="Patient.birthplace"/></td>
		<td>
			<spring:bind path="patient.birthplace">
				<input type="text" name="birthplace" value="${status.value}" />
				<c:if test="${status.errorMessage != ''}"><span class="error">${status.errorMessage}</span></c:if>
			</spring:bind>
		</td>
	</tr>
	<tr>
		<td><spring:message code="Patient.tribe"/></td>
		<td>
			<spring:bind path="patient.tribe">
				<select name="tribe">
					<openmrs:forEachRecord name="tribe">
						<option value="${record.tribeId}" <c:if test="${record.tribeId == status.value}">selected</c:if>>
							${record.name}
						</option>
					</openmrs:forEachRecord>
				</select>
				<c:if test="${status.errorMessage != ''}"><span class="error">${status.errorMessage}</span></c:if>
			</spring:bind>
		</td>
	</tr>
	<tr>
		<td><spring:message code="Patient.citizenship"/></td>
		<td>
			<spring:bind path="patient.citizenship">
				<input type="text" name="citizenship" value="${status.value}" />
				<c:if test="${status.errorMessage != ''}"><span class="error">${status.errorMessage}</span></c:if>
			</spring:bind>
		</td>
	</tr>
	<tr>
		<td><spring:message code="Patient.mothersName"/></td>
		<td>
			<spring:bind path="patient.mothersName">
				<input type="text" name="mothersName" value="${status.value}" />
				<c:if test="${status.errorMessage != ''}"><span class="error">${status.errorMessage}</span></c:if>
			</spring:bind>
		</td>
	</tr>
	<tr>
		<td><spring:message code="Patient.civilStatus"/></td>
		<td>
			<spring:bind path="patient.civilStatus">
				<select name="civilStatus">
					<openmrs:forEachRecord name="civilStatus" select="${status.value}">
						<option value="${record.key}" ${selected}>
							${record.value}
						</option>
					</openmrs:forEachRecord>
				</select>
				<c:if test="${status.errorMessage != ''}"><span class="error">${status.errorMessage}</span></c:if>
			</spring:bind>
		</td>
	</tr>
	<tr>
		<td><spring:message code="Patient.deathDate"/></td>
		<td>
			<spring:bind path="patient.deathDate">
			<input type="text" name="deathDate" size="10" 
				   value="${status.value}" />
			<c:if test="${status.errorMessage != ''}"><span class="error">${status.errorMessage}</span></c:if>
			</spring:bind>
		</td>
		<td><spring:message code="Patient.causeOfDeath"/></td>
		<td>
			<spring:bind path="patient.causeOfDeath">
				<input type="text" name="causeOfDeath" value="${status.value}" />
				<c:if test="${status.errorMessage != ''}"><span class="error">${status.errorMessage}</span></c:if>
			</spring:bind>
		</td>
	</tr>
	<tr>
		<td><spring:message code="Patient.gender"/></td>
		<td>
			<spring:bind path="patient.healthDistrict">
				<input type="text" name="healthDistrict" value="${status.value}" />
				<c:if test="${status.errorMessage != ''}"><span class="error">${status.errorMessage}</span></c:if>
			</spring:bind>
		</td>
	</tr>
	<tr>
		<td><spring:message code="Patient.healthCenter"/></td>
		<td>
			<!-- TODO make this list of locations> -->
			<spring:bind path="patient.healthCenter">
				<input type="text" name="healthCenter" value="${status.value}" />
				<c:if test="${status.errorMessage != ''}"><span class="error">${status.errorMessage}</span></c:if>
			</spring:bind>
		</td>
	</tr>
	<c:if test="${!(patient.creator == null)}">
		<tr>
			<td><spring:message code="general.createdBy" /></td>
			<td>
				${patient.creator.firstName} ${patient.creator.lastName} -
				<openmrs:formatDate date="${patient.dateCreated}" type="long" />
			</td>
		</tr>
	</c:if>
	<c:if test="${!(patient.changedBy == null)}">
		<tr>
			<td><spring:message code="general.changedBy" /></td>
			<td>
				${patient.changedBy.firstName} ${patient.changedBy.lastName} -
				<openmrs:formatDate date="${patient.dateChanged}" type="long" />
			</td>
		</tr>
	</c:if>
	<tr>
		<td><spring:message code="general.voided"/></td>
		<td>
			<spring:bind path="patient.voided">
				<input type="hidden" name="_${status.expression}"/>
				<input type="checkbox" name="${status.expression}" 
					   <c:if test="${status.value == true}">checked</c:if> 
					   onClick="voidedBoxClick(this)"
				/>
			</spring:bind>
		</td>
	</tr>
	<tr>
		<td><spring:message code="general.voidReason"/></td>
		<spring:bind path="patient.voidReason">
			<td>
				<input type="text" name="${status.expression}" value="${status.value}" />
				<c:if test="${status.errorMessage != ''}"><span class="error">${status.errorMessage}</span></c:if>
			</td>
		</spring:bind>
	</tr>
	<c:if test="${patient.voided}" >
		<tr>
			<td><spring:message code="general.voidedBy"/></td>
			<td>
				${patient.voidedBy.firstName} ${patient.voidedBy.lastName} -
				<openmrs:formatDate date="${patient.dateVoided}" type="long" />
			</td>
		</tr>
	</c:if>
</table>