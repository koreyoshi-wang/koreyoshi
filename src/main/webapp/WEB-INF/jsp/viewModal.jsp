<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- View Modal -->
<div class="modal fade" id="viewModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" style="width:1200px">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Request Detail</h4>
      </div>
      <div class="modal-body">
        <div class="row">
          <form role="form" action="" method="post" >
            <div class="col-lg-4">
              <div class="form-group">
                <label >
                  Project name:
                </label>
                <input value="${currentRequest.projectName}" class="form-control" readonly="readonly">
              </div>
              <div class="form-group">
                <label >
                  Primary Location:
                </label>
                <input value="${currentRequest.primaryLocation}" class="form-control" readonly="readonly">
              </div>
              <div class="form-group">
                <label >
                  Project Manager:
                </label>
                <input value="${currentRequest.projectManager}" class="form-control" readonly="readonly">
              </div>
              <div class="form-group">
                <label >
                  Job Title:
                </label>
                <input value="${currentRequest.jobTitle}" class="form-control" readonly="readonly">
              </div>
              <div class="form-group">
                <label >
                  Duration:
                </label>
                <input value="${currentRequest.duration}" class="form-control" readonly="readonly">
              </div>
              <div class="form-group">
                <label >
                  PM Email Address:
                </label>
                <input value="${currentRequest.pmEmailAddress}" class="form-control" readonly="readonly">
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <label >
                  Contract Start Date:
                </label>
                <input value="${currentRequest.contractStartDate}" class="form-control" readonly="readonly">
              </div>
              <div class="form-group">
                <label >
                  Secondary Location:
                </label>
                <input value="${currentRequest.secondaryLocation}" class="form-control" readonly="readonly">
              </div>
              <div class="form-group">
                <label >
                  Delivery Leader:
                </label>
                <input value="${currentRequest.deliveryLeader}" class="form-control" readonly="readonly">
              </div>
              <div class="form-group">
                <label >
                  Account:
                </label>
                <input value="${currentRequest.account}" class="form-control" readonly="readonly">
              </div>
              <div class="form-group">
                <label >
                  Number of requested resource:
                </label>
                <input value="${currentRequest.numOfRequestedResource}" class="form-control" readonly="readonly">
              </div>
              <div class="form-group">
                <label >
                  Travel Allowed:
                </label>
                <input value="${currentRequest.travelAllowed}" class="form-control" readonly="readonly">
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <label >
                  Contract End Date:
                </label>
                <input value="${currentRequest.contractEndDate}" class="form-control" readonly="readonly">
              </div>
              <div class="form-group">
                <label >
                  Expected Onboard date:
                </label>
                <input value="${currentRequest.expectedOnboarddate}" class="form-control" readonly="readonly">
              </div>
              <div class="form-group">
                <label >
                  Requester:
                </label>
                <input value="${currentRequest.requester}" class="form-control" readonly="readonly">
              </div>
              <div class="form-group">
                <label >
                  Resource Level:
                </label>
                <input value="${currentRequest.resourceLevel}" class="form-control" readonly="readonly">
              </div>
              <div class="form-group">
                <label >
                  Resource Status:
                </label>
                <input value="${currentRequest.projectStatus}" class="form-control" readonly="readonly">
              </div>
              <div class="form-group">
                <label >
                  Request date:
                </label>
                <input value="${currentRequest.requestDate}" class="form-control" readonly="readonly">
              </div>
            </div>
            <div class="col-lg-12">
              <div class="form-group">
                <label >
                  Job Description:
                </label>
                <div class="form-group">
                  <textarea class="form-control" rows="5" readonly="readonly">${currentRequest.jobDescription}</textarea>
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
      <div class="modal-footer" >
        <!-- <button type="button" data-dismiss="modal" class="btn btn-default pull-left" >Close</button> -->
    </div>
  </div>
  <!-- /.modal-content -->
</div>
<!-- /.modal -->
</div>
<!--End View Modal -->
