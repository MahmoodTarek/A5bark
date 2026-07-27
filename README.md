# A5bark 📰

A modern Flutter news application that allows users to browse news by category, explore different news sources, read article previews, and open the complete article from the original publisher.

A5bark is built with a scalable Flutter architecture using BLoC/Cubit for state management, Retrofit and Dio for network communication, Injectable and GetIt for dependency injection, and local storage solutions for data persistence.

---

## Table of Contents

* [Overview](#overview)
* [Features](#features)
* [Application Flow](#application-flow)

  * [Splash Screen](#1-splash-screen)
  * [Select News Category](#2-select-news-category)
  * [Browse News Sources](#3-browse-news-sources)
  * [Browse Articles](#4-browse-articles)
  * [Article Preview](#5-article-preview)
  * [Open Full Article](#6-open-full-article)
* [App Preview](#app-preview)
* [Project Architecture](#project-architecture)
* [Test Structure](#test-structure)
* [State Management](#state-management)
* [Network Layer](#network-layer)
* [Dependency Injection](#dependency-injection)
* [Local Storage & Connectivity](#local-storage--connectivity)
* [Localization](#localization)
* [Technologies & Dependencies](#technologies--dependencies)
* [Getting Started](#getting-started)
* [Environment Flavors](#environment-flavors)
* [Project Goals](#project-goals)
* [Author](#author)

---

## Overview

A5bark provides a simple and intuitive way to discover news from multiple categories and sources.

Users can:

1. Select a news category.
2. Browse available news sources.
3. Select a source.
4. Explore the latest articles.
5. Preview an article inside a Bottom Sheet.
6. Open the complete article from the original news website.

---

## Features

* Splash Screen with Light and Dark Mode support.
* Browse news by category:

  * General
  * Business
  * Sports
  * Health
  * Science
  * Technology
  * Entertainment
* Browse available news sources.
* Select a source using horizontal tabs.
* Fetch articles based on the selected source.
* Display article images, titles, authors, and publication dates.
* Display relative publication time.
* Preview article details inside a Bottom Sheet.
* Open the complete article from the original publisher.
* Network communication using Dio and Retrofit.
* State management using Flutter BLoC/Cubit.
* Dependency Injection using Injectable and GetIt.
* Image caching using Cached Network Image.
* Localization support.
* Local data persistence using Hive and Shared Preferences.
* Network connectivity monitoring.

---

# Application Flow

## 1. Splash Screen

When the application starts, the user is presented with the splash screen.

The splash screen supports both Light Mode and Dark Mode.

### Android 12+

|                                                                                Light Mode                                                                                |                                                                                Dark Mode                                                                                |
| :----------------------------------------------------------------------------------------------------------------------------------------------------------------------: | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| <img src="https://github.com/user-attachments/assets/b16df82a-e1d7-4d87-83e4-1c02dfbe6c3b" width="220" alt="A5bark splash screen in light mode on Android 12 and above"> | <img src="https://github.com/user-attachments/assets/cd23d0cc-672d-421a-a49f-c83eb4e7a066" width="220" alt="A5bark splash screen in dark mode on Android 12 and above"> |

### Android 11 and Below

|                                                                                Light Mode                                                                                |                                                                                Dark Mode                                                                                |
| :----------------------------------------------------------------------------------------------------------------------------------------------------------------------: | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| <img src="https://github.com/user-attachments/assets/d1947af8-4e05-43fb-9afc-d9958010eea5" width="220" alt="A5bark splash screen in light mode on Android 11 and below"> | <img src="https://github.com/user-attachments/assets/083e79f0-1e6b-46a0-9b45-ede0935c8474" width="220" alt="A5bark splash screen in dark mode on Android 11 and below"> |

---

## 2. Select News Category

The user can select one of the following categories:

```text
General
Business
Sports
Health
Science
Technology
Entertainment
```

|                                                                     Light Mode                                                                     |                                                                     Dark Mode                                                                     |
| :------------------------------------------------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------------------------------------------: |
| <img src="https://github.com/user-attachments/assets/26a7be2f-8a3d-4b29-a901-9efbe55b78b8" width="280" alt="A5bark news categories in light mode"> | <img src="https://github.com/user-attachments/assets/fe96cb09-a10b-435e-b95b-107fa698eb4f" width="280" alt="A5bark news categories in dark mode"> |

---

## 3. Browse News Sources

After selecting a category, the application displays the available news sources in a horizontal tab layout.

The selected source determines which articles are displayed.

|                                                                      Light Mode                                                                      |                                                                      Dark Mode                                                                      |
| :--------------------------------------------------------------------------------------------------------------------------------------------------: | :-------------------------------------------------------------------------------------------------------------------------------------------------: |
| <img src="https://github.com/user-attachments/assets/2a5e741b-e692-446f-a85b-4ca0187875cd" width="350" alt="A5bark news sources tabs in light mode"> | <img src="https://github.com/user-attachments/assets/14f2a0a0-664f-4d32-860b-18fa26700278" width="350" alt="A5bark news sources tabs in dark mode"> |

---

## 4. Browse Articles

After selecting a source, the application fetches and displays the available articles.

Each article contains:

* Article image
* Article title
* Author name
* Publication date
* Relative time since publication

|                                                                     Light Mode                                                                     |                                                                     Dark Mode                                                                     |
| :------------------------------------------------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------------------------------------------: |
| <img src="https://github.com/user-attachments/assets/da150531-eb8e-4512-a4b8-e5b51409dec5" width="280" alt="A5bark articles screen in light mode"> | <img src="https://github.com/user-attachments/assets/4ce55737-d826-4449-bbec-6b58dc86b79b" width="280" alt="A5bark articles screen in dark mode"> |

---

## 5. Article Preview

When the user taps an article, a Bottom Sheet is displayed.

The Bottom Sheet contains:

* Article image
* A preview of the article content
* A button to open the complete article

|                                                                  Full Article URL                                                                     |                                                              ArticleDetails Preview                                                              |
| :-----------------------------------------------------------------------------------------------------------------------------------------------: | :----------------------------------------------------------------------------------------------------------------------------------------: |
| <img src="https://github.com/user-attachments/assets/d850dc5d-fd03-4f7f-b111-b8dd7e36feee" width="280" alt="A5bark article preview bottom sheet"> | <img src="https://github.com/user-attachments/assets/bea34e74-c57b-4424-9549-51903d97c1c3" width="280" alt="A5bark full article web page"> |

---

## 6. Open Full Article

When the user taps `Show All Article`, the original article URL is opened using the device's supported browser or web-view experience.

This allows users to read the complete article from the original publisher.

---

# App Preview

## Application Demo

The following video demonstrates the main application flow, including:

* Selecting a news category.
* Browsing news sources.
* Viewing articles.
* Opening the article preview.
* Opening the complete article.

<video src="https://github.com/user-attachments/assets/3e4a7f8c-7cb9-4d0d-a7b3-8cee9001bf0d" controls width="320"></video>

> If GitHub does not render the video tag correctly in the repository README, you can use the direct video URL as a fallback.

---

# Project Architecture

The project follows a feature-oriented architecture designed to keep the codebase scalable and maintainable.

```text
lib
│
├── data
│   ├── datasources
│   │   ├── remote
│   │   └── local
│   │
│   └── repositories
│       └── Repository Implementations
│
├── ui
│   ├── screens
│   │   └── home
│   │       ├── home_screen.dart
│   │       │
│   │       ├── categories
│   │       │
│   │       ├── sources
│   │       │
│   │       └── articles
│   │
│   └── widgets
│       └── Common Widgets
│
├── l10n
│   └── arb
│       ├── app_en.arb
│       └── app_id.arb
│
├── bootstrap.dart
├── main_development.dart
├── main_staging.dart
└── main_production.dart
```

---

# Test Structure

The project contains a dedicated test structure for application features and shared test utilities.

```text
test
│
├── app
│
├── features
│   └── home
│       ├── data
│       │   ├── datasources
│       │   ├── models
│       │   └── repositories
│       │
│       ├── domain
│       │   ├── entities
│       │   ├── repositories
│       │   └── usecases
│       │
│       └── ui
│           ├── screens
│           └── widgets
│
└── utils
    └── resources
```

---

# State Management

The application uses `flutter_bloc` and Cubit to manage UI state.

The Home screen is divided into independent responsibilities:

```text
Home
│
├── Categories
│
├── Sources
│   └── SourcesCubit
│
└── Articles
    └── ArticlesCubit
```

The application flow is:

```text
Select Category
        │
        ▼
Load Sources
        │
        ▼
Select Source
        │
        ▼
Load Articles
        │
        ▼
Display Articles
```

This separation keeps each part of the Home screen focused on a specific responsibility.

---

# Network Layer

The application uses:

* Dio for HTTP requests.
* Retrofit for type-safe API clients.
* Pretty Dio Logger for network debugging.

The request flow is:

```text
API Request
     │
     ▼
Dio
     │
     ▼
Retrofit API Manager
     │
     ▼
Data Source
     │
     ▼
Repository
     │
     ▼
Cubit
     │
     ▼
UI
```

---

# Dependency Injection

Dependency Injection is implemented using:

* Injectable
* GetIt

This allows dependencies such as API clients, repositories, data sources, Cubits, and local storage services to be registered and injected throughout the application.

---

# Local Storage & Connectivity

The application uses:

* Hive CE
* Shared Preferences
* Path Provider

These technologies support local data persistence and caching.

Network connectivity is monitored using `connectivity_plus` to help the application handle different connectivity states.

---

# Localization

The application supports localization using `easy_localization`.

Current localization files:

```text
lib/l10n/arb/

├── app_en.arb
└── app_id.arb
```

---

# Technologies & Dependencies

| Package              | Purpose                         |
| -------------------- | ------------------------------- |
| Flutter BLoC         | State Management                |
| Dio                  | HTTP Client                     |
| Retrofit             | Type-safe API Client            |
| Injectable           | Dependency Injection Generation |
| GetIt                | Service Locator                 |
| Hive CE              | Local Storage                   |
| Shared Preferences   | Key-Value Storage               |
| Cached Network Image | Image Caching                   |
| Easy Localization    | Localization                    |
| Connectivity Plus    | Network Connectivity            |
| URL Launcher         | Open Article URLs               |
| Google Fonts         | Typography                      |
| Flutter SVG          | SVG Assets                      |
| Pretty Dio Logger    | Network Debugging               |

---

# Getting Started

## Prerequisites

Make sure you have the following installed:

* Flutter SDK
* Dart SDK
* Android Studio or Visual Studio Code
* Android SDK

## Installation

Clone the repository:

```bash
git clone <YOUR_REPOSITORY_URL>
```

Navigate to the project directory:

```bash
cd a5bark
```

Install dependencies:

```bash
flutter pub get
```

Generate the required files:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Run the application:

```bash
flutter run
```

---

# Environment Flavors

The application supports multiple environments:

```text
Development
Staging
Production
```

Available entry points:

```text
main_development.dart
main_staging.dart
main_production.dart
```

---

# Project Goals

A5bark aims to provide a clean, simple, and scalable news browsing experience while applying modern Flutter development practices.

The project focuses on:

* Separation of responsibilities.
* Scalable project structure.
* Reusable widgets.
* Proper state management.
* Testable code.
* Dependency Injection.
* Network and local data handling.
* Maintainable Flutter architecture.

---

# Author

Developed by Mahmoud Tarek Mahmoud.

A Flutter Developer focused on building scalable and maintainable mobile applications.
