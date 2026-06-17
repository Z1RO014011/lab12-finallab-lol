# Lab 12 Final Project

This repository contains our Lab 12 final submission: a team profile website and an open-source Todo application running together on one machine with Docker Compose.

## Team Information

- Group name: `LOL`
- Member 1: 张函睿 (Daniel)
- Student ID 1: `20232098`
- photo 1: `site/assets/daniel-zhang.jpg`
- Member 2: 梁汝涛 (Albert)
- Student ID 2: `20242225`
- photo 2: `site/assets/liang-rutao.jpg`
- Team logo: `site/assets/team-transition-glow.png`

## Team Overview

LOL is a two-person team focused on combining clear presentation with practical deployment work. In this project, we package a static website, connect the open-source Vikunja Todo app, and launch both services through a single Docker Compose workflow.

The current homepage uses an Apple-inspired cinematic layout with oversized typography, motion-based section reveals, a dedicated team logo transition section, and a two-member showcase designed for the final Lab 12 presentation.

## Application URLs

- Personal Website: [http://localhost:8080](http://localhost:8080)
- Todo App (Vikunja): [http://localhost:3456](http://localhost:3456)

## Project Structure

- `site/`: static team website served by Nginx
- `site/assets/team-transition-glow.png`: the LOL team logo used in the logo transition section
- `docker-compose.yml`: starts the website, Vikunja, and PostgreSQL together
- `.github/workflows/ci.yml`: builds the website image and validates the compose file
- `files/`: local storage for Vikunja uploads
- `db/`: local storage for PostgreSQL data

## How To Run Locally

1. Open a terminal in this project root.
2. Run `docker compose up --build`.
3. Visit `http://localhost:8080` for the personal website.
4. Visit `http://localhost:3456` for the Todo app.

## Submission Package

- Public GitHub repository with this project and README
- Personal website showing both team members and photos
- Running Todo application on the same machine
- `.mp4` screen recording of the full workflow
- Final repository URL and video submission for the assignment

## Notes

- This project uses [Vikunja](https://vikunja.io/) as the required open-source Todo application.
- On macOS with Docker Desktop, the `files/` bind mount usually works without running `chown 1000`.
- If the teacher requires contribution percentages, they can be added to this README before final submission.
