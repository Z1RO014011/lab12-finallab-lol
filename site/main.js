const reduceMotion = window.matchMedia("(prefers-reduced-motion: reduce)");
const root = document.documentElement;
const revealItems = document.querySelectorAll("[data-reveal]");
const heroItems = document.querySelectorAll("[data-animate]");

root.classList.add("js-ready");

function showImmediately() {
  root.classList.add("hero-ready");
  heroItems.forEach((item) => item.classList.add("is-visible"));
  revealItems.forEach((item) => item.classList.add("is-visible"));
}

function startHeroSequence() {
  root.classList.add("hero-ready");
  heroItems.forEach((item, index) => {
    window.setTimeout(() => {
      item.classList.add("is-visible");
    }, 140 * index);
  });
}

if (reduceMotion.matches) {
  showImmediately();
} else {
  window.addEventListener("load", () => {
    window.requestAnimationFrame(() => {
      startHeroSequence();
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
