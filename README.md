# Online Quiz System - Java Setup Guide

> [!IMPORTANT]
> This guide assumes you have **MySQL** and **Apache Tomcat 9+** installed on your Windows machine.

## 1. Database Setup

1.  Open your MySQL Workbench or Command Line.
2.  Run the script located at `database/schema.sql`.
    *   This will create the database `quiz_db` and all necessary tables.
    *   It also inserts a default admin user and some sample quizzes.
3.  **Update Database Password**:
    *   Open `src/com/quiz/util/DBConnection.java`.
    *   Update the `PASSWORD` constant with your local MySQL root password.

## 2. Java Project Import

You can open this project in **Eclipse**, **IntelliJ**, or **NetBeans**.

### Eclipse Instructions (Recommended for Servlets)
1.  **File** > **Open Projects from File System...**
2.  Select the `OnlineQuizSystem` folder.
3.  Right-click the project > **Build Path** > **Configure Build Path**.
4.  tab **Libraries** > **Add External JARs**.
    *   Add `mysql-connector-java-8.0.x.jar` (Download this if you don't have it).
    *   Add `servlet-api.jar` (Usually found in your `Tomcat/lib` folder).
5.  Apply and Close.

## 3. Deployment (Running the App)

1.  **Add to Server**:
    *   In Eclipse 'Servers' view, right-click Tomcat > **Add and Remove...**.
    *   Add `OnlineQuizSystem`.
2.  **Run**:
    *   Right-click project > **Run As** > **Run on Server**.
3.  **Access**:
    *   Browser will open `http://localhost:8080/OnlineQuizSystem/`.

## 4. Usage

*   **Student Login**:
    *   Register a new user.
    *   Login to see dashboard.
    *   Select a quiz and attempt it.
*   **Admin Login**:
    *   Username: `admin`
    *   Password: `admin123`
    *   Go to Admin Panel to add questions or view results.

## 5. Troubleshooting

> [!WARNING]
> **Common Error: ClassNotFoundException**
> Ensure `mysql-connector-java.jar` is in your `WebContent/WEB-INF/lib` folder IF you are exporting a WAR file. For IDE running, clean build path is enough. To be safe, copy the mysql jar to `WebContent/WEB-INF/lib`.

> [!WARNING]
> **Common Error: 404 Not Found**
> Check if Tomcat is running and the URL is correct.
