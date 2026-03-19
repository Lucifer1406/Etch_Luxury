import { Link } from "react-router-dom";
import { useScrollFadeIn } from "@/hooks/useScrollFadeIn";
import Layout from "@/components/Layout";
import processSourcing from "@/assets/process-sourcing.jpg";
import processMold from "@/assets/process-mold.jpg";
import processPour from "@/assets/process-pour.jpg";
import processSand from "@/assets/process-sand.jpg";
import processFinish from "@/assets/process-finish.jpg";

const steps = [
  {
    num: "01",
    title: "Sourcing the Wood",
    desc: "Handpicked solid walnut or acacia slabs, chosen for their natural grain, character, and live-edge beauty.",
    image: processSourcing,
  },
  {
    num: "02",
    title: "Mold & Design",
    desc: "Custom sizing, colour planning, and layout — every piece is mapped before the first pour.",
    image: processMold,
  },
  {
    num: "03",
    title: "Resin Pour",
    desc: "Pigments, metallics, and flow art come together. Each pour is a live performance — unpredictable and unrepeatable.",
    image: processPour,
  },
  {
    num: "04",
    title: "Cure & Sand",
    desc: "48-hour cure followed by multi-stage sanding — from rough grit to silky smooth finish.",
    image: processSand,
  },
  {
    num: "05",
    title: "Seal & Finish",
    desc: "Food-safe topcoat, handle fitting, and final quality inspection. Ready to be cherished.",
    image: processFinish,
  },
];

export default function Process() {
  const containerRef = useScrollFadeIn();

  return (
    <Layout>
      <div ref={containerRef}>
        <section className="pt-32 pb-16 px-6 max-w-6xl mx-auto">
          <h1 className="font-heading text-4xl md:text-5xl text-center font-light tracking-wide mb-4">
            Our Process
          </h1>
          <p className="text-center text-muted-foreground text-sm tracking-widest uppercase mb-20">
            From raw slab to finished masterpiece
          </p>

          <div className="space-y-24 md:space-y-32">
            {steps.map((step, i) => (
              <div
                key={step.num}
                className={`fade-in-section flex flex-col gap-8 md:gap-16 items-center ${
                  i % 2 === 0 ? "md:flex-row" : "md:flex-row-reverse"
                }`}
              >
                <div className="md:w-1/2">
                  <div className="overflow-hidden">
                    <img
                      src={step.image}
                      alt={step.title}
                      className="w-full h-80 md:h-[28rem] object-cover hover:scale-105 transition-transform duration-700"
                    />
                  </div>
                </div>
                <div className="md:w-1/2 max-w-md">
                  <span className="font-heading text-6xl md:text-8xl text-primary/20 font-light">
                    {step.num}
                  </span>
                  <h2 className="font-heading text-2xl md:text-3xl tracking-wide mt-2 mb-4">
                    {step.title}
                  </h2>
                  <p className="text-muted-foreground leading-relaxed">{step.desc}</p>
                </div>
              </div>
            ))}
          </div>
        </section>

        {/* Banner */}
        <section className="fade-in-section bg-dark-surface py-20 md:py-28 mt-24">
          <p className="font-heading text-2xl md:text-4xl italic text-cream text-center px-6 font-light max-w-3xl mx-auto leading-relaxed">
            "Every piece takes 5–7 days of careful handwork."
          </p>
        </section>

        {/* CTA */}
        <section className="fade-in-section py-20 md:py-28 text-center px-6">
          <h2 className="font-heading text-3xl md:text-4xl font-light tracking-wide mb-4">
            Want something custom?
          </h2>
          <p className="text-muted-foreground mb-10 max-w-md mx-auto">
            Tell us your vision — size, colours, and purpose — and we'll craft it just for you.
          </p>
          <Link
            to="/contact"
            className="inline-block px-10 py-3 bg-primary text-primary-foreground text-sm tracking-[0.2em] uppercase hover:bg-primary/90 transition-colors duration-300"
          >
            Commission a Piece
          </Link>
        </section>
      </div>
    </Layout>
  );
}
