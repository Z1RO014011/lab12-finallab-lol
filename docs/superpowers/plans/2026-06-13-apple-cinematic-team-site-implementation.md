# Apple Cinematic Team Site Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Rebuild the static Lab 12 team website as an Apple-inspired cinematic landing page with strong motion, dual-member emphasis, and preserved assignment details.

**Architecture:** Keep the project as a static Nginx-served site. Replace the current card layout with a long-scroll semantic HTML structure, a new CSS design system for Apple-like visual rhythm, and a tiny `IntersectionObserver`-based JavaScript controller for load and scroll animations. Keep validation in shell so GitHub Actions can continue checking the project without adding a frontend toolchain.

**Tech Stack:** HTML, CSS, vanilla JavaScript, shell validation script, Docker/Nginx

---

## File Structure

- Modify: `.gitignore`
  - Ignore local brainstorm artifacts so the redesign workflow does not pollute the repo.
- Modify: `tests/check_lab12.sh`
  - Update content checks to match the new homepage structure, new copy, and JavaScript animation entrypoint.
- Modify: `site/index.html`
  - Replace the current card-based layout with the new five-layer Apple-style narrative structure.
- Modify: `site/styles.css`
  - Replace the warm glass-card design with a dark-to-light cinematic visual system and responsive motion-ready layout.
- Create: `site/main.js`
  - Add load, reveal, and reduced-motion-aware scroll behavior with `IntersectionObserver`.

### Task 1: Ignore Brainstorm Artifacts

**Files:**
- Modify: `.gitignore`
- Test: `.gitignore`

- [ ] **Step 1: Add the failing ignore expectation**

Add this line to the repo ignore list:

```gitignore
.superpowers/
```

- [ ] **Step 2: Verify the ignore rule is currently missing**

Run:

```bash
grep -n '\.superpowers/' .gitignore
```

Expected: exit code `1` before the change because `.superpowers/` is not yet ignored.

- [ ] **Step 3: Add the ignore rule**

Update `.gitignore` to this shape:

```gitignore
.DS_Store
.superpowers/

db/*
files/*

!db/.gitkeep
!files/.gitkeep
```

- [ ] **Step 4: Verify the ignore rule now exists**

Run:

```bash
grep -n '\.superpowers/' .gitignore
```

Expected: one matching line such as `2:.superpowers/`.

- [ ] **Step 5: Commit**

```bash
git add .gitignore
git commit -m "chore: ignore brainstorm artifacts"
```

### Task 2: Rebuild the Homepage Markup and Update Static Checks

**Files:**
- Modify: `site/index.html`
- Modify: `tests/check_lab12.sh`
- Test: `tests/check_lab12.sh`

- [ ] **Step 1: Expand the validation script with failing redesign checks**

Add these checks to `tests/check_lab12.sh` after the existing required file checks:

```sh
require_file "site/main.js"

require_contains "site/index.html" "Apple-inspired cinematic homepage"
require_contains "site/index.html" "Two members. Two apps. One deployment flow."
require_contains "site/index.html" "data-section=\"hero\""
require_contains "site/index.html" "data-section=\"team-showcase\""
require_contains "site/index.html" "Zhang Hanrui"
require_contains "site/index.html" "Liang Rutao"
require_contains "site/index.html" "20232098"
require_contains "site/index.html" "20242225"
require_contains "site/index.html" "http://localhost:8080"
require_contains "site/index.html" "http://localhost:3456"
require_contains "site/index.html" "main.js"
require_not_contains "site/index.html" "member-card"
require_not_contains "site/index.html" "Basic Development and Operation · Lab 12"
```

Also replace old copy-coupled checks like these:

```sh
require_contains "site/index.html" "Docker Compose workflow"
require_contains "site/index.html" "deployment setup"
require_contains "site/index.html" "final project structure"
require_contains "site/index.html" "website content"
require_contains "site/index.html" "final demo materials"
```

with new intent-based checks:

