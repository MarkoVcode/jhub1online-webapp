library abstractResponse;

abstract class Response {
  
   bool isError = false;
   String errorMessage;
  
   bool hasError() {
     return isError;
   }
   
   void setError() {
     isError = true;
   }
   
   void setErrorMessage(String msg) {
     setError();
     errorMessage = msg;
   }
   
   String getErrorMessage() {
     return errorMessage;
   }
}