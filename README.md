# Palindrome App

A simple Flutter application with 3 screens, demonstrating form handling, navigation, and REST API consumption.

---

## 📱 Screens Overview

### 1️⃣ First Screen

- Contains **two input fields**:
  - One for entering the user's **name**
  - One for entering a **sentence** to check if it is a palindrome  
    Examples of palindromes:
    - `"kasur rusak"` → ✅ `isPalindrome`
    - `"step on no pets"` → ✅ `isPalindrome`
    - `"put it up"` → ✅ `isPalindrome`
    - `"suitmedia"` → ❌ `not palindrome`

- Two buttons:
  - **Check** → Displays a dialog:
    - `isPalindrome` → if the sentence is a palindrome
    - `not palindrome` → otherwise
  - **Next** → Navigates to the **Second Screen**

---

### 2️⃣ Second Screen

- Shows:
  - Static text: `"Welcome"`
  - Dynamic text:
    - The user's name (from First Screen)
    - The selected user's name (default empty)

- Button: **Choose a User**
  - Navigates to the **Third Screen**

---

### 3️⃣ Third Screen

- Displays a **list of users** fetched from [`https://reqres.in/api/users`](https://reqres.in/api/users)
  - Shows each user's **avatar**, **first name**, **last name**, and **email**
- Features:
  - **Pull to refresh**
  - **Infinite scroll** (pagination via `page` and `per_page` params)
  - **Empty state** if no data is available
- When a user item is clicked:
  - The selected user's name is shown on the **Second Screen**
  - (It does **not** navigate to a new screen)

---

## 🚀 Getting Started

This project is built using Flutter. Make sure you have Flutter installed:

```bash
flutter pub get
flutter run
