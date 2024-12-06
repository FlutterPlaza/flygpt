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


### Prerequisites

Before you begin, ensure the following are installed on your system:

1. **Flutter**  
   - Version: `3.20` or higher  
   - [Install Flutter](https://flutter.dev/docs/get-started/install)

2. **Docker**  
   - Ensure Docker is installed and running on your system.  
   - [Install Docker](https://docs.docker.com/get-docker/)

3. **Java Development Kit (JDK)**  
   - Version: `17` or higher  
   - [Download Java](https://www.oracle.com/java/technologies/javase-downloads.html)

---

## Step 1: Clone the Repository

1. Open your terminal or command prompt.  
2. Navigate to the directory where you want to store the project.  
3. Execute the following command to pull the `starter` branch of the FlyGPT repository:

   ```bash
   git clone --branch starter https://github.com/FlutterPlaza/flygpt.git
   ```

4. Navigate into the project directory:

   ```bash
   cd flygpt
   ```

---

## Step 2: Start the Server

To initialize and start the server, follow these steps:

1. Navigate to the server directory:

   ```bash
   cd flygpt_server
   ```

2. Install dependencies using Dart's package manager:

   ```bash
   dart pub get
   ```

3. Build and start the server in a detached mode with Docker:

   ```bash
   docker compose up --build --detach
   ```

4. Apply migrations to the database by running the following command:

   ```bash
   dart bin/main.dart --apply-migrations
   ```

   > **Note:** This step ensures the database schema is updated to the latest version required by the server.

---

Here's the updated documentation with **Step 3** included:

---

# FlyGPT App Creation Process

This document outlines the steps to create an app using the FlyGPT framework. Follow each section to ensure proper setup and a smooth workflow.

---

## Prerequisites

Before you begin, ensure the following are installed on your system:

1. **Flutter**  
   - Version: `3.20` or higher  
   - [Install Flutter](https://flutter.dev/docs/get-started/install)

2. **Docker**  
   - Ensure Docker is installed and running on your system.  
   - [Install Docker](https://docs.docker.com/get-docker/)

3. **Java Development Kit (JDK)**  
   - Version: `17` or higher  
   - [Download Java](https://www.oracle.com/java/technologies/javase-downloads.html)

---

## Step 1: Clone the Repository

1. Open your terminal or command prompt.  
2. Navigate to the directory where you want to store the project.  
3. Execute the following command to pull the `starter` branch of the FlyGPT repository:

   ```bash
   git clone --branch starter https://github.com/FlutterPlaza/flygpt.git
   ```

4. Navigate into the project directory:

   ```bash
   cd flygpt
   ```

---

## Step 2: Start the Server

To initialize and start the server, follow these steps:

1. Navigate to the server directory:

   ```bash
   cd flygpt_server
   ```

2. Install dependencies using Dart's package manager:

   ```bash
   dart pub get
   ```

3. Build and start the server in a detached mode with Docker:

   ```bash
   docker compose up --build --detach
   ```

4. Apply migrations to the database by running the following command:

   ```bash
   dart bin/main.dart --apply-migrations
   ```

   > **Note:** This step ensures the database schema is updated to the latest version required by the server.

---

### Step 3: Run the Flutter Application

1. Navigate to the Flutter project directory:

   ```bash
   cd ../flygpt_flutter
   ```

2. Run the Flutter application:

   ```bash
   flutter run
   ```

3. Verify that the app connects successfully to the server. The expected output should resemble the following image:

   ![Expected Result](https://miro.medium.com/v2/resize:fit:720/format:webp/1*dO9lj-3l383DBo06dknsIg.png)

   > **Tip:** If the app fails to connect, double-check that the server is running and accessible.
----
Got it! Here's the updated **Step 4** with the screenshot description added:

---

### Step 4: Update to Step-01 and Regenerate Server Dependencies

1. Switch to the `step-01` branch with the latest assets:

   ```bash
   git checkout step-01
   ```

2. Navigate back to the server directory:

   ```bash
   cd ../flygpt_server
   ```

3. Regenerate server dependencies:

   ```bash
   serverpod generate
   ```

4. Create new database migrations:

   ```bash
   serverpod create-migrations
   ```

5. Apply migrations and restart the server:

   ```bash
   dart bin/main.dart --apply-migrations
   ```

6. Navigate to the Flutter directory and rerun the app:

   ```bash
   cd ../flygpt_flutter
   flutter run
   ```

7. Verify the app is running successfully. The app interface should look like the following:


 <img width="496" alt="Basic Login Page" src="https://github.com/user-attachments/assets/1a0cfa25-50d6-4a9d-86a4-3872f8ba08da">



   > **Tip:** If the UI does not load as expected, ensure the server is running correctly, and all migrations have been applied successfully.

---
### Step 5: Setup Navigation with Auto Route and Authentication

1. Switch to the `step-02` branch:

   ```bash
   git checkout step-02
   ```

2. Implement navigation using **Auto Route**:  
   - **Auto Route** simplifies navigation in Flutter by automating route generation and management.  
   - Ensure the required dependencies are already included in the project.  
   - Add routes by defining them in the appropriate route configuration file. Example:

     ```dart
       @AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
     class AppRouter extends RootStackRouter {
           AppRouter();

        final AuthGuard authGuard = AuthGuard();

        @override
        RouteType get defaultRouteType =>
         RouteType.material(); //.cupertino, .adaptive

        @override
        List<AutoRoute> get routes => [
        // HomeScreen is generated as HomeRoute because
        // of the replaceInRouteName property
              AutoRoute(
                page: SignInRoute.page,
             path: '/sign-in',
           ),
              AutoRoute(
                page: DashboardRoute.page,
             path: '/dashboard',
             initial: true,
             guards: [authGuard],
              ),
         ];
      }


      class AuthGuard extends AutoRouteGuard {

        @override
        void onNavigation(NavigationResolver resolver, StackRouter router) {
          // the navigation is paused until resolver.next() is called with either
          // true to resume/continue navigation or false to abort navigation
       if (sessionManager.isSignedIn) {
            // if user is authenticated we continue
            resolver.next(true);
       } else {
            // we redirect the user to our login page
            // tip: use resolver.redirect to have the redirected route
            // automatically removed from the stack when the resolver is completed
            resolver.redirect(
              SignInRoute(),
            );
          }
        }
      }
      ```

   - Run the following command to generate the routes:

     ```bash
     flutter pub run build_runner build -d
     ```

3. Set up authentication using the **Serverpod Session Manager**:
   - Use the Serverpod's session management to handle user authentication.
   - Update your `auth` logic to connect with the Serverpod server for login, signup, and session validation. Example:

     ```dart
         var client = Client('http://$localhost:8080/',
          authenticationKeyManager: FlutterAuthenticationKeyManager())
           ..connectivityMonitor = FlutterConnectivityMonitor();

         final sessionManager = SessionManager(caller: client.modules.auth);
     ```

4. After setting up navigation and authentication, test the functionality by running the app:

     ```bash
   cd ../flygpt_flutter
   flutter run
     ```

5. Verify that:
   - Authentication checks, such as login and signup, function correctly.
   - Ensure that logic page looks like 

![Screenshot 2024-12-06 at 9 47 25 AM](https://github.com/user-attachments/assets/236eaecf-4588-40b8-9b17-c5b5cb2b6e96)

---

### Step 6: Create a Dashboard Page and Update Authentication Logic (Continued)

1. **Switch to the `step-03` branch:**

   ```bash
   git checkout step-03
   ```

2. **Create the Dashboard Page:**

   - Add a new `DashboardScreen` to handle post-login navigation:

     ```dart
     @RoutePage()
     class DashboardScreen extends StatelessWidget {
       const DashboardScreen({
         super.key,
       });

       @override
       Widget build(BuildContext context) {
         MediaQuery.sizeOf(context);
         return MobileDashboardPage();
       }
     }
     ```

   - Ensure that the `MobileDashboardPage` is implemented and styled according to your app’s requirements.

3. **Update the Authentication Callback Logic:**

   - Open the file `sign_in_mobile_view.dart`.
   - Locate the authentication callback logic.
   - Modify it to navigate to the `DashboardRoute` after successful login:

     ```dart
     caller: client.modules.auth,
     onSignedIn: () {
       context.router.replace(DashboardRoute());
     },
     ```

   - This ensures that users are redirected to the `DashboardScreen` upon successful authentication.

4. **Test the Integration:**

   - Run the app:

     ```bash
     cd ../flygpt_flutter
     flutter run
     ```

   - Attempt to sign in. Once authenticated successfully, the app should navigate to the **Dashboard Page**.

5. **Verification Checklist:**
   - The login flow in `sign_in_mobile_view.dart` properly redirects users to the `DashboardScreen`.
   - App should look like 

  

https://github.com/user-attachments/assets/88df0489-204c-410a-bc98-5189746c937a



> **Note:** Ensure the `DashboardRoute` is defined in your `AutoRoute` configuration, and the necessary dependencies are included in your project.

> **Tip:** Ensure any server-side authentication logic in **Serverpod** is correctly configured to validate user sessions.

### Contributions  
We welcome contributions! Whether you're fixing bugs, adding features, or suggesting improvements, your input is valuable. Fork the repository and open a pull request.  

---

© 2024 FlutterPlaza. All rights reserved.
FlyGPT is maintained by FlutterPlaza and its contributors.

Transform your Flutter development with FlyGPT – the future of code-generated, multi-platform apps! 🚀