```sh
require_contains "site/index.html" "static team profile site"
require_contains "site/index.html" "Vikunja"
require_contains "site/index.html" "Docker Compose"
require_contains "site/index.html" "same machine"
```

- [ ] **Step 2: Run validation and confirm it fails on the old homepage**

Run:

```bash
./tests/check_lab12.sh
```

Expected: FAIL with `Missing required file: site/main.js` or the first new homepage string check.

- [ ] **Step 3: Replace `site/index.html` with the new semantic structure**

Rewrite the homepage around these sections and script hook:

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>LOL Team Portfolio</title>
    <meta
      name="description"
      content="Apple-inspired cinematic homepage for the LOL team Lab 12 final project."
    />
    <link rel="stylesheet" href="./styles.css" />
    <script src="./main.js" defer></script>
  </head>
  <body>
    <main class="site-shell">
      <section class="hero" data-section="hero">
        <div class="hero-copy">
          <p class="eyebrow">Apple-inspired cinematic homepage</p>
          <h1 class="hero-title" data-animate="hero-title">LOL</h1>
          <p class="hero-statement" data-animate="hero-copy">
            Faces first. Story next.
          </p>
          <p class="hero-lede" data-animate="hero-copy">
            We built a static team profile site and deployed it with the open-source
            Vikunja Todo application on the same machine through one Docker Compose flow.
          </p>
        </div>
        <div class="hero-portraits" data-animate="hero-visual">
          <figure class="portrait portrait-daniel">
            <img src="./assets/daniel-zhang.jpg" alt="Photo of Zhang Hanrui Daniel" />
            <figcaption>张函睿 (Daniel) · 20232098</figcaption>
          </figure>
          <figure class="portrait portrait-albert">
            <img src="./assets/liang-rutao.jpg" alt="Photo of Liang Rutao Albert" />
            <figcaption>梁汝涛 (Albert) · 20242225</figcaption>
          </figure>
        </div>
      </section>

      <section class="project-statement reveal" data-section="project-statement" data-reveal>
        <p class="section-label">Project Statement</p>
        <h2>Two members. Two apps. One deployment flow.</h2>
        <p>
          This Lab 12 submission combines a static team profile site and the
          Vikunja Todo app in one local stack, launched together on the same machine.
        </p>
      </section>

      <section class="team-showcase" data-section="team-showcase">
        <div class="team-showcase-intro reveal" data-reveal>
          <p class="section-label">Team Showcase</p>
          <h2>Two people, one polished deployment story.</h2>
        </div>
        <div class="team-stage">
          <article class="member-spotlight reveal" data-reveal>
            <div class="member-visual">
              <img src="./assets/daniel-zhang.jpg" alt="Photo of Zhang Hanrui Daniel" />
            </div>
            <div class="member-details">
              <p class="member-label">Member 1</p>
              <h3>张函睿 <span>(Daniel / Zhang Hanrui)</span></h3>
              <p class="member-id">Student ID: 20232098</p>
              <p>
                Daniel leads the deployment setup, container integration, and the
                final static team profile site structure used in this submission.
              </p>
            </div>
          </article>

          <article class="member-spotlight reveal" data-reveal>
            <div class="member-visual">
              <img src="./assets/liang-rutao.jpg" alt="Photo of Liang Rutao Albert" />
            </div>
            <div class="member-details">
              <p class="member-label">Member 2</p>
              <h3>梁汝涛 <span>(Albert / Liang Rutao)</span></h3>
              <p class="member-id">Student ID: 20242225</p>
              <p>
                Albert supports the website content, team presentation details,
                and the final public demo materials prepared for submission.
              </p>
            </div>
          </article>
        </div>
      </section>

      <section class="project-highlights reveal" data-section="project-highlights" data-reveal>
        <p class="section-label">Project Highlights</p>
        <h2>Built to satisfy the lab and still feel premium.</h2>
        <div class="highlight-grid">
          <article>
            <h3>Static team profile site</h3>
            <p>Served by Nginx from the same repo.</p>
          </article>
          <article>
            <h3>Vikunja Todo app</h3>
            <p>Integrated as the open-source productivity application.</p>
          </article>
          <article>
            <h3>Docker Compose</h3>
            <p>One command starts the full stack on the same machine.</p>
          </article>
        </div>
      </section>

      <section class="access-footer reveal" data-section="access-footer" data-reveal>
        <p class="section-label">Access</p>
        <h2>Ready for review.</h2>
        <ul class="access-list">
          <li>Website: http://localhost:8080</li>
          <li>Todo App: http://localhost:3456</li>
          <li>Repository: public GitHub submission for Lab 12</li>
        </ul>
      </section>
    </main>
  </body>
