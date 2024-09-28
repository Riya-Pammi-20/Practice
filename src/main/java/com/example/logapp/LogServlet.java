package com.example.logapp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LogServlet extends HttpServlet {
    private final LogService logService = new LogService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String logMessage = req.getParameter("message");
        if (logMessage != null) {
            logService.generateLog(logMessage);
        }
        resp.getWriter().write("Log generated: " + logMessage);
    }
}



// 
// The provided code defines a servlet called `LogServlet`, which is responsible for handling HTTP `GET` requests. When a request is received, it reads a message from the request, logs it using the `LogService`, and then sends a response back to the client confirming that the log was generated. Let’s break it down step by step.

// ### 1. Package Declaration

// ```java
// package com.example.logapp;
// ```

// - This line declares the package for the `LogServlet` class, which is `com.example.logapp`.
// - **Packages** organize related classes together and help avoid naming conflicts.

// ### 2. Import Statements

// ```java
// import javax.servlet.ServletException;
// import javax.servlet.http.HttpServlet;
// import javax.servlet.http.HttpServletRequest;
// import javax.servlet.http.HttpServletResponse;
// import java.io.IOException;
// ```

// - These import statements bring in the necessary classes to create a servlet:
//   - **HttpServlet**: A base class provided by the `javax.servlet.http` package for handling HTTP requests.
//   - **HttpServletRequest**: Represents the incoming HTTP request. It contains details like parameters, headers, and the request URL.
//   - **HttpServletResponse**: Represents the response that will be sent back to the client (usually a web browser).
//   - **ServletException** and **IOException**: Exception classes that handle errors when the servlet processes a request or writes a response.

// ### 3. Class Declaration

// ```java
// public class LogServlet extends HttpServlet {
// ```

// - The `LogServlet` class extends `HttpServlet`, meaning it inherits behavior for handling HTTP requests.
// - **HttpServlet** is a part of the Servlet API, and it provides default methods for handling various HTTP methods like `GET` and `POST`. In this case, the servlet overrides the `doGet` method to handle HTTP `GET` requests.

// ### 4. LogService Instance

// ```java
// private final LogService logService = new LogService();
// ```

// - The `logService` instance is created from the `LogService` class.
// - **LogService** is a custom class that generates logs using the `generateLog` method. This instance is used to log messages that come in through the HTTP request.

// ### 5. doGet Method

// ```java
// @Override
// protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
// ```

// - The `doGet` method is overridden from `HttpServlet` and is used to handle `GET` requests.
// - **HTTP `GET` requests** are typically used to request data from the server. In this case, it handles logging when a request is made with a specific message parameter.

// ### 6. Retrieving a Request Parameter

// ```java
// String logMessage = req.getParameter("message");
// ```

// - This line retrieves the value of the **"message"** parameter from the request using `req.getParameter()`. This parameter is passed as part of the query string in the URL.
//   - For example, if the user visits `/log?message=TestLog`, the value of `logMessage` will be `"TestLog"`.
// - If the **"message"** parameter is not provided, `logMessage` will be `null`.

// ### 7. Checking if the Message Exists

// ```java
// if (logMessage != null) {
//     logService.generateLog(logMessage);
// }
// ```

// - If the **logMessage** is not `null`, it calls the `generateLog` method of the `logService` object to log the message.
// - This means that only requests that include a message parameter will generate a log. If no message is provided, the log action is skipped.

// ### 8. Sending a Response Back to the Client

// ```java
// resp.getWriter().write("Log generated: " + logMessage);
// ```

// - After processing the log, the servlet sends a response back to the client using the `HttpServletResponse` object.
// - **resp.getWriter()**: Returns a `PrintWriter` object that is used to write the response body (the message that will be displayed to the user).
// - **"Log generated: " + logMessage**: The message sent to the client confirms that the log was generated, and it includes the log message that was received.
//   - If the user sent a request with `message=TestLog`, the response would be: **"Log generated: TestLog"**.

// ### Overall Flow

// 1. **Client Sends Request**:
//    - The client (e.g., a web browser) sends an HTTP `GET` request to the server with a `message` parameter, like `/log?message=TestLog`.

// 2. **Servlet Processes Request**:
//    - The servlet reads the `message` parameter from the request.
//    - If the `message` is present, it passes the message to the `LogService` to generate a log.

// 3. **Server Sends Response**:
//    - After generating the log, the servlet responds to the client with a confirmation message: **"Log generated: TestLog"**.

// ### Summary

// - The `LogServlet` class is a Java servlet that processes HTTP `GET` requests.
// - It extracts a **message** parameter from the request.
// - If a message is present, it logs that message using `LogService`.
// - Finally, it sends a response back to the client confirming that the log was generated.

// This setup could be used in a larger web application where users or developers need to generate and view logs through the browser or API.