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

 <img width="496" alt="Screenshot 2024-12-06 at 9 49 36 AM" src="https://github.com/user-attachments/assets/1a0cfa25-50d6-4a9d-86a4-3872f8ba08da">


   > **Tip:** If the UI does not load as expected, ensure the server is running correctly, and all migrations have been applied successfully.

---


### Contributions  
We welcome contributions! Whether you're fixing bugs, adding features, or suggesting improvements, your input is valuable. Fork the repository and open a pull request.  

---

© 2024 FlutterPlaza. All rights reserved.
FlyGPT is maintained by FlutterPlaza and its contributors.

Transform your Flutter development with FlyGPT – the future of code-generated, multi-platform apps! 🚀