</html>
```

- [ ] **Step 4: Run validation again and confirm it now fails only on the missing script file**

Run:

```bash
./tests/check_lab12.sh
```

Expected: FAIL with `Missing required file: site/main.js`.

- [ ] **Step 5: Create the JavaScript entrypoint stub**

Create `site/main.js` with a harmless placeholder so markup validation can pass before animation logic lands:

```js
document.documentElement.classList.add("js-ready");
```

- [ ] **Step 6: Run validation and confirm markup passes**

Run:

```bash
./tests/check_lab12.sh
```

Expected: PASS with `Project structure and content checks passed.`

- [ ] **Step 7: Commit**

```bash
git add tests/check_lab12.sh site/index.html site/main.js
git commit -m "feat: rebuild homepage structure for cinematic redesign"
```

### Task 3: Replace the CSS with an Apple-Inspired Cinematic Design System

**Files:**
- Modify: `site/styles.css`
- Modify: `tests/check_lab12.sh`
- Test: `tests/check_lab12.sh`

- [ ] **Step 1: Add failing CSS expectations to the validation script**

Append these checks to `tests/check_lab12.sh`:

```sh
require_contains "site/styles.css" "--bg-dark"
require_contains "site/styles.css" ".hero-title"
require_contains "site/styles.css" ".team-showcase"
require_contains "site/styles.css" "@media (prefers-reduced-motion: reduce)"
require_contains "site/styles.css" "position: sticky"
require_not_contains "site/styles.css" "Iowan Old Style"
```

- [ ] **Step 2: Run validation and confirm CSS checks fail first**

Run:

```bash
./tests/check_lab12.sh
```

Expected: FAIL on the first new `site/styles.css` pattern because the old warm-card stylesheet is still present.

- [ ] **Step 3: Replace `site/styles.css` with the new design system**

Rewrite the stylesheet around these core blocks:

```css
:root {
  --bg-dark: #050505;
  --bg-dark-soft: #101114;
  --bg-light: #f5f5f7;
  --surface-light: #ffffff;
  --text-primary: #f5f5f7;
  --text-dark: #111111;
  --text-muted: rgba(245, 245, 247, 0.72);
  --text-muted-dark: #5f6670;
  --line-dark: rgba(255, 255, 255, 0.12);
  --line-light: rgba(17, 17, 17, 0.1);
  --accent: #4f8cff;
  --radius-xl: 32px;
  --radius-lg: 24px;
  --shadow-soft: 0 30px 80px rgba(0, 0, 0, 0.2);
  --container: min(1200px, calc(100% - 40px));
  --ease-premium: cubic-bezier(0.22, 1, 0.36, 1);
}

