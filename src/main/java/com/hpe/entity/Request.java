/**
 * 
 */
package com.hpe.entity;


import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * @author wanfangg
 *
 */
@Entity(name="requestresource")
public class Request {
	private String id;
	private Date requestDate;
	private String projectName;
	private String projectStatus;
	private String account;
	private Date contractStartDate;
	private Date contractEndDate;
	private String requester;
	private String projectManager;
	private String deliveryLeader;
	private String numOfRequestedResource;
	private String secondaryLocation;
	private String primaryLocation;
	private String travelAllowed;
	private String resourceLevel;
	private String duration;
	private Date expectedOnboarddate;
	private String jobTitle;
	private String jobDescription;
	private String pmEmailAddress;
	
	@Id
	//@GenericGenerator(name = "idGenerator", strategy = "uuid")
	//@GeneratedValue(generator = "idGenerator")
	@Column()
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	@Column
	public Date getRequestDate() {
		return requestDate;
	}
	public void setRequestDate(Date requestDate) {
		this.requestDate = requestDate;
	}
	
	@Column(length=255)
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	
	@Column(length=255)
	public String getProjectStatus() {
		return projectStatus;
	}
	public void setProjectStatus(String projectStatus) {
		this.projectStatus = projectStatus;
	}
	
	@Column(length=255)
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	
	@Column
	public Date getContractStartDate() {
		return contractStartDate;
	}
	public void setContractStartDate(Date contractStartDate) {
		this.contractStartDate = contractStartDate;
	}
	
	@Column
	public Date getContractEndDate() {
		return contractEndDate;
	}
	public void setContractEndDate(Date contractEndDate) {
		this.contractEndDate = contractEndDate;
	}
	
	@Column(length=255)
	public String getRequester() {
		return requester;
	}
	public void setRequester(String requester) {
		this.requester = requester;
	}
	
	@Column(length=255)
	public String getProjectManager() {
		return projectManager;
	}
	public void setProjectManager(String projectManager) {
		this.projectManager = projectManager;
	}
	
	@Column(length=255)
	public String getDeliveryLeader() {
		return deliveryLeader;
	}
	public void setDeliveryLeader(String deliveryLeader) {
		this.deliveryLeader = deliveryLeader;
	}
	
	@Column(length=25)
	public String getNumOfRequestedResource() {
		return numOfRequestedResource;
	}
	public void setNumOfRequestedResource(String numOfRequestedResource) {
		this.numOfRequestedResource = numOfRequestedResource;
	}
	
	@Column(length=255)
	public String getSecondaryLocation() {
		return secondaryLocation;
	}
	public void setSecondaryLocation(String secondaryLocation) {
		this.secondaryLocation = secondaryLocation;
	}
	
	@Column(length=255)
	public String getPrimaryLocation() {
		return primaryLocation;
	}
	public void setPrimaryLocation(String primaryLocation) {
		this.primaryLocation = primaryLocation;
	}
	
	@Column(length=255)
	public String getTravelAllowed() {
		return travelAllowed;
	}
	public void setTravelAllowed(String travelAllowed) {
		this.travelAllowed = travelAllowed;
	}
	
	@Column(length=255)
	public String getResourceLevel() {
		return resourceLevel;
	}
	public void setResourceLevel(String resourceLevel) {
		this.resourceLevel = resourceLevel;
	}
	
	@Column(length=255)
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	
	@Column
	public Date getExpectedOnboarddate() {
		return expectedOnboarddate;
	}
	public void setExpectedOnboarddate(Date expectedOnboarddate) {
		this.expectedOnboarddate = expectedOnboarddate;
	}
	
	@Column(length=255)
	public String getJobTitle() {
		return jobTitle;
	}
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	
	@Column(length=65535)
	public String getJobDescription() {
		return jobDescription;
	}
	public void setJobDescription(String jobDescription) {
		this.jobDescription = jobDescription;
	}
	
	@Column(length=255)
	public String getPmEmailAddress() {
		return pmEmailAddress;
	}
	public void setPmEmailAddress(String pmEmailAddress) {
		this.pmEmailAddress = pmEmailAddress;
	}

}
