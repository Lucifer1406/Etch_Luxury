import { useEffect, useRef } from "react";

export function useScrollFadeIn() {
  const ref = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            entry.target.classList.add("visible");
          }
        });
      },
      { threshold: 0.1 }
    );

    const el = ref.current;
    if (el) {
      const sections = el.querySelectorAll(".fade-in-section");
      sections.forEach((s) => observer.observe(s));
    }

    return () => observer.disconnect();
  }, []);

  return ref;
}
