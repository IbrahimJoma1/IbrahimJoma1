# Software Requirements Specification (SRS)
## Volunteer Coordination & Management System

**Document Version:** 1.0  
**Methodology:** Agile / Scrum  

---

## 1. Executive Summary & Problem Statement
- **Problem Description:** Communication between volunteers and event organizers is currently fragmented and inefficient. Important volunteer tasks frequently suffer from inadequate participation due to low task visibility and manual coordination challenges faced by organizers.
- **Project Goal:** Build a centralized Full-Stack web platform that streamlines volunteer management. The system empowers volunteers to easily discover and apply for open tasks while equipping organizers with structured tools to review applications and coordinate teams efficiently.

---

## 2. User Roles & Access Control
- **Organizer (Admin Role):** Creates and manages tasks, reviews volunteer applications, updates assignment statuses, and triggers automated updates.
- **Volunteer (User Role):** Browses available opportunities, submits task applications, tracks personal application statuses, and receives system notifications.

---

## 3. Project Scope Boundary

| In-Scope (MVP Release) | Out-of-Scope (Future Releases) |
| :--- | :--- |
| User Registration & JWT Authentication (Organizer & Volunteer roles) | Real-time direct chat or instant messaging between users |
| Task Management CRUD (Title, Description, Date, Situation) | Live GPS location tracking & interactive event mapping |
| Volunteer Task Application & Assignment status workflow | Payment processing or financial stipend distribution |
| Automated In-App Notifications for status updates | Native iOS & Android mobile applications |

---

## 4. System Requirements

### Functional Requirements (FR)
- **FR-01 Authentication:** Users can register with `name`, `email`, `password`, `phone`, and `role`, and log in with JWT tokens.
- **FR-02 Task Creation:** Organizers can post and update tasks with `title`, `description`, `task_date`, and status `situation`.
- **FR-03 Application Submission:** Volunteers can apply for open tasks, creating an `ASSIGNMENT` record with status initialized to `Pending`.
- **FR-04 Status Management:** Organizers can transition application statuses from `Pending` to `Accepted` or `Rejected`.
- **FR-05 Automated Alerts:** The system automatically records a `NOTIFICATION` entry containing timestamp and message whenever an assignment status updates.

### Non-Functional Requirements (NFR)
- **NFR-01 Security:** Passwords must be hashed using `bcrypt` before database storage. Protected API endpoints must enforce role-based middleware.
- **NFR-02 Performance:** API response time for data retrieval and status updates must remain under 2 seconds.
- **NFR-03 Data Integrity:** Relational integrity and foreign keys must be enforced across all entities to prevent orphan records.

---

## 5. Relational Database Schema & Entities

```sql
USER (User_id [PK], name, email, password, phone, role)
TASK (Task_id [PK], title, description, task_date, situation)
ASSIGNMENT (ass_id [PK], User_id [FK], Task_id [FK], status)
NOTIFICATION (Note_id [PK], User_id [FK], note_date, massege)
