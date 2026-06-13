# Apple Cinematic Team Site Design

## Overview

This document defines the redesign of the static team website in `site/` for Lab 12. The goal is to replace the current card-based layout with an Apple-inspired cinematic landing page that still clearly satisfies the assignment requirements.

The redesigned page must:

- feel closer to an Apple product microsite than a typical class profile page
- use oversized typography, strong visual rhythm, and controlled motion
- emphasize both team members visually while preserving all required identity information
- keep the final page fully static and deployable through the existing Nginx container
- remain readable, responsive, and lightweight enough for local demo use

## Goals

- Create a stronger first impression with a dark, cinematic hero section.
- Keep both members highly visible without splitting them into two isolated full screens.
- Preserve complete member information:
  - Chinese name
  - English name
  - student ID
  - short responsibility summary
- Present the lab as a polished two-app deployment project, not just a biography page.
- Add Apple-like motion:
  - calm intro animation
  - scroll-triggered reveal
  - subtle parallax
  - sticky storytelling where helpful

## Non-Goals

- No React, build tooling, or animation library migration.
- No backend changes.
- No replacement of the Vikunja app or Docker topology.
- No video-like heavy effects that would hurt performance or look flashy instead of premium.

## Experience Direction

The site should feel like an Apple campaign page with a dark opening sequence and a brighter information finish.

Visual principles:

- oversized headlines with very short copy blocks
- high contrast dark hero, then gradual transition into bright content sections
- large image-led composition instead of small profile cards
- restrained palette: near-black, off-white, cool gray, and one subtle blue accent if needed
- premium spacing and minimal chrome

Motion principles:

- movement should support storytelling, not decoration
- animations should be smooth, slow enough to feel premium, and limited in count
- the page should feel layered while still remaining simple to read

## Content Architecture

The final page uses five narrative layers inside a single long-scroll homepage.

### 1. Hero

Purpose:

- deliver the strongest Apple-like first impression
- establish the team identity immediately

Content:

- team name `LOL`
- one short statement line about the team or project
- large paired member imagery
- minimal supporting text only

Behavior:

- page opens on a dark background
- title fades in and lifts slightly upward
- supporting line appears a fraction later
- hero images appear with soft fade plus subtle scale

### 2. Project Statement

Purpose:

- reconnect the cinematic opening to the actual lab submission

Content:

- one large statement such as `Two members. Two apps. One deployment flow.`
- one short paragraph explaining the static site + Vikunja deployment

Behavior:

- transitions from dark or charcoal into a lighter visual field
- statement reveals first, then description

### 3. Team Showcase

Purpose:

- give both members strong visual presence while keeping their full details together in one major showcase block

Structure:

- one shared large section containing both members
- both images should appear large and intentional
- information for both members must be complete and easy to scan

Required information per member:

- Chinese name
- English name
- student ID
- one short role description

Presentation model:

- users first encounter the visual presence of both members
- as they scroll, each member’s name and details reveal in sequence within the same overall section
- the block may briefly use sticky positioning so the content feels narrated rather than dumped

Why this structure:

- it keeps the Apple-style storytelling feel
- it avoids turning the page into two separate biography screens
- it still gives both people strong emphasis and complete information

### 4. Project Highlights

Purpose:

- show the technical value of the assignment in a compact, premium layout

Content:

- static website served by Nginx
- one-command startup via Docker Compose
- open-source Todo application using Vikunja
- same-machine deployment story

Presentation:

- bright section with concise highlight blocks
- more structured than the earlier sections, but still visually elegant

### 5. Access and Submission Footer

Purpose:

- provide the practical teacher-facing details clearly

Content:

- Website URL
- Todo App URL
- repository/public submission reminder
- optional short deployment note

Presentation:

- clean, bright ending section
- low visual noise
- information-first layout

## Layout System

### Desktop

- wide cinematic hero with strong top spacing
- large max-width container, but hero imagery may intentionally break the inner grid
- alternating dense and airy sections to create scroll rhythm

### Tablet

- preserve oversized typography, reduce image spread
- team showcase remains visually strong but stacks more carefully

### Mobile

- no horizontal scroll
- large typography remains, but line lengths must tighten
- team showcase becomes vertically ordered while preserving reveal timing
- student IDs and names must remain readable without overlap

## Typography

Typography should feel closer to Apple editorial pages than a student presentation slide.

Rules:

- extra-large display headline in hero
- large but calmer section headlines below
- body copy kept short and readable
- letter spacing slightly tightened on major headlines
- avoid decorative serif styling in the redesign

Recommended direction:

- modern grotesk or sans family with premium weight range
- display scale driven by `clamp(...)`
- body text around 16px minimum on mobile

## Color and Surface Design

Primary palette:

- near-black hero background
- soft white or off-white content backgrounds
- cool neutral grays for text hierarchy
- very restrained accent color only for links or small interface markers

Surface rules:

- do not rely on heavy glassmorphism
- keep cards minimal or nearly invisible
- use contrast, spacing, and image scale more than borders and decoration

## Motion Specification

All motion must be implementable with static HTML/CSS/JavaScript.

### Load Motion

- hero title: fade + upward reveal
- hero supporting text: delayed fade
- hero images: soft fade + slight scale from larger to settled size

### Scroll Motion

- section headings reveal before body copy
- images reveal with gentle translate/opacity motion
- team details enter in sequence instead of all at once

### Team Showcase Motion

- both portraits appear as a shared visual composition
- each member’s metadata reveals progressively as the user scrolls
- optional sticky wrapper can hold the section briefly while the text sequence changes

### Parallax

- use only light parallax
- imagery may move more slowly than text
- no aggressive 3D transforms

### Interaction Motion

- links and buttons use 150ms to 300ms transitions
- subtle hover lift or opacity shift only

### Accessibility Motion Rule

- support `prefers-reduced-motion: reduce`
- when reduced motion is requested, transforms should be removed and reveals should become near-instant

## Technical Implementation

Implementation remains inside the existing static site.

Files expected to change:

- `site/index.html`
- `site/styles.css`
- optionally a new small script file such as `site/main.js`

Implementation approach:

- semantic section-based HTML
- CSS custom properties for spacing, color, and timing
- `IntersectionObserver` for scroll-triggered reveal classes
- `transform` and `opacity` only for animation
- optional `position: sticky` in the Team Showcase if it remains stable on mobile

## Content Writing Direction

Copy should be shorter and more declarative than the current version.

Guidelines:

- one strong line per section
- one short explanatory paragraph when needed
- avoid long academic descriptions
- keep role descriptions precise and human-readable

## Accessibility and Quality Requirements

- preserve alt text for both member images
- maintain visible text contrast on dark and light surfaces
- keep heading hierarchy valid
- ensure content is usable by keyboard and without animation
- avoid hiding key identity information behind hover-only interactions

## Verification Plan

After implementation, verify:

- the page loads correctly at `http://localhost:8080`
- both member identities and student IDs are fully visible
- the page feels Apple-inspired without losing the lab information
- animations trigger smoothly on desktop and mobile widths
- reduced motion mode does not break readability
- no horizontal overflow appears on mobile

## Acceptance Criteria

The redesign is complete when:

- the homepage clearly looks different from the current card layout
- the first screen feels cinematic and Apple-inspired
- both members are visually emphasized together in one major showcase section
- all member information remains fully present
- the page includes meaningful but restrained motion
- the assignment deployment details remain easy for the teacher to find
