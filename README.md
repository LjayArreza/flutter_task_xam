# flutter_task_xam
Martin Pulgar Construction is a fictitious construction company. They have approached their IT department to create a new mobile app for their ground staff to upload photos. You are asked to build this app for them.

## Code Structure
```
-- .env
    -- .env.dev
    -- .env.prod
-- lib
    -- app
        -- config
            -- color_constants.dart
        -- core
            -- base
                -- base_binding.dart
                -- base_controller.dart
                -- base_view.dart
            -- routes
                -- app_pages.dart
                -- routes.dart
            -- utils
                -- image_utils.dart
                -- loading_utils.dart
        -- services
            -- api
                -- api_endpoint.dart
                -- api_method.dart
            -- dio_service.dart
            -- environment.dart
    -- data
        -- model
            -- upload_photo_response.dart
    -- domain
        -- upload_photo_repository.dart
    -- presentation
        -- bindings
            -- upload_photo.binding.dart
        -- controllers
            -- upload_photo.controller.dart
        -- views
            -- upload_photo.view.dart
        -- widgets
            -- add_photo_section.widget.dart
            -- comments_section.widget.dart
            -- details_section.widget.dart
            -- link_existing_event_section.widget.dart
    -- main.dart
    test
        -- add_photo_section_unit_test.dart
        -- add_photo_section_widget_test.dart
        -- add_photo_section_integration_test.dart
```

## Packages Used
```
-- dio
-- get
-- logger
-- flutter_dotenv
-- image_picker
-- flutter_typehead
-- intl
-- fluttertoast
```

## Code Structure Documentation
```
.env :
  - This directory contains environment configuration files.
.env.dev:
  - Development environment configuration.
.env.prod:
  - Production environment configuration.

app:
  - Contains the core of the application.
config:
  - Holds configuration files.
color_constants.dart:
  - Defines color constants for the application.
core:
  - Contains fundamental components of the application.
base:
  - Provides the base classes for consistent architecture.
base_binding.dart:
  - Base class for route bindings that initializes dependencies.
base_controller.dart:
  - Base class for controllers that provides common functionalities.
base_view.dart:
  - Base class for views that enforces a common structure.
routes:
  - Manages the application's routing configuration.
app_pages.dart:
  - Centralized list of app page definitions.
routes.dart:
  - Defines the application's routes and their corresponding pages.
utils:
  - Utility functions used throughout the application.
image_utils.dart:
  - Utility functions for handling images.
loading_utils.dart:
  - Utility functions for managing loading states.
services:
  - Contains various services used in the application.
api:
  - Handles API-related functionality.
api_endpoint.dart:
  - Defines API endpoints.
api_method.dart:
  - Enumerates API methods (GET, POST, etc.).
dio_service.dart:
  - Service for making HTTP requests using Dio.
environment.dart:
  - Manages environment-specific configurations.
data:
  - Contains data-related components.
model:
  - Defines data models used in the application.
upload_photo_response.dart:
  - Data model for upload photo responses.
domain:
  - Holds domain logic and repositories.
upload_photo_repository.dart:
  - Interface for interacting with photo upload-related data.
presentation:
  - Contains presentation layer components.
bindings:
  - Provides bindings between views and controllers.
upload_photo.binding.dart:
  - Binding for the upload photo view.
controllers:
  - Houses controller classes for managing view logic.
upload_photo.controller.dart:
  - Controller for the upload photo view.
views:
  - Defines the views of the application.
upload_photo.view.dart:
  - View responsible for photo uploads.
widgets:
  - Custom widgets used in various views.
add_photo_section.widget.dart:
  - Widget for adding a photo.
comments_section.widget.dart:
  - Widget for displaying comments.
details_section.widget.dart:
  - Widget for displaying details.
link_existing_event_section.widget.dart:
  - Widget for linking events.
main.dart: The entry point of the application.

test: This directory contains test files for different testing levels.
  - add_photo_section_unit_test.dart: Unit tests for the AddPhotoSection widget.
  - add_photo_section_widget_test.dart: Widget tests for the AddPhotoSection widget.
  - add_photo_section_integration_test.dart: Integration tests for the AddPhotoSection widget.

```

This directory structure follows a clean architecture modular approach, separating different concerns of the application such as data, domain logic, presentation, and testing. It promotes maintainability and scalability by keeping related files together and following a clear naming convention. The structure facilitates collaboration among team members and allows for easier debugging and testing.





