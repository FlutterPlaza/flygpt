# FlyGPT  

**Description:**  
FlyGPT is a **ChatGPT-inspired app** crafted with **Flutter** and **Serverpod**, designed for a seamless **multi-platform experience**. This project emphasizes the use of **code generation** with tools like **build_runner** and custom **build_generator** to streamline development and optimize performance across mobile, web, and desktop platforms.  

### Features  
- 🧠 **AI-Powered Chat**: ( Engaging conversational interface, inspired by ChatGPT.  
- 🌐 **Multi-Platform Compatibility**: Effortlessly works on mobile, web, and desktop.  
- 🛠️ **Serverpod Backend**: Robust, scalable backend for real-time communication and API management.  
- 🔄 **Code Generation**: Automated model creation, serialization, and synchronization across client and server.  

### Why FlyGPT?  
FlyGPT showcases the potential of **code generation** to revolutionize **Flutter development**, creating a unified and optimized development workflow for multi-platform applications. It demonstrates how tools like Serverpod and custom generators can bridge the gap between frontend and backend, improving productivity and maintainability.  

### Tech Stack  
- **Flutter**: Multi-platform UI framework.  
- **Serverpod**: Dart-based backend for server-side logic and real-time communication.  
- **Build Runner**: Automated code generation for Dart.  

### Getting Started  
1. Clone the repository:  
   ```bash
   git clone https://github.com/FlutterPlaza/flygpt.git


### Step 7: Add History Model and Create Chat History Page

1. **Switch to the `step-04` branch:**

   ```bash
   git checkout step-04
   ```

2. **Understand the CRUD Operation Methods:**
   - Open the `flygpt_server/lib/src/endpoints/history_endpoint.dart` file.
   - Note that the server's CRUD methods for the `History` model are automatically generated in the `flygpt_client` package, making them readily available for client use.

3. **Create the `History` Model:**

   - Navigate to the `flygpt_server/lib/src/models` folder.
   - Create a new file named `history.sky.yaml` with the following content:

     ```yaml
     # Yaml-files in the `models` directory specify which serializable objects
     # should be generated. When you add or modify a file, you will need to run
     # `serverpod generate` to make the generated classes available in the server and
     # client.
     #
     # Please consult the documentation for more information on what you can add to
     # your yaml-files.

     # Name of the class to generate.
     class: History

     # Add the table key, if this class represents a row in the database.
     table: history

     # The fields (and columns if connected to the database) of the class. Supported types are 
     # `bool`, `int`, `double`, `String`, `UuidValue`, `Duration`, `DateTime`, `ByteData`, 
     # and other serializable classes, exceptions and enums. 
     # You can also add lists of objects and types have support for null safety. 
     # Eg. `List<int>?` or `List<MyOtherClass?>`.
     fields:
       desc: String
       dateTime: DateTime
       iconData: String
       chats: Map<DateTime, String>
       createdBy: module:auth:UserInfo?, relation
     ```

4. **Generate Server and Client Code:**

   - Run the following command to generate the server and client code for the `History` model:

     ```bash
     serverpod generate
     ```

   - This will create the necessary classes in the server and client libraries.

5. **Create the `ChatHistoryPage` in Flutter:**

   - Navigate to the `flygpt_flutter/lib/screens/chat/chat_history` directory.
   - Create a new file named `chat_history.dart` with the following content:

     ```dart
     class ChatHistory extends StatelessWidget {
       const ChatHistory({super.key});

       @override
       Widget build(BuildContext context) {
         return BlocBuilder<ChatHistoryBloc, ChatHistoryState>(
           builder: (context, state) {
             return ListView.builder(
               itemCount: state.sectionedHistories.length,
               itemBuilder: (context, index) {
                 final entry = state.sectionedHistories.entries.elementAt(index);
                 return HistorySection(
                   date: entry.key,
                   histories: entry.value,
                 );
               },
             );
           },
         );
       }
     }
     ```

### Step 8: Add Chat Route to AutoRouter and Create the Chat Screen

1. **Update the AutoRouter Configuration:**

   - Open your `AutoRouter` configuration file (typically located at `flygpt_flutter/lib/routes/app_router.dart` or similar).
   - Add the following route to define the `ChatRoute`:

     ```dart
     AutoRoute(
       page: ChatRoute.page,
       path: '/chat',
       guards: [authGuard],
     ),
     ```

   - Ensure that `authGuard` is properly implemented to restrict access to authenticated users only.

2. **Create the Chat Screen:**

   - Navigate to the `flygpt_flutter/lib/screens/chat` directory.
   - Create a new file named `chat_screen.dart`.
   - Add the following content:

     ```dart
     @RoutePage()
     class ChatScreen extends StatelessWidget {
       const ChatScreen({
         super.key,
       });

       @override
       Widget build(BuildContext context) {
         MediaQuery.sizeOf(context);
         return Center(
           child: Text('New Chat'),
         );
       }
     }
     ```


     ### Step 9: Generate Code Before Running the App

Before running the app, generate the necessary code for the `AutoRouter` configuration and other code generation tasks using `build_runner`. Follow these steps:

1. **Run the Build Runner Command:**

   - Navigate to the Flutter project directory:

     ```bash
     cd ../flygpt_flutter
     ```

   - Execute the following command to generate the required code:

     ```bash
     dart run build_runner build -d
     ```

   - This will ensure that all necessary files, such as `AutoRoute` configuration and other generated code, are up to date.

   - If you want to navigate to the `ChatScreen`, use the following code snippet:

     ```dart
     context.router.push(const ChatRoute());
     ```

2. **Run the App:**

   - After the code generation is complete, run the app:

     ```bash
     flutter run
     ```

3. **Verify the Application:**

   - Ensure the following:
     - The `ChatRoute` is functional and navigates to the `ChatScreen`.
     - All generated files are properly integrated, and there are no runtime errors.
     - App should look like 



https://github.com/user-attachments/assets/badbad3b-624e-4b37-984a-f729a95e8627





---

> **Tip:** Always run the `build_runner` command whenever you make changes to `AutoRoute` configurations or any files that require code generation. Let me know if there are any issues!

> **Tip:** Replace the placeholder `Center(child: Text('New Chat'))` with your actual chat UI as you implement the full chat functionality. Let me know if you’d like help with that!

> **Tip:** If the `ChatHistoryBloc` or `HistorySection` components are not yet implemented, ensure they are created and properly integrated with the app's state management and UI design. 


### Contributions  
We welcome contributions! Whether you're fixing bugs, adding features, or suggesting improvements, your input is valuable. Fork the repository and open a pull request.  

---

© 2024 FlutterPlaza. All rights reserved.
FlyGPT is maintained by FlutterPlaza and its contributors.

Transform your Flutter development with FlyGPT – the future of code-generated, multi-platform apps! 🚀
