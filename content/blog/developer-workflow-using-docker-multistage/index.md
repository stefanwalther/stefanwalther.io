+++
title = "Improving my developer's workflow"
description = "How I am improving my developer's workflow using Docker for typical node.js/express applications."
categories = ["Docker", "node.js"]
date = "2019-09-19"
linktitle = ""
featured = "header.png"
featuredpath = "~"
featuredalt = ""
author = "Stefan Walther"
type = "post"
slug = ""
draft = "true"
+++

## Motivation

I am continuously trying to improve my developer's workflow. As my (current) stack is heavily relying on node.js and Docker, here are some finding how I could improve the day-to-day workflow.

## Requirements

Let's assume I have a simple express.js application - using MongoDB as a data source - with the following requirements:

- Everything should be **dockerized**:
  - Containers should not be polluted with development/testing stuff.
- I want to be able to **develop locally**:
  - Whenever I make changes locally, I immediately want to **run the test locally**.
  - **Debugging** inside the containers should be possible.
- CI/CD:
  - I want to be able to push the changes to GitHub, then to CircleCI and finally push an **optimized** Docker image.

With all these requirements, you could certainly write different Dockerfiles, but I was actually seeking for ONE COMMON solution, which meets all the requirements.

This is what I have come up with.

## My Setup

### Scripts

Note: These commands are meant to run either inside the container or outside the container, they work in both contexts.

**`start`**  
Just start the application, e.g. `node ./src/index.js`.

**`start:watch`**  
As I do not want to install [nodemon](https://nodemon.io/) inside the container, I install it when actually needing to watch the changes:
```
"start:watch": "(npm list nodemon -g || npm install nodemon -g) && nodemon --exec npm run start"
```
Note: In older versions of node.js, you'll need the legacy flag (`-L`) to get nodemon working.


