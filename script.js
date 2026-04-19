const revealItems = document.querySelectorAll(".reveal");

const showHashTarget = () => {
  if (!window.location.hash) {
    return;
  }

  const target = document.querySelector(window.location.hash);
  if (target?.classList.contains("reveal")) {
    target.classList.add("visible");
  }
};

if ("IntersectionObserver" in window) {
  const observer = new IntersectionObserver(
    (entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          entry.target.classList.add("visible");
          observer.unobserve(entry.target);
        }
      });
    },
    {
      threshold: 0.15,
    }
  );

  revealItems.forEach((item) => observer.observe(item));
  showHashTarget();
  window.addEventListener("hashchange", showHashTarget);
} else {
  revealItems.forEach((item) => item.classList.add("visible"));
}
