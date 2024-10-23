ADMIN DASHBOARD
=================
- How many user type will be there ?
    - Super Admin
    - Vendor
    - Retailer User

-  Affiliate/Vendor Program Features
    - Affiliate Dashboard
        - Real-time tracking of referrals, clicks, and conversions.
        - Detailed analytics and reporting.
        - Commission overview and payment history.
    - Commission Structure
        - Flat 30% commission on the final invoice value.
        - Clear information on how commissions are calculated and paid out.
    - Promotional Materials
        - Banners, ads, and email templates that affiliates can use.
        - Content and resources to help affiliates educate potential customers.
    - Educational Resources
        - Training materials and webinars for affiliates.
        - How to use the GoVyapar portal to fill the income tax?
    - Support and Communication
        - Dedicated support for affiliates/Vendor.
        - Regular newsletters with updates, tips, and exclusive offers.
    - Compliance and Legal
        - Clear terms and conditions for the affiliate program.
        - GDPR and privacy compliance.
    - Incentives and Bonuses
        - Additional rewards or bonuses for top-performing affiliates.
        - Special promotions or seasonal incentives.

### **Affiliate/Vendor Program Specifics**

**How it Works Section:**
1. **Step 1**: Join the affiliate program and get your unique referral link.
2. **Step 2**: Educate people about GoVyapar and nudge them to file their ITR using your link.
3. **Step 3**: Once the user files their ITR using your link, you will earn a flat 30% reward on the final invoice.
4. **Step 4**: Timely payments ensure instant redemption of your affiliate commissions.


To create an admin portal and system where retailer users can upload required documents and vendors can fill ITRs and earn commissions, here is a comprehensive system design along with database details.

### **System Design**

#### **1. User Roles:**
- **Admin:** Manages the entire platform, including users, documents, and commissions.
- **Retailer:** Uploads required documents and information for ITR filing.
- **Vendor:** Fills the ITRs for retailer customers and earns commissions.

#### **2. High-Level Architecture:**
- **Frontend:** React.js for the user interface.
- **Backend:** Node.js with Express.js for the server.
- **Database:** MongoDB for storing data.
- **Authentication:** JWT (JSON Web Tokens) for secure authentication.
- **File Storage:** AWS S3 or similar service for storing uploaded documents.

#### **3. Features and Functionality:**

**Admin Panel:**
- Dashboard: Overview of activities, user statistics, and system status.
- User Management: Create, update, delete, and manage users (Retailers and Vendors).
- Document Management: View and manage uploaded documents.
- Commission Management: Track and manage commissions for vendors.
- Notifications: Send notifications to users.
- Reports: Generate reports on activities, earnings, and user performance.

**Retailer Portal:**
- Upload Documents: Upload necessary documents for ITR filing.
- Document Status: Track the status of uploaded documents.
- Notification: Receive notifications about document status and ITR filing.
- Support: Contact support for any issues.

**Vendor Portal:**
- View Documents: Access and download documents uploaded by retailers.
- Fill ITR: Fill the ITR for retailer customers.
- Commission Tracking: Track earned commissions and payment status.
- Notification: Receive notifications about new document uploads and ITR statuses.
- Support: Contact support for any issues.

#### **4. Database Design:**

**Collections and Schema:**

1. **Users:**
   ```json
   {
     "userId": "string",
     "name": "string",
     "email": "string",
     "password": "string",
     "role": "string", // Admin, Retailer, Vendor
     "createdAt": "date",
     "updatedAt": "date"
   }
   ```

2. **Documents:**
   ```json
   {
     "documentId": "string",
     "retailerId": "string",
     "vendorId": "string",
     "filePath": "string",
     "status": "string", // Uploaded, In Progress, Completed
     "uploadedAt": "date",
     "updatedAt": "date"
   }
   ```

3. **Commissions:**
   ```json
   {
     "commissionId": "string",
     "vendorId": "string",
     "retailerId": "string",
     "amount": "number",
     "status": "string", // Pending, Paid
     "createdAt": "date",
     "updatedAt": "date"
   }
   ```

4. **Notifications:**
   ```json
   {
     "notificationId": "string",
     "userId": "string",
     "message": "string",
     "read": "boolean",
     "createdAt": "date"
   }
   ```

#### **5. System Flow:**

1. **User Registration and Login:**
   - Users register and log in using their credentials.
   - JWT tokens are issued for authenticated sessions.

2. **Document Upload (Retailer):**
   - Retailer uploads documents via the portal or WhatsApp.
   - Documents are stored in AWS S3, and metadata is stored in the database.

3. **ITR Filing (Vendor):**
   - Vendor views available documents for their assigned retailers.
   - Vendor fills the ITR and updates the document status.
   - Commissions are calculated and tracked.

4. **Commission Management:**
   - Admin tracks and manages commissions.
   - Vendors can view their earned commissions and payment status.

5. **Notifications:**
   - Users receive notifications about document status, ITR filing, and commission updates.

### **Technical Stack:**

- **Frontend:**
  - React.js
  - Redux (for state management)
  - React Router (for navigation)
  - Axios (for API calls)

- **Backend:**
  - Node.js
  - Express.js
  - JWT (for authentication)
  - Multer (for handling file uploads)
  - Mongoose (for MongoDB interaction)

- **Database:**
  - MongoDB (with Mongoose for schema management)

- **File Storage:**
  - AWS S3 (for storing uploaded documents)

### **API Endpoints:**

1. **Authentication:**
   - `POST /api/auth/register`: Register a new user.
   - `POST /api/auth/login`: Login and get JWT token.

2. **Document Management:**
   - `POST /api/documents/upload`: Upload a document.
   - `GET /api/documents`: Get all documents (Admin).
   - `GET /api/documents/:retailerId`: Get documents by retailer (Vendor).
   - `PUT /api/documents/:documentId`: Update document status.

3. **Commission Management:**
   - `GET /api/commissions`: Get all commissions (Admin).
   - `GET /api/commissions/:vendorId`: Get commissions by vendor.
   - `PUT /api/commissions/:commissionId`: Update commission status.

4. **User Management:**
   - `GET /api/users`: Get all users (Admin).
   - `PUT /api/users/:userId`: Update user information.
   - `DELETE /api/users/:userId`: Delete a user.

5. **Notifications:**
   - `GET /api/notifications/:userId`: Get notifications by user.
   - `PUT /api/notifications/:notificationId`: Mark notification as read.

By implementing this system design, you can create a robust admin portal and affiliate system that allows retailers to upload documents, vendors to fill ITRs, and manage commissions effectively.