body {
  margin: 0;
  font-family: "SF Pro Display", "Helvetica Neue", "Arial", sans-serif;
  background:
    radial-gradient(circle at top center, rgba(79, 140, 255, 0.18), transparent 26%),
    linear-gradient(180deg, var(--bg-dark) 0%, var(--bg-dark-soft) 28%, var(--bg-light) 62%, #ffffff 100%);
  color: var(--text-primary);
}

.hero {
  width: var(--container);
  min-height: 100svh;
  margin: 0 auto;
  padding: 56px 0 48px;
  display: grid;
  align-items: end;
  gap: 32px;
}

.hero-title {
  margin: 0;
  font-size: clamp(4.8rem, 15vw, 11rem);
  line-height: 0.9;
  letter-spacing: -0.08em;
}

.hero-portraits {
  display: grid;
  grid-template-columns: repeat(2, minmax(0, 1fr));
  gap: 18px;
}

.portrait,
.member-spotlight,
.project-statement,
.project-highlights,
.access-footer {
  border: 1px solid var(--line-dark);
  border-radius: var(--radius-xl);
  overflow: hidden;
}

.team-showcase {
  background: linear-gradient(180deg, #16181c 0%, #f5f5f7 100%);
  padding: 4rem 0 6rem;
}

.team-stage {
  width: var(--container);
  margin: 0 auto;
  display: grid;
  gap: 28px;
}

.member-spotlight {
  position: sticky;
  top: 24px;
  display: grid;
  grid-template-columns: 1.05fr 0.95fr;
  background: rgba(255, 255, 255, 0.92);
  color: var(--text-dark);
  box-shadow: var(--shadow-soft);
}

.reveal {
  opacity: 0;
  transform: translateY(32px);
  transition:
    opacity 700ms var(--ease-premium),
    transform 700ms var(--ease-premium);
}

.reveal.is-visible {
  opacity: 1;
  transform: translateY(0);
}

@media (max-width: 860px) {
  .hero,
  .team-stage {
    width: min(100% - 24px, 1200px);
  }

  .hero-portraits,
  .member-spotlight {
    grid-template-columns: 1fr;
  }

  .member-spotlight {
    position: static;
  }
}

@media (prefers-reduced-motion: reduce) {
  *,
  *::before,
  *::after {
    animation: none !important;
    transition: none !important;
    scroll-behavior: auto !important;
  }

  .reveal {
    opacity: 1;
    transform: none;
  }
}
```

During the real edit, flesh out the missing section selectors around this core:

- `.site-shell`
- `.hero-copy`, `.hero-statement`, `.hero-lede`
- `.section-label`
- `.project-statement`
- `.team-showcase-intro`
- `.member-visual`, `.member-details`, `.member-id`
- `.highlight-grid`
- `.access-list`

- [ ] **Step 4: Run validation and confirm the stylesheet now satisfies static checks**

Run:

```bash
./tests/check_lab12.sh
```

Expected: PASS with `Project structure and content checks passed.`

- [ ] **Step 5: Build the static site image to catch syntax or copy errors**

Run:

```bash
docker build -t lab12-portfolio ./site
```

Expected: successful image build with no missing asset or file errors.

- [ ] **Step 6: Commit**

```bash
git add tests/check_lab12.sh site/styles.css
git commit -m "feat: add apple cinematic visual system"
```

### Task 4: Implement Load, Reveal, and Reduced-Motion-Aware Scroll Animations

**Files:**
- Modify: `site/main.js`
- Modify: `tests/check_lab12.sh`
- Test: `tests/check_lab12.sh`

- [ ] **Step 1: Add failing JavaScript behavior checks**

Append these checks to `tests/check_lab12.sh`:

```sh
require_contains "site/main.js" "IntersectionObserver"
require_contains "site/main.js" "prefers-reduced-motion: reduce"
require_contains "site/main.js" "is-visible"
require_contains "site/main.js" "hero-ready"
```

- [ ] **Step 2: Run validation and confirm the placeholder script fails**

Run:

```bash
./tests/check_lab12.sh
```

Expected: FAIL on the first `site/main.js` pattern because the placeholder file does not yet implement motion logic.

- [ ] **Step 3: Replace `site/main.js` with the motion controller**

Use a small script in this shape:

```js
const reduceMotion = window.matchMedia("(prefers-reduced-motion: reduce)");
const root = document.documentElement;
const revealItems = document.querySelectorAll("[data-reveal]");
const heroItems = document.querySelectorAll("[data-animate]");

root.classList.add("js-ready");

function showImmediately() {
  root.classList.add("hero-ready");
  revealItems.forEach((item) => item.classList.add("is-visible"));
}

if (reduceMotion.matches) {
  showImmediately();
} else {
  window.addEventListener("load", () => {
    requestAnimationFrame(() => {
      root.classList.add("hero-ready");
      heroItems.forEach((item, index) => {
        window.setTimeout(() => {
          item.classList.add("is-visible");
        }, 120 * index);
      });
    });
  });

  const observer = new IntersectionObserver(
    (entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          entry.target.classList.add("is-visible");
          observer.unobserve(entry.target);
        }
      });
    },
    {
      threshold: 0.2,
      rootMargin: "0px 0px -10% 0px",
    }
  );

  revealItems.forEach((item) => observer.observe(item));
}

