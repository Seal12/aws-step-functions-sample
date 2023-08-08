exports.handler = async function(event) {
  // Assign the support case and update the status message    
  const myCaseID = event.Case;    
  const myMessage = event.Message + " assigned...";    
  const result = {Case: myCaseID, Message: myMessage};

  return result;
};