exports.handler = async function(event) {
  // Create a support case using the input as the case ID, then return a confirmation message   
  const myCaseID = event.inputCaseID;
  const myMessage = "Case " + myCaseID + ": opened...";   
  const result = {Case: myCaseID, Message: myMessage};

  return result;
}