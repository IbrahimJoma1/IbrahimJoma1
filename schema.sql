-- 1. جدول المستخدمين
CREATE TABLE USER (
    User_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    role ENUM('organizer', 'volunteer') NOT NULL
);

-- 2. جدول المهام
CREATE TABLE TASK (
    Task_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    task_date DATETIME NOT NULL,
    situation ENUM('open', 'closed', 'in_progress') DEFAULT 'open'
);

-- 3. جدول طلبات التكليف/التقديم
CREATE TABLE ASSIGNMENT (
    ass_id INT AUTO_INCREMENT PRIMARY KEY,
    User_id INT NOT NULL,
    Task_id INT NOT NULL,
    status ENUM('Pending', 'Accepted', 'Rejected') DEFAULT 'Pending',
    FOREIGN KEY (User_id) REFERENCES USER(User_id) ON DELETE CASCADE,
    FOREIGN KEY (Task_id) REFERENCES TASK(Task_id) ON DELETE CASCADE,
    CONSTRAINT unique_user_task UNIQUE (User_id, Task_id)
);

-- 4. جدول الإشعارات
CREATE TABLE NOTIFICATION (
    Note_id INT AUTO_INCREMENT PRIMARY KEY,
    User_id INT NOT NULL,
    note_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    massege TEXT NOT NULL,
    FOREIGN KEY (User_id) REFERENCES USER(User_id) ON DELETE CASCADE
);
