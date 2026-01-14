# Domain Monitor

![License](https://img.shields.io/badge/License-Apache%202.0-green.svg)
![Ruby](https://img.shields.io/badge/Ruby-3.3.4-orange)
![Rails](https://img.shields.io/badge/Rails-8.1.2-red)

**Domain Monitor** is a robust open-source application built with **Ruby on Rails** designed to track the health,
uptime, and configuration status of your web properties. It provides a centralized dashboard to ensure your critical
services are online and your SSL certificates are valid.



https://github.com/user-attachments/assets/ceee4692-59e9-48b9-a99b-d3d7af8f8644




## 🛠️ Tech Stack

* **Framework**: Ruby on Rails
* **Database**: PostgreSQL / SQLite

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

* Ruby 3.4.4
* SQLite for development

## ⚡ Installation

### Local Development

1. **Clone the repository**
   ```bash
   git clone https://github.com/Null-logic-0/domain_monitor.git
   cd domain_monitor
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Setup the database**
   ```bash
   bin/rails db:setup
   ```

4. **Start the development server**
   ```bash
   bin/dev
   # OR 
   bin/rails server
   ```

Visit `http://localhost:3000` to see the application.

