exports.handler = async function(event) {
  const myCaseID = event.Case;    
  const myMessage = event.Message + " assigned...";    
  const result = {Case: myCaseID, Message: myMessage};

  return result;  
}