exports.handler = async function(event) {
  // Close the support case    
  const myCaseStatus = event.Status;    
  const myCaseID = event.Case;    
  const myMessage = event.Message + "closed. ";    
  const result = {Case: myCaseID, Status : myCaseStatus, Message: myMessage};

  return result;
};