reduceMotion.addEventListener("change", (event) => {
  if (event.matches) {
    showImmediately();
  }
});
```

- [ ] **Step 4: Add the corresponding hero-ready CSS hooks**

Make sure `site/styles.css` includes matching selectors such as:

```css
[data-animate] {
  opacity: 0;
  transform: translateY(24px) scale(0.985);
  transition:
    opacity 900ms var(--ease-premium),
    transform 900ms var(--ease-premium);
}

.hero-ready [data-animate].is-visible {
  opacity: 1;
  transform: translateY(0) scale(1);
}
```

- [ ] **Step 5: Run static validation again**

Run:

```bash
./tests/check_lab12.sh
```

Expected: PASS with `Project structure and content checks passed.`

- [ ] **Step 6: Rebuild the static site image**

Run:

```bash
docker build -t lab12-portfolio ./site
```

Expected: successful image build.

- [ ] **Step 7: Commit**

```bash
git add tests/check_lab12.sh site/main.js site/styles.css
git commit -m "feat: add cinematic homepage motion"
```

### Task 5: Verify the Full Redesign in Docker and the Browser

**Files:**
- Modify: none
- Test: `tests/check_lab12.sh`, Docker stack, browser

- [ ] **Step 1: Run the project validation script**

```bash
./tests/check_lab12.sh
```

Expected: PASS with `Project structure and content checks passed.`

- [ ] **Step 2: Validate the compose file**

```bash
docker compose config
```

Expected: successful merged configuration output.

- [ ] **Step 3: Start the stack with a rebuild**

```bash
docker compose up --build
```

Expected: portfolio, Vikunja, and postgres services start successfully, with the website available on `http://localhost:8080` and Vikunja on `http://localhost:3456`.

- [ ] **Step 4: Browser QA checklist**

Check these points manually in the browser:

```text
- Hero opens on a cinematic dark screen
- LOL headline feels oversized and high-contrast
- Both member images are prominent near the top
- Both members show Chinese name, English name, student ID, and role text
- Project statement reads clearly and connects back to Lab 12
- Project highlights and access URLs remain easy to find
- Scroll reveals happen smoothly without jumpy movement
- Mobile width shows no horizontal overflow
```

- [ ] **Step 5: Stop the stack after verification**

```bash
docker compose down
```

Expected: containers stop cleanly.

- [ ] **Step 6: Commit**

```bash
git add site/index.html site/styles.css site/main.js tests/check_lab12.sh .gitignore
git commit -m "feat: finish apple cinematic homepage redesign"
```

## Self-Review

### Spec Coverage

- Dark cinematic hero: covered in Task 2 markup and Task 3 styling.
- Apple-like typography and restrained palette: covered in Task 3.
- Two-member shared showcase with full identity info: covered in Task 2 and Task 3.
- Motion with load reveal, scroll reveal, and reduced-motion support: covered in Task 4.
- Preserve assignment clarity and access details: covered in Task 2 and Task 5 QA.
- Static deployment compatibility: covered in Tasks 3 through 5 via `docker build` and `docker compose`.

### Placeholder Scan

- No unfinished placeholder markers or defer-this-work wording remain.
- Each file path is explicit.
- Each validation command and expected result is explicit.

### Type Consistency

- HTML hooks and CSS/JS selectors use the same names:
  - `data-reveal`
  - `data-animate`
  - `is-visible`
  - `hero-ready`
  - `data-section="team-showcase"`
